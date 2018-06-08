set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
############## clock define##################
create_clock -period 5 [get_ports sys_clk_p]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]


############## ADDA define##################
set_property PACKAGE_PIN H14 [get_ports {daclk}]
set_property PACKAGE_PIN J14 [get_ports {dadata[7]}]
set_property PACKAGE_PIN H15 [get_ports {dadata[6]}]
set_property PACKAGE_PIN J15 [get_ports {dadata[5]}]
set_property PACKAGE_PIN G13 [get_ports {dadata[4]}]
set_property PACKAGE_PIN H13 [get_ports {dadata[3]}]
set_property PACKAGE_PIN J21 [get_ports {dadata[2]}]
set_property PACKAGE_PIN J20 [get_ports {dadata[1]}]
set_property PACKAGE_PIN G16 [get_ports {dadata[0]}]

set_property PACKAGE_PIN K22 [get_ports {addata[0]}]
set_property PACKAGE_PIN K21 [get_ports {addata[1]}]
set_property PACKAGE_PIN H22 [get_ports {addata[2]}]
set_property PACKAGE_PIN J22 [get_ports {addata[3]}]
set_property PACKAGE_PIN G20 [get_ports {addata[4]}]
set_property PACKAGE_PIN H20 [get_ports {addata[5]}]
set_property PACKAGE_PIN G22 [get_ports {addata[6]}]
set_property PACKAGE_PIN G21 [get_ports {addata[7]}]
set_property PACKAGE_PIN D22 [get_ports {adclk}]

set_property IOSTANDARD LVCMOS33 [get_ports {daclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dadata[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {addata[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addata[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addata[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addata[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addata[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addata[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addata[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addata[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {adclk}]




