vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/ila_v6_0_1/hdl/verilog" "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/xsdbm_v1_1_1/hdl/verilog" "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/ila_v6_0_1/hdl/verilog" "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/xsdbm_v1_1_1/hdl/verilog" "+incdir+../../../../sd_test.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" \
"../../../../sd_test.srcs/sources_1/ip/ila_0/sim/ila_0.v" \


vlog -work xil_defaultlib "glbl.v"

