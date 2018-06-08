############## clock define##################
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property PACKAGE_PIN T4 [get_ports sys_clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]

############## key define##################
set_property PACKAGE_PIN T6 [get_ports rst_n]
set_property IOSTANDARD LVCMOS15 [get_ports rst_n]

set_property PACKAGE_PIN B18 [get_ports {key_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_in[0]}]

set_property PACKAGE_PIN B17 [get_ports {key_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_in[1]}]

set_property PACKAGE_PIN A16 [get_ports {key_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_in[2]}]

set_property PACKAGE_PIN A15 [get_ports {key_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_in[3]}]

############## led define##################
set_property PACKAGE_PIN C17 [get_ports {led_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[0]}]

set_property PACKAGE_PIN D17 [get_ports {led_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[1]}]

set_property PACKAGE_PIN V20 [get_ports {led_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[2]}]

set_property PACKAGE_PIN U20 [get_ports {led_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[3]}]

