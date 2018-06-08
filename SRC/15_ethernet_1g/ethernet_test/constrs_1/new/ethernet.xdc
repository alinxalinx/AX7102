set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

############## clock define##################
create_clock -period 5 [get_ports sys_clk_p]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]


##############reset key define##################
set_property PACKAGE_PIN T6 [get_ports reset_n]
set_property IOSTANDARD LVCMOS15 [get_ports reset_n]

############## ethernet RX define##################
create_clock -name rx_clk -period 8 [get_ports e_rxc]
set_property IOSTANDARD LVCMOS33 [get_ports e_rxc]
set_property PACKAGE_PIN K18 [get_ports e_rxc]

set_property IOSTANDARD LVCMOS33 [get_ports e_rxdv]
set_property PACKAGE_PIN M22 [get_ports e_rxdv]

set_property IOSTANDARD LVCMOS33 [get_ports e_rxer]
set_property PACKAGE_PIN N19 [get_ports e_rxer]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[0]}]
set_property PACKAGE_PIN N22 [get_ports {e_rxd[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[1]}]
set_property PACKAGE_PIN H18 [get_ports {e_rxd[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[2]}]
set_property PACKAGE_PIN H17 [get_ports {e_rxd[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[3]}]
set_property PACKAGE_PIN K19 [get_ports {e_rxd[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[4]}]
set_property PACKAGE_PIN M21 [get_ports {e_rxd[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[5]}]
set_property PACKAGE_PIN L21 [get_ports {e_rxd[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[6]}]
set_property PACKAGE_PIN N20 [get_ports {e_rxd[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[7]}]
set_property PACKAGE_PIN M20 [get_ports {e_rxd[7]}]

set_input_delay -clock rx_clk -max 3 [get_ports e_rxdv]
set_input_delay -clock rx_clk -min 2 [get_ports e_rxdv]

set_input_delay -clock rx_clk -max 3 [get_ports e_rxer]
set_input_delay -clock rx_clk -min 2 [get_ports e_rxer]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[0]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[0]}]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[1]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[1]}]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[2]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[2]}]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[3]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[3]}]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[4]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[4]}]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[5]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[5]}]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[6]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[6]}]

set_input_delay -clock rx_clk -max 3 [get_ports {e_rxd[7]}]
set_input_delay -clock rx_clk -min 2 [get_ports {e_rxd[7]}]

set_input_delay -clock rx_clk -max 3 [get_ports reset_n]
set_input_delay -clock rx_clk -min 2 [get_ports reset_n]
############## ethernet TX define##################
set_property IOSTANDARD LVCMOS33 [get_ports e_txc]
set_property PACKAGE_PIN J17 [get_ports e_txc]

set_property IOSTANDARD LVCMOS33 [get_ports e_gtxc]
set_property PACKAGE_PIN L18 [get_ports e_gtxc]

set_property IOSTANDARD LVCMOS33 [get_ports e_txen]
set_property PACKAGE_PIN M16 [get_ports e_txen]

set_property IOSTANDARD LVCMOS33 [get_ports e_txer]
set_property PACKAGE_PIN M13 [get_ports e_txer]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[0]}]
set_property PACKAGE_PIN M15 [get_ports {e_txd[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[1]}]
set_property PACKAGE_PIN L14 [get_ports {e_txd[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[2]}]
set_property PACKAGE_PIN K16 [get_ports {e_txd[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[3]}]
set_property PACKAGE_PIN L16 [get_ports {e_txd[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[4]}]
set_property PACKAGE_PIN K17 [get_ports {e_txd[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[5]}]
set_property PACKAGE_PIN L20 [get_ports {e_txd[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[6]}]
set_property PACKAGE_PIN L19 [get_ports {e_txd[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[7]}]
set_property PACKAGE_PIN L13 [get_ports {e_txd[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports e_reset]
set_property PACKAGE_PIN L15 [get_ports e_reset]

create_clock -name tx_clk -period 8 [get_ports e_gtxc]

set_output_delay -clock tx_clk -max 3 [get_ports e_txen]
set_output_delay -clock tx_clk -min 0 [get_ports e_txen]

set_output_delay -clock tx_clk -max 3 [get_ports e_txer]
set_output_delay -clock tx_clk -min 0 [get_ports e_txer]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[0]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[0]}]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[1]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[1]}]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[2]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[2]}]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[3]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[3]}]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[4]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[4]}]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[5]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[5]}]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[6]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[6]}]

set_output_delay -clock tx_clk -max 3 [get_ports {e_txd[7]}]
set_output_delay -clock tx_clk -min 0 [get_ports {e_txd[7]}]
