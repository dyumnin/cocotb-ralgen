import sys
import os
import pprint
from pprint import PrettyPrinter
import re
from systemrdl import RDLCompiler, RDLCompileError, RDLWalker


from systemrdl import RDLListener
from systemrdl.node import FieldNode, RegNode, AddressableNode

'''
# RAL Test
RAL Test consists of 
1. Reset read test
2. Random Read Write tests

These tests use a mix of front door/backdoor access.
e.g.

|Write |Read|
| --- | ---|
| Front | Front |
| Back | Front |
| Front | Back |
| Back | Back |

A check function can only check the modified register, or check all registers to ensure that only the desired bit in the desired register is modified.

For every register we need to create 
1. A Reset value and Reset mask
2. Write mask
3. Read mask
'''

class HexPP(PrettyPrinter):
    def format(self,object,context,maxlevels,level):
        if isinstance(object, int):
            return '0x{:_X}'.format(object), True, False
        return super().format(object, context, maxlevels, level)

# Define a listener that will print out the register model hierarchy
class RALTEST(RDLListener):
    def __init__(self,file):
        self.file=file
        self.registers={}
        self.current_register=''
        print(f'''
import random
import logging
logger = logging.getLogger(__name__)
FORMAT = "[%(filename)s:%(lineno)s - %(funcName)20s() ] %(message)s"
logging.basicConfig(format=FORMAT)
              ''',file=file)

    def enter_Addrmap(self,node):
        self.registers={}
    def enter_Reg(self,node):
        self.current_register=node.get_path_segment()
        self.registers[node.get_path_segment()]={
                'reset_value':0,
                'reset_mask':0,
                'write_mask':0,
                'read_mask':0,
                'disable':[]
                }
        #print(node.__dict__,file=self.file)

    def enter_Field(self,node):
        if 'reset' in node.inst.properties:
            # print(f"{self.current_register}:{node.get_path_segment()}:::{self.registers[self.current_register]['reset_value']} |={node.get_property('reset')} << {node.high}")
            self.registers[self.current_register]['reset_value'] |= node.get_property('reset')<<node.low
            self.registers[self.current_register]['reset_mask'] |=int('1'*(node.high -node.low +1),2) <<node.low
        if node.is_sw_writable:
            self.registers[self.current_register]['write_mask'] |=int('1'*(node.high -node.low +1),2) <<node.low
        if node.is_sw_readable:
            self.registers[self.current_register]['read_mask'] |=int('1'*(node.high -node.low +1),2) <<node.low
        #print(node.inst.__dict__,file=self.file)
    def exit_Reg(self,node):
        # {'regwidth': 32}
        self.registers[self.current_register]['regwidth']=node.get_property('regwidth')
        print(node.inst.__dict__)
        if not node.has_sw_writable:
            self.registers[self.current_register]['disable'].append('rw')
        if   not node.has_sw_readable:
            self.registers[self.current_register]['disable'].extend(['rw','reset'])
        #print(f"{self.current_register}: {self.registers[self.current_register]['reset_value']:x}")
        #print(f"{self.current_register} Mask: {self.registers[self.current_register]['reset_mask']:x}")
        #print(f"{self.current_register} wr Mask: {self.registers[self.current_register]['write_mask']:x}")
        #print(f"{self.current_register} rd Mask: {self.registers[self.current_register]['read_mask']:x}")
        pass

    def exit_Addrmap(self,node):
        preg=HexPP().pformat(self.registers)
        print(f'''
        ...{node.__dict__}
class {node.get_path_segment()}_RAL_Test:
    masks={preg}
    def __init__(self,regmodel):
        self.regmodel=regmodel
        pass
    def reset_test(self,verbose=False):
        for key,val in self.masks.items():
            r=self.regmodel.__getattribute__(key)
            if 'reset' in val['disable']:
                continue
            rv=r.read()
            assert rv & val['reset_mask'] == val['reset_value'], "%s Resetvalue mismatch Actual %X,Expected %X," %(key,rv & val['reset_mask'], val['reset_value'])
            if verbose:
                logger.info("Reset Read Reg:%s, Value %s"%(key,rv))

    def rw_test(self,foreground_write=True,foreground_read=True,count=10,default_value=None,verbose=False):
        # TODO Handle background oprations
        assert foreground_write and foreground_read, "Error Background operations are not yet defined"
        for key,val in self.masks.items():
            if 'rw' in val['disable']:
                continue
            r=self.regmodel.__getattribute__(key)
            rv=None
            for _ in range(count):
                if default_value:
                    wrval=default_value
                else:
                    wrval=random.randint(0,2**val['regwidth'])
                r.write(wrval)
                rv=r.read()
                assert rv==(wrval& val['write_mask'])|(val['reset_value']& ~val['write_mask'])  & val['read_mask'],"%s:: Read Write Written %x, Read %x, Expected %x, wrMask %x rdmask %x"%(key,wrval,rv,wrval & val['write_mask'] & val['read_mask'],val['write_mask'],val['read_mask'])
            if verbose:
                logger.info("Read Write Test Reg:%s, Value %s"%(key,rv))
            ''',file=self.file)


if __name__ == "__main__":
    input_files = sys.argv[1:]
    rdlc = RDLCompiler()
    try:
        for input_file in input_files:
            rdlc.compile_file(input_file)
            root = rdlc.elaborate()
    except:
        sys.exit(1)
    walker = RDLWalker(unroll=True)
    with open('out.txt','w') as of:
        listener = RALTEST(of)
        walker.walk(root, listener)
