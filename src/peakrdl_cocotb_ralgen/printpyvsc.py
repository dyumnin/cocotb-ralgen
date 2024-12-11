import sys
import os
from systemrdl import RDLCompiler, RDLCompileError, RDLWalker


from systemrdl import RDLListener
from systemrdl.node import FieldNode, RegNode, AddressableNode

# Define a listener that will print out the register model hierarchy


class PrintPyVsc(RDLListener):
    def indent(self):
        return " " * 4 * self.indent_count

    def __init__(self, file):
        self.indent_count = 0
        self.file = file
        self.RegMap = {}
        self.AddrMap = []
        self.val_func = []
        print("import vsc\n", file=self.file)

    def isPrintable(self, node):
        return node.is_sw_writable

    def enter_Reg(self, node):
        self.Reg = node.get_path_segment()
        self.val_func = []
        print(f"@vsc.randobj\nclass {self.Reg}_Base:", file=self.file)
        self.indent_count += 1
        print(self.indent(), "def __init__(self):", file=self.file)
        self.indent_count += 1

    def exit_Reg(self, node):
        print(self.indent(), "pass", file=self.file)
        self.indent_count -= 1
        print(self.indent(), "def get_val(self):", file=self.file)
        self.indent_count += 1
        print(self.indent(), "return {", ",\n".join(self.val_func), "}", file=self.file)
        self.indent_count -= 2

    def enter_Field(self, node):
        # Print some stuff about the field
        if self.isPrintable(node):
            name = node.get_path_segment()
            print(
                self.indent(),
                f"self.{name} = vsc.rand_bit_t({1+node.high - node.low})",
                file=self.file,
            )
            self.val_func.append(f'"{name}":self.{name}')
            # if 'reset' in node.inst.properties:
            #     rst = node.inst.properties['reset']
            # else:
            #     rst=0
            # print(self.indent(),
            #       f"{node.get_path_segment()} = {hex(rst)};",
            #       file=self.file
            #       )

    def enter_Addrmap(self, node):
        self.AddrMap.append(node.inst.inst_name)
        # print(self.indent(), f"[{self.get_addrmap()}]",file=self.file)

    def exit_Addrmap(self, node):
        print(
            """
if __name__ == "__main__":
    c=Cfg_Base()
    d=Ctrl_Base()
    d.randomize()
    print(d.__dict__)
    print(d.get_val())
""",
            file=self.file,
        )
        self.AddrMap.pop()

    def get_addrmap(self):
        return ".".join(self.AddrMap)


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
    with open("default.toml", "w") as file:
        listener = PrintTOML(file)
        walker.walk(root, listener)
    # listener = PrintWriteReg()
    # walker.walk(root, listener)
