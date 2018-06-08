/*-------------------------------------------------------------------------
//Filename			:	ov5640_pip.v
//Description		:	双目摄像头测试程序，显示2路的OV5640的视频图像到VGA显示器上，
//                      每路摄像头分别率为640*480,在VGA上并排显示.
===========================================================================*/
`timescale 1ns / 1ps
module ov5640_pip
(
   // Differential system clocks
     input                                        sys_clk_p,
     input                                        sys_clk_n,
     input                                        sys_rst,
     input                                        key1,
	
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

//---------------------------------------------
wire   phy_clk;
wire	clk_vga;		   //vga clock
wire	clk_camera;		   //cmos clock

system_ctrl	u_system_ctrl
(
	.clk				    (phy_clk),			  //ddr control clock
	.rst_n				    (sys_rst),		      //external reset

	.clk_c0				    (clk_vga),		     //65MHz vga clock
	.clk_c1				    (clk_camera)		 //24MHz sd clock

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
//Camera1采样部分
wire        ch0_sys_we;
wire [255:0] ch0_sys_data_in;
wire	    init_calib_complete;			   //ddr init done

camera_capture	camera_capture_inst1(
	.rst_n                   (sys_rst),	       //external reset  
	.init_done               (init_calib_complete & Cmos1_Config_Done),	   // init done
	.camera_pclk             (cmos1_pclk),	   //cmos1 pxiel clock
	.camera_href             (cmos1_href),	   //cmos1 hsync refrence
	.camera_vsync            (cmos1_vsync),    //cmos1 vsync
	.camera_data             (cmos1_d),        //cmos1 data
	.ddr_wren                (ch0_sys_we),         //cmos1 ddr write enable
	.ddr_data_camera         (ch0_sys_data_in)    //cmos1 ddr write data

);

//-------------------------------------
//Camera1采样部分
wire        ch1_sys_we;
wire [255:0] ch1_sys_data_in;

camera_capture	camera_capture_inst2(
	.rst_n                   (sys_rst),	       //external reset  
	.init_done               (init_calib_complete & Cmos2_Config_Done),	   // init done
	.camera_pclk             (cmos2_pclk),	   //cmos2 pxiel clock
	.camera_href             (cmos2_href),	   //cmos2 hsync refrence
	.camera_vsync            (cmos2_vsync),    //cmos2 vsync
	.camera_data             (cmos2_d),        //cmos2 data
	.ddr_wren                (ch1_sys_we),         //cmos2 ddr write enable
	.ddr_data_camera         (ch1_sys_data_in)    //cmos2 ddr write data

);

//-------------------------------------
// vga display
wire            ch0_sys_rd;                     //ch0 rdfifo read enable
wire    [255:0] ch0_sys_data_out;               //ch0 rdfifo read data 
wire			 ch1_sys_rd; 					//ch1 rdfifo read enable
wire	[255:0]	 ch1_sys_data_out; 				//ch1 rdfifo read data 
  
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
	.ch0_ddr_rden   	   (ch0_sys_rd),			    //vga ch0 read enable
	.ch0_ddr_data  		   (ch0_sys_data_out),	        //vga ch0 data
	.ch1_ddr_rden   	   (ch1_sys_rd),			    //vga ch1 read enable
    .ch1_ddr_data          (ch1_sys_data_out),           //vga ch1 data	
	.ddr_init_done	       (init_calib_complete)	//ddr init done

);


//-------------------------------------
// ddr fifo control 
ddr_2fifo_top	ddr_2fifo_top_inst
(
	//global clock
    .sys_clk_p                      (sys_clk_p),
    .sys_clk_n                      (sys_clk_n),
    .phy_clk                        (phy_clk),                 //ddr control clock 
    .sys_rst                        (sys_rst),                 //global reset
    
	.clk_read				        (clk_vga),		         //fifo read clock      
	.ch0_clk_write				    (cmos1_pclk),	           //cmos1 fifo write clock
    .ch1_clk_write                  (cmos2_pclk),              //cmos2 fifo write clock
	
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
	.vin1_vs                        (cmos1_vsync),          //cmos1 列同步
    .vin2_vs                        (cmos2_vsync),          //cmos2 列同步    
    .vout_vs                        (vga_vs), 
	.ch0_sys_we	                    (ch0_sys_we),             //ch0 fifo write enable
    .ch0_sys_data_in                (ch0_sys_data_in),        //ch0 fifo data input    
    .ch1_sys_we                     (ch1_sys_we),             //ch1 fifo write enable
    .ch1_sys_data_in                (ch1_sys_data_in),        //ch1 fifo data input        
    .ch0_sys_rd                     (ch0_sys_rd),               //ch0 fifo read enable
    .ch0_sys_data_out               (ch0_sys_data_out),         //ch0_fifo data output
    .ch1_sys_rd                     (ch1_sys_rd),               //ch1 fifo read enable
    .ch1_sys_data_out               (ch1_sys_data_out)         //ch1 fifo data output    

);


endmodule


