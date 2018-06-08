vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_clk_ibuf.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_infrastructure.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_iodelay_ctrl.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v2_4_tempmon.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_arb_mux.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_arb_row_col.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_arb_select.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_cntrl.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_common.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_compare.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_mach.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_queue.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_bank_state.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_col_mach.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_mc.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_rank_cntrl.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_rank_common.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_rank_mach.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v2_4_round_robin_arb.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_buf.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_dec_fix.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_gen.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_ecc_merge_enc.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v2_4_fi_xor.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v2_4_memc_ui_top_std.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v2_4_mem_intfc.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_byte_group_io.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_byte_lane.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_calib_top.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_if_post_fifo.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_mc_phy.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_mc_phy_wrapper.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_of_pre_fifo.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_4lanes.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_dqs_found_cal.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_dqs_found_cal_hr.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_init.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_cntlr.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_data.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_edge.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_lim.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_mux.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_po_cntlr.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_ocd_samp.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_oclkdelay_cal.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_prbs_rdlvl.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_rdlvl.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_tempmon.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_top.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_wrcal.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_wrlvl.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_phy_wrlvl_off_delay.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_ddr_prbs_gen.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_cc.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_edge_store.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_meta.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_pd.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_tap_base.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v2_4_poc_top.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_cmd.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_rd_data.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_top.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v2_4_ui_wr_data.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3_mig_sim.v" \
"../../../../../../gtp_test/ov5640_ddr_vga/ov5640_ddr_vga/ov5640_ddr_vga.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3.v" \


vlog -work xil_defaultlib "glbl.v"

