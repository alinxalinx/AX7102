set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
############## clock define##################
create_clock -period 5 [get_ports sys_clk_p]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]

##############reset key define##################
set_property PACKAGE_PIN T6 [get_ports reset_n]
set_property IOSTANDARD LVCMOS15 [get_ports reset_n]


############## USB define##################
set_property IOSTANDARD LVCMOS33 [get_ports usb_slcs]
set_property PACKAGE_PIN P16 [get_ports usb_slcs]

set_property IOSTANDARD LVCMOS33 [get_ports usb_sloe]
set_property PACKAGE_PIN N13 [get_ports usb_sloe]

set_property IOSTANDARD LVCMOS33 [get_ports usb_slrd]
set_property PACKAGE_PIN P19 [get_ports usb_slrd]

set_property IOSTANDARD LVCMOS33 [get_ports usb_slwr]
set_property PACKAGE_PIN R19 [get_ports usb_slwr]

set_property IOSTANDARD LVCMOS33 [get_ports usb_flaga]
set_property PACKAGE_PIN R18 [get_ports usb_flaga]

set_property IOSTANDARD LVCMOS33 [get_ports usb_flagb]
set_property PACKAGE_PIN R14 [get_ports usb_flagb]

set_property IOSTANDARD LVCMOS33 [get_ports usb_flagc]
set_property PACKAGE_PIN P14 [get_ports usb_flagc]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fifoaddr[0]}]
set_property PACKAGE_PIN N14 [get_ports {usb_fifoaddr[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fifoaddr[1]}]
set_property PACKAGE_PIN N15 [get_ports {usb_fifoaddr[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[0]}]
set_property PACKAGE_PIN Y22 [get_ports {usb_fd[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[1]}]
set_property PACKAGE_PIN W20 [get_ports {usb_fd[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[2]}]
set_property PACKAGE_PIN W19 [get_ports {usb_fd[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[3]}]
set_property PACKAGE_PIN Y19 [get_ports {usb_fd[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[4]}]
set_property PACKAGE_PIN Y18 [get_ports {usb_fd[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[5]}]
set_property PACKAGE_PIN V22 [get_ports {usb_fd[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[6]}]
set_property PACKAGE_PIN U22 [get_ports {usb_fd[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[7]}]
set_property PACKAGE_PIN T18 [get_ports {usb_fd[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[8]}]
set_property PACKAGE_PIN R17 [get_ports {usb_fd[8]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[9]}]
set_property PACKAGE_PIN R16 [get_ports {usb_fd[9]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[10]}]
set_property PACKAGE_PIN P15 [get_ports {usb_fd[10]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[11]}]
set_property PACKAGE_PIN N17 [get_ports {usb_fd[11]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[12]}]
set_property PACKAGE_PIN P17 [get_ports {usb_fd[12]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[13]}]
set_property PACKAGE_PIN U16 [get_ports {usb_fd[13]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[14]}]
set_property PACKAGE_PIN T16 [get_ports {usb_fd[14]}]

set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[15]}]
set_property PACKAGE_PIN U17 [get_ports {usb_fd[15]}]





