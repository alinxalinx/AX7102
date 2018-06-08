vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../full_test.srcs/pll/ip/pll/pll_clk_wiz.v" \
"../../../../full_test.srcs/pll/ip/pll/pll.v" \


vlog -work xil_defaultlib "glbl.v"

