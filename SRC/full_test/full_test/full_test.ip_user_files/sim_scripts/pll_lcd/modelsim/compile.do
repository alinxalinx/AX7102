vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../full_test.srcs/sources_1/ip/pll_lcd/pll_lcd_clk_wiz.v" \
"../../../../full_test.srcs/sources_1/ip/pll_lcd/pll_lcd.v" \


vlog -work xil_defaultlib "glbl.v"

