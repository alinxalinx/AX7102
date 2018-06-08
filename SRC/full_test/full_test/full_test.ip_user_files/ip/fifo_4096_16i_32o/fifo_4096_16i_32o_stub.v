// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Thu Dec 22 20:59:18 2016
// Host        : LUO running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               F:/AX7100/t1/gtp_video_example/gtp_example.srcs/sources_1/ip/fifo_4096_16i_32o/fifo_4096_16i_32o_stub.v
// Design      : fifo_4096_16i_32o
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_0_1,Vivado 2015.4" *)
module fifo_4096_16i_32o(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, almost_full, empty, almost_empty, rd_data_count, wr_data_count)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[15:0],wr_en,rd_en,dout[31:0],full,almost_full,empty,almost_empty,rd_data_count[10:0],wr_data_count[11:0]" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [15:0]din;
  input wr_en;
  input rd_en;
  output [31:0]dout;
  output full;
  output almost_full;
  output empty;
  output almost_empty;
  output [10:0]rd_data_count;
  output [11:0]wr_data_count;
endmodule
