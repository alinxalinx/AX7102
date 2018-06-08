set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
############## clock define##################
create_clock -period 5 [get_ports sys_clk_p]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]


##############reset key define##################
set_property PACKAGE_PIN T6 [get_ports rst_n]
set_property IOSTANDARD LVCMOS15 [get_ports rst_n]

############## AD7606 define##################
set_property PACKAGE_PIN J14 [get_ports {ad_os[2]}]
set_property PACKAGE_PIN K14 [get_ports {ad_os[1]}]
set_property PACKAGE_PIN K13 [get_ports {ad_os[0]}]
set_property PACKAGE_PIN H14 [get_ports {ad_convstab}]
set_property PACKAGE_PIN H15 [get_ports {ad_rd}]
set_property PACKAGE_PIN J15 [get_ports {ad_reset}]
set_property PACKAGE_PIN G13 [get_ports {ad_busy}]
set_property PACKAGE_PIN H13 [get_ports {ad_cs}]
set_property PACKAGE_PIN J20 [get_ports {first_data}]
set_property PACKAGE_PIN H19 [get_ports {ad_data[0]}]
set_property PACKAGE_PIN J19 [get_ports {ad_data[1]}]
set_property PACKAGE_PIN G18 [get_ports {ad_data[2]}]
set_property PACKAGE_PIN G17 [get_ports {ad_data[3]}]
set_property PACKAGE_PIN J16 [get_ports {ad_data[4]}]
set_property PACKAGE_PIN F15 [get_ports {ad_data[5]}]
set_property PACKAGE_PIN K22 [get_ports {ad_data[6]}]
set_property PACKAGE_PIN K21 [get_ports {ad_data[7]}]
set_property PACKAGE_PIN H22 [get_ports {ad_data[8]}]
set_property PACKAGE_PIN J22 [get_ports {ad_data[9]}]
set_property PACKAGE_PIN G20 [get_ports {ad_data[10]}]
set_property PACKAGE_PIN H20 [get_ports {ad_data[11]}]
set_property PACKAGE_PIN G22 [get_ports {ad_data[12]}]
set_property PACKAGE_PIN G21 [get_ports {ad_data[13]}]
set_property PACKAGE_PIN D22 [get_ports {ad_data[14]}]
set_property PACKAGE_PIN E22 [get_ports {ad_data[15]}]

set_property IOSTANDARD LVCMOS33 [get_ports {ad_os[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_os[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_os[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_convstab}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_rd}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_busy}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_cs}]
set_property IOSTANDARD LVCMOS33 [get_ports {first_data}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_data[15]}]



############## usb uart define##################
set_property IOSTANDARD LVCMOS33 [get_ports rx]
set_property PACKAGE_PIN Y12 [get_ports rx]

set_property IOSTANDARD LVCMOS33 [get_ports tx]
set_property PACKAGE_PIN Y11 [get_ports tx]








