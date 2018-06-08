vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp/example_design/gtp_tx_startup_fsm.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp/example_design/gtp_rx_startup_fsm.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp_init.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp_gt.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp_multi_gt.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp/example_design/gtp_gtrxreset_seq.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp/example_design/gtp_rxpmarst_seq.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp/example_design/gtp_rxrate_seq.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp/example_design/gtp_sync_block.v" \
"../../../../gtp_example.srcs/sources_1/ip/gtp/gtp.v" \


vlog -work xil_defaultlib "glbl.v"

