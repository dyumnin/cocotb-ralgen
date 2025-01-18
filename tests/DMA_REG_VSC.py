import vsc
import tomlkit
import os

# @vsc.randobj
# class Version_Base:
#      def __init__(self):
#          pass
#      def get_val(self):
#          return {  }
@vsc.randobj
class Status_Base:
     def __init__(self):
         self.a_error = vsc.rand_bit_t(1)
         self.b_error = vsc.rand_bit_t(1)
         pass
     def get_val(self):
         return { "a_error":self.a_error,
"b_error":self.b_error }
@vsc.randobj
class Ctrl_Base:
     def __init__(self):
         self.start = vsc.rand_bit_t(1)
         self.gen_interrupt = vsc.rand_bit_t(1)
         self.pd_in_b = vsc.rand_bit_t(1)
         self.from_b = vsc.rand_bit_t(1)
         self.to_a = vsc.rand_bit_t(1)
         self.use_pd = vsc.rand_bit_t(1)
         pass
     def get_val(self):
         return { "start":self.start,
"gen_interrupt":self.gen_interrupt,
"pd_in_b":self.pd_in_b,
"from_b":self.from_b,
"to_a":self.to_a,
"use_pd":self.use_pd }
     
@vsc.randobj
class Ctrl_Extnd:
    @vsc.constraint
    def Ctrl_c(self):
        self.start = 1
@vsc.randobj
class PD_Count_Base:
     def __init__(self):
         self.incr_count = vsc.rand_bit_t(1)
         pass
     def get_val(self):
         return { "incr_count":self.incr_count }
@vsc.randobj
class Cfg_Base:
     def __init__(self):
         self.a_burst_length = vsc.rand_bit_t(8)
         self.b_burst_length = vsc.rand_bit_t(8)
         self.src_burst_type = vsc.rand_bit_t(2)
         self.dest_burst_type = vsc.rand_bit_t(2)
         pass
     @vsc.constraint
     def Cfg_constraints(self):
         self.a_burst_length > 100
         self.a_burst_length > self.b_burst_length
     def get_val(self):
         return { "a_burst_length":self.a_burst_length,
"b_burst_length":self.b_burst_length,
"src_burst_type":self.src_burst_type,
"dest_burst_type":self.dest_burst_type }
@vsc.randobj
class Src_Address_Base:
     def __init__(self):
         self.address = vsc.rand_bit_t(32)
         pass
     def get_val(self):
         return { "address":self.address }
@vsc.randobj
class Dest_Address_Base:
     def __init__(self):
         self.address = vsc.rand_bit_t(32)
         pass
     def get_val(self):
         return { "address":self.address }
@vsc.randobj
class Length_Base:
     def __init__(self):
         self.length = vsc.rand_bit_t(32)
         pass
     def get_val(self):
         return { "length":self.length }
@vsc.randobj
class PacketDescriptor_Address_Base:
     def __init__(self):
         self.pd = vsc.rand_bit_t(32)
         pass
     def get_val(self):
         return { "pd":self.pd }
@vsc.randobj
class Interrupt_Base:
     def __init__(self):
         self.int_a_error = vsc.rand_bit_t(1)
         self.int_b_error = vsc.rand_bit_t(1)
         self.int_xfer_done = vsc.rand_bit_t(1)
         pass
     def get_val(self):
         return { "int_a_error":self.int_a_error,
"int_b_error":self.int_b_error,
"int_xfer_done":self.int_xfer_done }
@vsc.randobj
class Interrupt_Mask_Base:
     def __init__(self):
         self.mask_a_error = vsc.rand_bit_t(1)
         self.mask_b_error = vsc.rand_bit_t(1)
         self.mask_xfer_done = vsc.rand_bit_t(1)
         pass
     def get_val(self):
         return { "mask_a_error":self.mask_a_error,
"mask_b_error":self.mask_b_error,
"mask_xfer_done":self.mask_xfer_done }
@vsc.randobj
class Interrupt_Test_Base:
     def __init__(self):
         self.mask_a_error = vsc.rand_bit_t(1)
         self.mask_b_error = vsc.rand_bit_t(1)
         self.mask_xfer_done = vsc.rand_bit_t(1)
         pass
     def get_val(self):
         return { "mask_a_error":self.mask_a_error,
"mask_b_error":self.mask_b_error,
"mask_xfer_done":self.mask_xfer_done }

class DMA_REG_VSC:
    #Version = Version_Base
    Status = Status_Base
    Cfg = Cfg_Base

    def add_constraints_toml(self, tomlfile):
        if tomlfile:
            with open(tomlfile, "r") as f:
                constraints = tomlkit.load(f)

        if "DMA_Reg" in constraints:
            for section, values in constraints["DMA_Reg"].items():
                # Retrieve the base class dynamically
                base_class_name = f"{section}_Base"
                base_class = globals().get(base_class_name)
                if not base_class:
                    raise ValueError(f"Base class {base_class_name} not found.")

                # Define a PyVSC constraint dynamically
                def create_constraint_fn(constraints_dict):
                    @vsc.dynamic_constraint
                    def constraints_fn(self):
                        for key, value in constraints_dict.items():
                            setattr(self, key, value)
                    return constraints_fn

                # Create the constraint function
                constraints_fn = create_constraint_fn(values)

                # Dynamically create a new class with the constraint
                class_name = f"{section}_Extnd"
                constraint_class = type(class_name, (base_class,), {f"{section}_c": constraints_fn})

                # Set the new class as an attribute of the instance
                setattr(self, section, constraint_class)
    def debug_created_classes(self):
        print("Debugging dynamically created classes:")
        for attr_name in dir(self):
            if not attr_name.startswith("__") and attr_name != "debug_created_classes" and attr_name != "add_constraints_toml":
                attr = getattr(self, attr_name)
                if isinstance(attr, type):  # Check if the attribute is a class
                    print(f"Class: {attr.__name__}")
                    print(f"  Methods: {[method for method in dir(attr) if callable(getattr(attr, method)) and not method.startswith('__')]}")
                    #print(f"  Attributes: {[attr for attr in dir(attr) if not callable(getattr(attr, attr)) and not attr.startswith('__')]}")
    def randomize(self):
        #self.Version.randomize()
        self.Status().randomize()

if __name__ == "__main__":
    # c=Cfg_Base()
    # d=Ctrl_Base()

    # c.randomize()
    # print(c.__dict__)
    # print(c.get_val())
    # Path to the TOML file
    toml_file_path = "/home/vijval/cocotbPractise/cocotb-ralgen/tests/dma_constraints.toml"

    # Instantiate the DMA_REG_VSC object
    dma_regs = DMA_REG_VSC()

    # Add constraints from the TOML file
    dma_regs.add_constraints_toml(toml_file_path)

    # Debug the created classes
    dma_regs.debug_created_classes()

    # Randomize the base attributes to verify the setup
    dma_regs.randomize()