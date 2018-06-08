// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Wed Mar 15 19:16:09 2017
// Host        : LAOLUO-PC running 64-bit major release  (build 7600)
// Command     : write_verilog -force -mode synth_stub
//               E:/Project/AX7100/verilog/full_test/full_test/full_test.srcs/pll/ip/pll/pll_stub.v
// Design      : pll
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module pll(clk_in1, clk_out1, clk_out2, clk_out3, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,clk_out2,clk_out3,reset,locked" */;
  input clk_in1;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  input reset;
  output locked;
endmodule
