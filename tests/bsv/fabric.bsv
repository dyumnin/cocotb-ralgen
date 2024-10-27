import Vector::*;
import AWSteria_HW_IFC    :: *;
import AWSteria_HW_Platform :: *;
import AXI4_Lite_Fabric_dyu          :: *;
import AXI4_Lite_Types      :: *;

typedef AXI4_Lite_Fabric_IFC #(1,       // num M ports
			  2,  // num S ports
			  32,      // wd_addr
			  32,     // wd_data
			  0)
        AXI4_2Slv;
typedef AXI4_Lite_Fabric_IFC #(1,       // num M ports
			  3,  // num S ports
			  32,      // wd_addr
			  32,     // wd_data
			  0)
        AXI4_3Slv;

function Tuple2 #(Bool, Bit #(TLog #(3)))  fn_3dma (Bit #(32) addr);
	let a_base=0;
	let b_base='h1000;
	let c_base='h2000;

let a_lim  = 'h1000;
let b_lim  = 'h2000;
let c_lim  = 'h3000;

   if ((a_base <= addr) && (addr < a_lim))
      return tuple2 (True, 0);

   else if ((b_base <= addr) && (addr < b_lim))
      return tuple2 (True, 1);
   else if ((c_base <= addr) && (addr < c_lim))
      return tuple2 (True, 2);
   else
      return tuple2 (False, 0);

endfunction

function Tuple2 #(Bool, Bit #(TLog #(2)))  fn_top (Bit #(32) addr);
	let a_base=0;
	let b_base='h4000;

let a_lim  = 'h4000;
let b_lim  = 'h8000;

   if ((a_base <= addr) && (addr < a_lim))
      return tuple2 (True, 0);

   else if ((b_base <= addr) && (addr < b_lim))
      return tuple2 (True, 1);
   else
      return tuple2 (False, 0);

endfunction
(* synthesize *)
module mkAXI4_3dma (AXI4_3Slv);
	Bit#(32) arr[3]={'h0fff,'h0fff,'h0fff};
	let mask=arrayToVector(arr);
   	let fabric <- mkAXI4_Lite_Fabric_dyu (fn_3dma,mask);
   return fabric;
endmodule
(* synthesize *)
module mkAXI4_top (AXI4_2Slv);
	Bit#(32) arr[2]={'h3fff,'h3fff};
   let fabric <- mkAXI4_Lite_Fabric_dyu (fn_top,arrayToVector(arr));
   return fabric;
endmodule
