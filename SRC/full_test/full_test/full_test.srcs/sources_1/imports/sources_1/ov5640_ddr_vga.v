/*-------------------------------------------------------------------------
Filename			:		ov5640_ddr_vga.v
Description		:		read picture from sd, and store in ddr, display on VGA.
===========================================================================*/
`timescale 1ns / 1ps
module ov5640_ddr_vga
(
   /* gtp接口信号*/		
    output[1:0] tx_disable,        
    input wire                                   Q0_CLK0_GTREFCLK_PAD_N_IN,
    input wire                                   Q0_CLK0_GTREFCLK_PAD_P_IN,
    input wire                                   DRP_CLK_IN_P,
    input wire                                   DRP_CLK_IN_N,
    input  wire [3:0]                            RXN_IN,
    input  wire [3:0]                            RXP_IN,
    output wire [3:0]                            TXN_OUT,
    output wire [3:0]                            TXP_OUT,

   // Differential system clocks
     input                                        sys_clk_p,
     input                                        sys_clk_n,
     input                                        sys_rst,
     input                                        key1_flag,
     input                                        key2_flag,     
     output                                       sys_clk,
	
   /*ddr3接口信号*/	
     inout  [31:0]                                ddr3_dq,
     inout  [3:0]                                 ddr3_dqs_n,
     inout  [3:0]                                 ddr3_dqs_p,
     
     output  [14:0]                               ddr3_addr,
     output  [2:0]                                ddr3_ba,
     output                                       ddr3_ras_n,
     output                                       ddr3_cas_n,
     output                                       ddr3_we_n,
     output                                       ddr3_reset_n,
     output  [0:0]                                ddr3_ck_p,
     output  [0:0]                                ddr3_ck_n,
     output  [0:0]                                ddr3_cke,
     output  [0:0]                                ddr3_cs_n,
     output  [3:0]                                ddr3_dm,
     output  [0:0]                                ddr3_odt,
	
	//VGA port	
	 output                                       vga_clk,
	 output                                       vga_en,
	 output			                              vga_hs,		   //horizontal sync 
	 output			                              vga_vs,		   //vertical sync
	 output  [7:0]	                              vga_r,		   //VGA R data
	 output	 [7:0]	                              vga_g,		   //VGA G data
	 output	 [7:0]	                              vga_b,		   //VGA B data
	
	//cmos1 interface
     output                                       cmos1_scl,         //cmos i2c clock
     inout                                        cmos1_sda,         //cmos i2c data
     input                                        cmos1_vsync,       //cmos vsync
     input                                        cmos1_href,        //cmos hsync refrence
     input                                        cmos1_pclk,        //cmos pxiel clock

     input   [7:0]                                cmos1_d,           //cmos data
     output                                       cmos1_reset,       //cmos reset


	//cmos2 interface
     output                                       cmos2_scl,         //cmos i2c clock
     inout                                        cmos2_sda,         //cmos i2c data
     input                                        cmos2_vsync,       //cmos vsync
     input                                        cmos2_href,        //cmos hsync refrence
     input                                        cmos2_pclk,        //cmos pxiel clock

     input   [7:0]                                cmos2_d,          //cmos data
     output                                       cmos2_reset       //cmos reset


	
	//led status indication
//	 output   [3:0]                               led
	
);
wire [4:0] vga_red;
wire [5:0] vga_green;
wire [4:0] vga_blue;

assign vga_r = {vga_red[4:0],vga_red[2:0]};
assign vga_g = {vga_green[5:0],vga_green[1:0]};
assign vga_b = {vga_blue[4:0],vga_blue[2:0]};


assign tx_disable = 2'd0;          //光模块发送使能


//---------------------------------------------
wire   phy_clk;
wire	clk_vga;		   //vga clock
wire	clk_camera;		   //cmos clock

// GTP Channel0~Channel3 发送信号定义
wire tx0_clk;
wire gt0_txfsmresetdone;
wire[31:0] tx0_data;
wire[3:0] tx0_kchar;
wire tx1_clk;
wire[31:0] tx1_data;
wire[3:0] tx1_kchar; 
wire tx2_clk;
wire[31:0] tx2_data;
wire[3:0] tx2_kchar;
wire tx3_clk;
wire[31:0] tx3_data;
wire[3:0] tx3_kchar;

// GTP Channel0~Channel3 接收信号定义    
wire rx0_clk;
wire[31:0] rx0_data;
wire[3:0] rx0_kchar;
wire rx1_clk;
wire[31:0] rx1_data;
wire[3:0] rx1_kchar; 
wire rx2_clk;
wire[31:0] rx2_data;
wire[3:0] rx2_kchar;
wire rx3_clk;
wire[31:0] rx3_data;
wire[3:0] rx3_kchar;

wire[31:0] gt_tx_data;
wire[3:0] gt_tx_ctrl;

//GTP的Channel0~channel3 发送的数据一样
assign tx0_data = gt_tx_data;
assign tx0_kchar = gt_tx_ctrl;
assign tx1_data = gt_tx_data;
assign tx1_kchar = gt_tx_ctrl;
assign tx2_data = gt_tx_data;
assign tx2_kchar = gt_tx_ctrl;
assign tx3_data = gt_tx_data;
assign tx3_kchar = gt_tx_ctrl;

system_ctrl	u_system_ctrl
(
	.clk				    (phy_clk),			  //ddr control clock
	.rst_n				    (sys_rst),		      //external reset

	.clk_c0				    (clk_vga),		     //65MHz vga clock
	.clk_c1				    (clk_camera),		 //24MHz sd clock
	.clk_c2                 (sys_clk)            //200mhz clock

);
 
//CMOS OV5640上电延迟部分
wire initial_en;                       //OV5640 register configure enable
power_on_delay	power_on_delay_inst(
	.clk_50M                 (clk_camera),
	.reset_n                 (sys_rst),	
	.camera1_rstn            (cmos1_reset),
	.camera2_rstn            (cmos2_reset),	
	.camera_pwnd             (),
	.initial_en              (initial_en)		
);
 
//-------------------------------------
//CMOS1 Camera初始化部分
wire Cmos1_Config_Done;
reg_config	reg_config_inst1(
	.clk_25M                 (clk_camera),
	.camera_rstn             (cmos1_reset),
	.initial_en              (initial_en),		
	.i2c_sclk                (cmos1_scl),
	.i2c_sdat                (cmos1_sda),
	.reg_conf_done           (Cmos1_Config_Done),
	.reg_index               (),
	.clock_20k               ()

);

//-------------------------------------
//CMOS2 Camera初始化部分
wire Cmos2_Config_Done;
reg_config	reg_config_inst2(
	.clk_25M                 (clk_camera),
	.camera_rstn             (cmos2_reset),
	.initial_en              (initial_en),		
	.i2c_sclk                (cmos2_scl),
	.i2c_sdat                (cmos2_sda),
	.reg_conf_done           (Cmos2_Config_Done),
	.reg_index               (),
	.clock_20k               ()

);

//-------------------------------------
//CMOS 图像信号按键切换
wire cmos_pclk;
wire cmos_vsync;
wire cmos_href;
wire [7:0] cmos_d;

cmos_select	cmos_select_inst(
	.clk                    (clk_camera),
	.reset_n                (sys_rst),	
	.key1_flag              (key1_flag),
	
	.cmos_pclk              (cmos_pclk),
    .cmos_vsync             (cmos_vsync),        
    .cmos_href              (cmos_href),
    .cmos_d                 (cmos_d),	
	
	.cmos1_pclk             (cmos1_pclk),
    .cmos1_vsync            (cmos1_vsync),        
    .cmos1_href             (cmos1_href),
    .cmos1_d                (cmos1_d),
    	
	.cmos2_pclk             (cmos2_pclk),
	.cmos2_vsync            (cmos2_vsync),		
	.cmos2_href             (cmos2_href),
	.cmos2_d                (cmos2_d)

);
//-------------------------------------
//CMOS 图像数据8位转16位
wire[15:0] cmos_d_16bit;
wire cmos_href_16bit;
reg[7:0] cmos_d_d0;
reg cmos_href_d0;
always@(posedge cmos_pclk)
begin
    cmos_d_d0 <= cmos_d;
    cmos_href_d0 <= cmos_href;
end
cmos_8_16bit cmos_8_16bit_m0(
	.rst(~sys_rst),
	.pclk(cmos_pclk),
	.pdata_i(cmos_d_d0),
	.de_i(cmos_href_d0),
	
	.pdata_o(cmos_d_16bit),
	.de_o(cmos_href_16bit)
);

//-------------------------------------
//GTP数据准备组合模块
video_packet_send video_packet_send_m0(
	.rst(~sys_rst),
	.tx_clk(tx0_clk),
	
	.pclk(cmos_pclk),
	.vs(cmos_vsync),
	.de(cmos_href_16bit),
	.vin_data(cmos_d_16bit),
	.vin_width(16'd1280),         //每行的像素位1280
	
	.gt_tx_data(gt_tx_data),     //gtp发送的数据
	.gt_tx_ctrl(gt_tx_ctrl)      //gtp发送控制信号
);

//-------------------------------------
//32位数据对齐模块
wire[31:0] rx_data_align;
wire[3:0] rx_ctrl_align;
wire rx_clk;
wire [31:0] rx_data;
wire[3:0] rx_kchar;

assign rx_clk = key2_flag  ? rx0_clk : rx1_clk;
assign rx_data = key2_flag  ? rx0_data : rx1_data;
assign rx_kchar = key2_flag  ? rx0_kchar : rx1_kchar;


word_align word_align_m0(
    .rst(1'b0),
    .rx_clk(rx_clk),
    .gt_rx_data(rx_data),
    .gt_rx_ctrl(rx_kchar),
    .rx_data_align(rx_data_align),
    .rx_ctrl_align(rx_ctrl_align)
);

//-------------------------------------
//GTP视频数据解析模块
wire vs;
wire de;
wire[7:0] vout_data;
video_packet_rec video_packet_rec_m0(
	.rst(~sys_rst),
	.rx_clk(rx_clk),
	.gt_rx_data(rx_data_align),
	.gt_rx_ctrl(rx_ctrl_align),
	.vout_width(16'd1280),
	
	.vs(vs),
	.de(de),
	.vout_data(vout_data)
);


//-------------------------------------
//Camera采样部分
wire        sys_we;
wire [255:0] sys_data_in;
wire	    init_calib_complete;			   //ddr init done

//camera_capture	camera_capture_inst(
//	.rst_n                   (sys_rst),	       //external reset  
//	.init_done               (init_calib_complete & (Cmos1_Config_Done | Cmos2_Config_Done)),	   // init done
//	.camera_pclk             (cmos_pclk),	   //cmos pxiel clock
//	.camera_href             (cmos_href),	   //cmos hsync refrence
//	.camera_vsync            (cmos_vsync),    //cmos vsync
//	.camera_data             (cmos_d),        //cmos data
//	.ddr_wren                (sys_we),         //ddr write enable
//	.ddr_data_camera         (sys_data_in)    //ddr write data

//);
camera_capture	camera_capture_inst(
	.rst_n                   (sys_rst),	       //external reset  
	.init_done               (1'b1),	   // init done
	.camera_pclk             (rx1_clk),	   //cmos pxiel clock
	.camera_href             (de),	   //cmos hsync refrence
	.camera_vsync            (vs),    //cmos vsync
	.camera_data             (vout_data),        //cmos data
	.ddr_wren                (sys_we),         //ddr write enable
	.ddr_data_camera         (sys_data_in)    //ddr write data

);
//-------------------------------------
// vga display
wire			 sys_rd; 					//rdfifo read enable
wire	[255:0]	 sys_data_out; 				//rdfifo read data 
  
vga_disp	vga_disp_inst
(
	//global clock
	.vga_clk_i			   (clk_vga),			    //vga clock
	.vga_rst			   (~sys_rst),		        //global reset

	//vga port
	.vga_clk               (vga_clk),
	.vga_en                (vga_en),
	.vga_hsync			   (vga_hs),		        //vga horizontal sync 
	.vga_vsync			   (vga_vs),		        //vga vertical sync
	.vga_r			       (vga_red),			        //vga red data	
	.vga_g			       (vga_green),		            //vga red data		
	.vga_b			       (vga_blue),			        //vga red data	

	//user interface
	.ddr_rden   		   (sys_rd),			    //vga read enable
	.ddr_data  		       (sys_data_out),	        //vga data
	.ddr_init_done	       (init_calib_complete)	//ddr init done

);


//-------------------------------------
// ddr fifo control 
wire frame_write_done;
wire frame_read_done;
ddr_2fifo_top	ddr_2fifo_top_inst
(
	//global clock
    .sys_clk_p                      (sys_clk_p),
    .sys_clk_n                      (sys_clk_n),
    .phy_clk                        (phy_clk),                 //ddr control clock 
    .sys_rst                        (sys_rst),                 //global reset
    
	.clk_read				        (clk_vga),		         //fifo read clock      
	.clk_write				        (rx1_clk),	             //fifo write clock
	
	//ddr interface
    .ddr3_addr                      (ddr3_addr),   //ddr address    
    .ddr3_ba                        (ddr3_ba),     //ddr bank address
    .ddr3_cas_n                     (ddr3_cas_n),  //ddr column address strobe
    .ddr3_ck_n                      (ddr3_ck_n),   //ddr clock enable 
    .ddr3_ck_p                      (ddr3_ck_p),   //ddr positive clock    
    .ddr3_cke                       (ddr3_cke),    //ddr negative clock 
    .ddr3_ras_n                     (ddr3_ras_n),  //ddr row address strobe    
    .ddr3_we_n                      (ddr3_we_n),   //ddr write enable
    .ddr3_dq                        (ddr3_dq),     //ddr data    
    .ddr3_dqs_n                     (ddr3_dqs_n),  //ddr data positive clock    
    .ddr3_dqs_p                     (ddr3_dqs_p),  //ddr data negative clock    
    .ddr3_reset_n                   (ddr3_reset_n),//ddr reset
    .init_calib_complete            (init_calib_complete),//ddr init done
   
    .ddr3_cs_n                      (ddr3_cs_n),   //ddr chip select        
    .ddr3_dm                        (ddr3_dm),     //ddr data enable
    .ddr3_odt                       (ddr3_odt),     //ddr On-Die Termination
	
	//user interface
	.vin_vs                         (vs),
    .vout_vs                        (vga_vs), 
	.frame_write_done		        (frame_write_done),	   //ddr write one frame
	.frame_read_done  	            (frame_read_done),	   //ddr read one frame
	.sys_we	                        (sys_we),              //fifo write enable
	.sys_data_in	                (sys_data_in),         //fifo data input	
	.sys_rd	                        (sys_rd),	           //fifo read enable
	.sys_data_out	                (sys_data_out)	       //fifo data output


);

//-------------------------------------
// GTP 接收和发送模块  
gtp_exdes gtp_exdes_m0
    (
	
    .tx0_clk(tx0_clk),
    .gt0_txfsmresetdone(gt0_txfsmresetdone),
    .tx0_data(tx0_data),
    .tx0_kchar(tx0_kchar),   
    .rx0_clk(rx0_clk),
    .rx0_data(rx0_data),
    .rx0_kchar(rx0_kchar),

    .gt1_txfsmresetdone(),
    .tx1_data(tx1_data),
    .tx1_kchar(tx1_kchar),   
    .rx1_clk(rx1_clk),
    .rx1_data(rx1_data),
    .rx1_kchar(rx1_kchar),
    
    .gt2_txfsmresetdone(),
    .tx2_data(tx2_data),
    .tx2_kchar(tx2_kchar),   
    .rx2_clk(rx2_clk),
    .rx2_data(rx2_data),
    .rx2_kchar(rx2_kchar),
    
    .gt3_txfsmresetdone(),
    .tx3_data(tx3_data),
    .tx3_kchar(tx3_kchar),   
    .rx3_clk(rx3_clk),
    .rx3_data(rx3_data),
    .rx3_kchar(rx3_kchar),
                         
    .Q0_CLK0_GTREFCLK_PAD_N_IN(Q0_CLK0_GTREFCLK_PAD_N_IN),
    .Q0_CLK0_GTREFCLK_PAD_P_IN(Q0_CLK0_GTREFCLK_PAD_P_IN),
    .drp_clk(phy_clk),
    //.DRP_CLK_IN_P(DRP_CLK_IN_P),
    //.DRP_CLK_IN_N(DRP_CLK_IN_N),
    .RXN_IN(RXN_IN),
    .RXP_IN(RXP_IN),
    .TXN_OUT(TXN_OUT),
    .TXP_OUT(TXP_OUT)
    );
    
endmodule


