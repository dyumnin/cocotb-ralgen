import sys
import os
import toml
from systemrdl import RDLCompiler, RDLCompileError, RDLWalker


from systemrdl import RDLListener
from systemrdl.node import FieldNode, RegNode, AddressableNode

# Define a listener that will print out the register model hierarchy


class PrintPyVsc(RDLListener):
    def indent(self):
        return " " * 4 * self.indent_count

    def __init__(self, file, constraints=None):
        self.indent_count = 0
        self.file = file
        self.constraints = constraints or {}
        self.RegMap = {}
        self.AddrMap = []
        self.val_func = []
        print(constraints)
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
        reg_constraints = self.constraints.get(self.get_addrmap(), {}).get(self.Reg, {}).get("constraints", [])
        print(reg_constraints)
        if reg_constraints:
            print(self.indent(), f"@vsc.constraint",file=self.file)
            print(self.indent(), f"def {self.Reg}_constraints(self):", file=self.file)
            self.indent_count += 1
            for constraint in reg_constraints:
                print(self.indent(), f"{constraint}" ,file=self.file)
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
    input_files = [f for f in sys.argv[1:] if not f.endswith(".toml")]

    toml_file = sys.argv[-1] if sys.argv[-1].endswith(".toml") else None

    constraints = {}
    if toml_file:
        with open(toml_file, "r") as f:
            constraints = toml.load(f)
    print(f"toml_file {toml_file}")
    rdlc = RDLCompiler()
    try:
        for input_file in input_files:
            rdlc.compile_file(input_file)
            root = rdlc.elaborate()
    except:
        sys.exit(1)
    walker = RDLWalker(unroll=True)
    with open("default.py", "w") as file:
        listener = PrintPyVsc(file, constraints=constraints)
        walker.walk(root, listener)
    # listener = PrintWriteReg()
    # walker.walk(root, listener)
