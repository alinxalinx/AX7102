set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
############## clock define##################
create_clock -period 5 [get_ports sys_clk_p]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]

##############reset key define##################
set_property PACKAGE_PIN T6 [get_ports rst_n]
set_property IOSTANDARD LVCMOS15 [get_ports rst_n]

set_property PACKAGE_PIN B18 [get_ports key1]
set_property IOSTANDARD LVCMOS33 [get_ports key1]

############## VGA define##################
set_property IOSTANDARD LVCMOS33 [get_ports vga_clk]
set_property PACKAGE_PIN U21 [get_ports vga_clk]

set_property IOSTANDARD LVCMOS33 [get_ports vga_hs]
set_property PACKAGE_PIN AA11 [get_ports vga_hs]

set_property IOSTANDARD LVCMOS33 [get_ports vga_vs]
set_property PACKAGE_PIN AA10 [get_ports vga_vs]

set_property IOSTANDARD LVCMOS33 [get_ports vga_en]
set_property PACKAGE_PIN AB20 [get_ports vga_en]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[0]}]
set_property PACKAGE_PIN W12 [get_ports {vga_r[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[1]}]
set_property PACKAGE_PIN W11 [get_ports {vga_r[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[2]}]
set_property PACKAGE_PIN V14 [get_ports {vga_r[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[3]}]
set_property PACKAGE_PIN V13 [get_ports {vga_r[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[4]}]
set_property PACKAGE_PIN T15 [get_ports {vga_r[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[5]}]
set_property PACKAGE_PIN T14 [get_ports {vga_r[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[6]}]
set_property PACKAGE_PIN W16 [get_ports {vga_r[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[7]}]
set_property PACKAGE_PIN W15 [get_ports {vga_r[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[0]}]
set_property PACKAGE_PIN V17 [get_ports {vga_g[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[1]}]
set_property PACKAGE_PIN W17 [get_ports {vga_g[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[2]}]
set_property PACKAGE_PIN U15 [get_ports {vga_g[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[3]}]
set_property PACKAGE_PIN V15 [get_ports {vga_g[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[4]}]
set_property PACKAGE_PIN AB21 [get_ports {vga_g[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[5]}]
set_property PACKAGE_PIN AB22 [get_ports {vga_g[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[6]}]
set_property PACKAGE_PIN AA21 [get_ports {vga_g[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[7]}]
set_property PACKAGE_PIN AA20 [get_ports {vga_g[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[0]}]
set_property PACKAGE_PIN AA19 [get_ports {vga_b[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[1]}]
set_property PACKAGE_PIN AA18 [get_ports {vga_b[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[2]}]
set_property PACKAGE_PIN AB18 [get_ports {vga_b[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[3]}]
set_property PACKAGE_PIN T20 [get_ports {vga_b[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[4]}]
set_property PACKAGE_PIN Y17 [get_ports {vga_b[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[5]}]
set_property PACKAGE_PIN W22 [get_ports {vga_b[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[6]}]
set_property PACKAGE_PIN W21 [get_ports {vga_b[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[7]}]
set_property PACKAGE_PIN T21 [get_ports {vga_b[7]}]

