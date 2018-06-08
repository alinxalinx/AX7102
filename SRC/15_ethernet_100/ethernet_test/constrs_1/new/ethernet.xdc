set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

############## clock define##################
create_clock -period 5 [get_ports sys_clk_p]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]


##############reset key define##################
set_property PACKAGE_PIN T6 [get_ports reset_n]
set_property IOSTANDARD LVCMOS15 [get_ports reset_n]

############## ethernet PORT RX define##################
create_clock -name e1_rx_clk -period 40 [get_ports e_rxc]
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

############## ethernet PORT TX define##################
set_property IOSTANDARD LVCMOS33 [get_ports e_txc]
set_property PACKAGE_PIN J17 [get_ports e_txc]

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

set_property IOSTANDARD LVCMOS33 [get_ports e_reset]
set_property PACKAGE_PIN L15 [get_ports e_reset]

create_clock -name e1_tx_clk -period 40 [get_ports e_txc]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets e_txc_IBUF] 

