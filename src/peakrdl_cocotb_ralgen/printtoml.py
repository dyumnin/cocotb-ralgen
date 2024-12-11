import sys
import os
from systemrdl import RDLCompiler, RDLCompileError, RDLWalker


from systemrdl import RDLListener
from systemrdl.node import FieldNode, RegNode, AddressableNode

# Define a listener that will print out the register model hierarchy


class PrintTOML(RDLListener):
    def __init__(self, file):
        self.indent = 0
        self.file = file
        self.AddrMap = []

    def isPrintable(self, node):
        return node.is_sw_writable

    def enter_Reg(self, node):
        self.Reg = node.get_path_segment()
        print(self.indent * "\t", f"[{self.get_addrmap()}.{self.Reg}]", file=self.file)
        self.indent += 1

    def exit_Reg(self, node):
        self.indent -= 1

    def enter_Field(self, node):
        # Print some stuff about the field
        if self.isPrintable(node):
            print((node.inst.properties))
            if "reset" in node.inst.properties:
                rst = node.inst.properties["reset"]
            else:
                rst = 0
            print(
                self.indent * "\t",
                f"{node.get_path_segment()} = {hex(rst)};",
                file=self.file,
            )

    def enter_Addrmap(self, node):
        self.AddrMap.append(node.inst.inst_name)
        print(self.indent * "\t", f"[{self.get_addrmap()}]", file=self.file)

    def exit_Addrmap(self, node):
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
