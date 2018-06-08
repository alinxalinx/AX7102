set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

############## clock define##################
create_clock -period 5 [get_ports sys_clk_p]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]

##############reset key define##################

############## RS232 uart define##################
set_property IOSTANDARD LVCMOS33 [get_ports uart2_rx]
set_property PACKAGE_PIN AB10 [get_ports uart2_rx]

set_property IOSTANDARD LVCMOS33 [get_ports uart2_tx]
set_property PACKAGE_PIN AA9 [get_ports uart2_tx]


