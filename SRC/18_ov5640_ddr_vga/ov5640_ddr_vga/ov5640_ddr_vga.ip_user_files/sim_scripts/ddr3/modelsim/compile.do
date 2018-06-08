vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_clk_ibuf.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_infrastructure.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_iodelay_ctrl.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_tempmon.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_arb_mux.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_arb_row_col.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_arb_select.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_cntrl.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_common.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_compare.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_mach.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_queue.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_state.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_col_mach.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_mc.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_rank_cntrl.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_rank_common.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_rank_mach.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_round_robin_arb.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_buf.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_dec_fix.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_gen.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_merge_enc.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_fi_xor.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v2_4_memc_ui_top_std.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v2_4_mem_intfc.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_byte_group_io.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_byte_lane.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_calib_top.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_if_post_fifo.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_mc_phy.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_mc_phy_wrapper.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_of_pre_fifo.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_4lanes.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_dqs_found_cal.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_dqs_found_cal_hr.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_init.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_cntlr.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_data.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_edge.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_lim.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_mux.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_po_cntlr.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_samp.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_oclkdelay_cal.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_prbs_rdlvl.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_rdlvl.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_tempmon.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_top.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_wrcal.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_wrlvl.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_wrlvl_off_delay.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_prbs_gen.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_cc.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_edge_store.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_meta.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_pd.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_tap_base.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_top.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_cmd.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_rd_data.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_top.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_wr_data.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3_mig_sim.v" \
"../../../../ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3.v" \


vlog -work xil_defaultlib "glbl.v"

