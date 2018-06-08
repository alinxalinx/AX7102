// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Sat Aug 06 09:33:25 2016
// Host        : LAOLUO-PC running 64-bit major release  (build 7600)
// Command     : write_verilog -force -mode synth_stub
//               e:/Project/Artix7/verilog/sd_test/sd_test/sd_test.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2015.4" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[3:0],probe1[0:0],probe2[0:0],probe3[0:0],probe4[3:0],probe5[0:0],probe6[0:0],probe7[0:0],probe8[0:0],probe9[3:0],probe10[0:0],probe11[0:0],probe12[0:0],probe13[3:0],probe14[0:0],probe15[0:0],probe16[7:0]" */;
  input clk;
  input [3:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [3:0]probe4;
  input [0:0]probe5;
  input [0:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [3:0]probe9;
  input [0:0]probe10;
  input [0:0]probe11;
  input [0:0]probe12;
  input [3:0]probe13;
  input [0:0]probe14;
  input [0:0]probe15;
  input [7:0]probe16;
endmodule
