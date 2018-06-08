/*-------------------------------------------------------------------------
Filename			:		ddr_2fifo_top.v
Description		:		ddr read and write with fifo controller.
==========================================================================*/
`timescale 1ns/1ns
module	ddr_2fifo_top
#(
	parameter DATA_WIDTH = 256,        //数据宽度
	parameter ADDR_WIDTH = 29         //地址宽度
)
(
   // Differential system clocks
     input                                        sys_clk_p,
     input                                        sys_clk_n,
     output                                       phy_clk,
     input                                        sys_rst,
     output                                       init_calib_complete,    //ddr initial done	
         
	 input			                              clk_read,			  //fifo data read clock	
	 input			                              ch0_clk_write,		  //ch0 fifo data write clock
     input                                        ch1_clk_write,          //ch1 fifo data write clock

   /*ddr3接口信号*/	
    inout  [31:0]                                  ddr3_dq,
    inout  [3:0]                                   ddr3_dqs_n,
    inout  [3:0]                                   ddr3_dqs_p,
    
    output  [14:0]                                 ddr3_addr,
    output  [2:0]                                  ddr3_ba,
    output                                         ddr3_ras_n,
    output                                         ddr3_cas_n,
    output                                         ddr3_we_n,
    output                                         ddr3_reset_n,
    output  [0:0]                                  ddr3_ck_p,
    output  [0:0]                                  ddr3_ck_n,
    output  [0:0]                                  ddr3_cke,
    output  [0:0]                                  ddr3_cs_n,
    output  [3:0]                                  ddr3_dm,
    output  [0:0]                                  ddr3_odt,
	
	//user interface
     input                                         ch0_sys_we,            //ch0 fifo write enable
     input    [ DATA_WIDTH - 1: 0]                 ch0_sys_data_in,       //ch0 fifo data input
     input                                         ch1_sys_we,            //ch1 fifo write enable
     input    [ DATA_WIDTH - 1: 0]                 ch1_sys_data_in,       //ch1 fifo data input     
     input                                         ch0_sys_rd,            //ch0 fifo read enable
     output   [ DATA_WIDTH - 1: 0]                 ch0_sys_data_out,      //ch0 fifo data output
     input                                         ch1_sys_rd,            //ch1 fifo read enable
     output   [ DATA_WIDTH - 1: 0]                 ch1_sys_data_out,      //ch1 fifo data output     
	
 	 input                                         vin1_vs,	         //ch0帧同步	
     input                                         vin2_vs,             //ch1帧同步    
	 input                                          vout_vs		       //vga帧同步	


);

//-----------------------------------------------
wire			               ch0_wr_burst_req;		 //ch0 ddr write request
wire	[ ADDR_WIDTH - 1:0]	   ch0_wr_burst_addr;		 //ch0 ddr write address 
wire                          ch0_wr_burst_data_req;    //ch0 ddr write data request
wire   [ DATA_WIDTH - 1:0]    ch0_wr_burst_data;	     //ch0 fifo 2 ddr data input	
wire                          ch0_wr_burst_finish;      //ch0 ddr write burst finish	

wire                          ch0_rd_burst_req;	         //ch0 ddr read request
wire   [ ADDR_WIDTH - 1:0]    ch0_rd_burst_addr;        //ch0 ddr read address
wire                          ch0_rd_burst_data_valid;  //ch0 ddr read data valid
wire   [ DATA_WIDTH - 1:0]    ch0_rd_burst_data;  	     //ch0 ddr 2 fifo data input
wire                          ch0_rd_burst_finish;      //ch0 ddr read burst finish	

wire  [9:0]                   ch0_wr_burst_len;        //ch0 ddr write burst length
wire  [9:0]                   ch0_rd_burst_len;  		//ch0 ddr read burst length

//--------------CH1 signal-------------------------
wire			               ch1_wr_burst_req;		 //ch1 ddr write request
wire	[ ADDR_WIDTH - 1:0]	   ch1_wr_burst_addr;	     //ch1 ddr write address 
wire                          ch1_wr_burst_data_req;    //ch1 ddr write data request
wire   [ DATA_WIDTH - 1:0]    ch1_wr_burst_data;	     //ch1 fifo 2 ddr data input	
wire                          ch1_wr_burst_finish;      //ch1 ddr write burst finish	

wire                          ch1_rd_burst_req;	          //ch1 ddr read request
wire   [ ADDR_WIDTH - 1:0]    ch1_rd_burst_addr;         //ch1 ddr read address
wire                          ch1_rd_burst_data_valid;   //ch1 ddr read data valid
wire   [ DATA_WIDTH - 1:0]    ch1_rd_burst_data;  	      //ch1 ddr 2 fifo data input
wire                          ch1_rd_burst_finish;       //ch1 ddr read burst finish	

wire  [9:0]                   ch1_wr_burst_len;          //ch1 ddr write burst length
wire  [9:0]                   ch1_rd_burst_len;  		  //ch1 ddr read burst length

wire                          rst;


//------------------------------------------------
//ddr control module instantiation
ddr_ctrl		ddr_ctrl_inst
(
	//global clock
    .sys_clk_p                      (sys_clk_p),
    .sys_clk_n                      (sys_clk_n),
	.clk  			                (phy_clk),		         //ddr control clock	
	.rst                            (rst),

	.sys_rst			            (sys_rst),			     //global reset

	//ddr read&write internal interface		
	//CH0 ddr read&write internal interface		
    .ch0_wr_burst_req                 (ch0_wr_burst_req),        //ch0 ddr write request
    .ch0_wr_burst_addr                (ch0_wr_burst_addr),      //ch0 ddr write address     
    .ch0_wr_burst_data_req            (ch0_wr_burst_data_req),     //ch0 ddr write data request
    .ch0_wr_burst_data                (ch0_wr_burst_data),         //ch0 fifo 2 ddr data input    
    .ch0_wr_burst_finish              (ch0_wr_burst_finish),    //ch0 ddr write burst finish    
    
    .ch0_rd_burst_req                 (ch0_rd_burst_req),        //ch0 ddr read request
    .ch0_rd_burst_addr                (ch0_rd_burst_addr),        //ch0 ddr read address
    .ch0_rd_burst_data_valid          (ch0_rd_burst_data_valid),//ch0 ddr read data valid
    .ch0_rd_burst_data                (ch0_rd_burst_data),       //ch0 ddr 2 fifo data input
    .ch0_rd_burst_finish              (ch0_rd_burst_finish),    //ch0 ddr read burst finish    
    
     //CH1 ddr read&write internal interface        
    .ch1_wr_burst_req                 (ch1_wr_burst_req),        //ch1 ddr write request
    .ch1_wr_burst_addr                (ch1_wr_burst_addr),      //ch1 ddr write address     
    .ch1_wr_burst_data_req            (ch1_wr_burst_data_req),     //ch1 ddr write data request
    .ch1_wr_burst_data                (ch1_wr_burst_data),         //ch1 fifo 2 ddr data input    
    .ch1_wr_burst_finish              (ch1_wr_burst_finish),    //ch1 ddr write burst finish    
    
    .ch1_rd_burst_req                 (ch1_rd_burst_req),        //ch1 ddr read request
    .ch1_rd_burst_addr                (ch1_rd_burst_addr),        //ch1 ddr read address
    .ch1_rd_burst_data_valid          (ch1_rd_burst_data_valid),//ch1 ddr read data valid
    .ch1_rd_burst_data                (ch1_rd_burst_data),       //ch1 ddr 2 fifo data input
    .ch1_rd_burst_finish              (ch1_rd_burst_finish),    //ch1 ddr read burst finish    

	//ch0 burst length
	.ch0_wr_burst_len		               (10'd128),	           //ch0 ddr write burst length
	.ch0_rd_burst_len		               (10'd128),		        //ch0 ddr read burst length

	//ch0 burst length
	.ch1_wr_burst_len		               (10'd128),	           //ch1 ddr write burst length
	.ch1_rd_burst_len		               (10'd128),		        //ch1 ddr read burst length
	
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
    .ddr3_odt                       (ddr3_odt)     //ddr On-Die Termination

);

					
//------------------------------------------------
//CH0 dcfifo_ctrl module instantiation
wire [1:0] ch0_wr_bank;                             //ch0 ddr write bank address
wire [1:0] ch0_rd_bank;                             //ch0 ddr read bank address

dcfifo_ctrl ch0_dcfifo_ctrl
(
	//global clock
	.clk_ref			           (phy_clk),			     //sdram	reference clock
	.rst_n				           (~rst),			         //global reset
	.clk_read			           (clk_read),     	         //fifo data read clock	
	.clk_write			           (ch0_clk_write),     	 //CH0 fifo data write clock
	
	.vin_vs                        (vin1_vs),    	         //cmos1帧同步	
    .vout_vs                       (vout_vs),		    	 //VGAs帧同步	
	
	//brust length	
	.wr_length			           (10'd128),		         //ddr write burst length
	.rd_length			           (10'd128),		         //ddr read burst length
	.wr_addr			           ({ch0_wr_bank,20'd0}),		 //ddr start write address
	.wr_max_addr		           ({ch0_wr_bank,20'd57600}),	 //ddr max write address 1280*720 *16bit/256bit
	.rd_addr			           ({ch0_rd_bank,20'd0}),		 //ddr start read address
	.rd_max_addr		           ({ch0_rd_bank,20'd57600}),	 //sdram max read address 1024*768 *16bit/256bit

	//wrfifo:  fifo 2 sdram
	.wrf_wrreq			           (ch0_sys_we),			     //fifo write enable		
	.wrf_din			           (ch0_sys_data_in),		     //fifo data input
	.ddr_wr_req		               (ch0_wr_burst_req),	         //ddr write request
	.ddr_wr_ack                    (ch0_wr_burst_data_req),      //ddr write data request
	.ddr_din		               (ch0_wr_burst_data),		     //fifo 2 ddr data input	
	.ddr_wraddr		               (ch0_wr_burst_addr),		     //ddr write address
	.ddr_wr_finish	               (ch0_wr_burst_finish),        //ddr write burst finish	
	
	//rdfifo: sdram 2 fifo
	.rdf_rdreq			           (ch0_sys_rd),			     //fifo read enable	
	.rdf_dout			           (ch0_sys_data_out),		     //fifo data output
	.ddr_rd_req		               (ch0_rd_burst_req),		     //ddr read request
	.ddr_rd_ack	                   (ch0_rd_burst_data_valid),    //ddr read data valid
	.ddr_dout			           (ch0_rd_burst_data),		     //ddr 2 fifo data input	
	.ddr_rdaddr		               (ch0_rd_burst_addr),		     //sdram read address
	.ddr_rd_finish		           (ch0_rd_burst_finish),        //ddr read burst finish	
	
	//sdram address control	
	.ddr_init_done	               (init_calib_complete),     //ddr init done	
	.frame_write_done	           (),	                      //sdram write one frame
	.frame_read_done	           ()	                      //sdram read one frame

);

//------------------------------------------------
//CH1 dcfifo_ctrl module instantiation
wire [1:0] ch1_wr_bank;                             //ch1 ddr write bank address
wire [1:0] ch1_rd_bank;                             //ch1 ddr read bank address

dcfifo_ctrl ch1_dcfifo_ctrl
(
	//global clock
	.clk_ref			           (phy_clk),			     //sdram	reference clock
	.rst_n				           (~rst),			         //global reset
	.clk_read			           (clk_read),     	         //fifo data read clock	
	.clk_write			           (ch1_clk_write),     	     //CH1 fifo data write clock
	
	.vin_vs                        (vin2_vs),    	         //cmos2帧同步	
    .vout_vs                       (vout_vs),		    	 //VGAs帧同步	
	
	//brust length	
	.wr_length			           (10'd128),		         //ddr write burst length
	.rd_length			           (10'd128),		         //ddr read burst length
	.wr_addr			           ({ch1_wr_bank,20'd100000}),		 //ddr start write address
	.wr_max_addr		           ({ch1_wr_bank,20'd157600}),	 //ddr max write address 1280*720 *16bit/256bit
	.rd_addr			           ({ch1_rd_bank,20'd100000}),		 //ddr start read address
	.rd_max_addr		           ({ch1_rd_bank,20'd157600}),	 //sdram max read address 1024*768 *16bit/256bit

	//wrfifo:  fifo 2 sdram
	.wrf_wrreq			           (ch1_sys_we),			     //fifo write enable		
	.wrf_din			           (ch1_sys_data_in),		     //fifo data input
	.ddr_wr_req		               (ch1_wr_burst_req),	         //ddr write request
	.ddr_wr_ack                    (ch1_wr_burst_data_req),      //ddr write data request
	.ddr_din		               (ch1_wr_burst_data),		     //fifo 2 ddr data input	
	.ddr_wraddr		               (ch1_wr_burst_addr),		     //ddr write address
	.ddr_wr_finish	               (ch1_wr_burst_finish),        //ddr write burst finish	
	
	//rdfifo: sdram 2 fifo
	.rdf_rdreq			           (ch1_sys_rd),			     //fifo read enable	
	.rdf_dout			           (ch1_sys_data_out),		     //fifo data output
	.ddr_rd_req		               (ch1_rd_burst_req),		     //ddr read request
	.ddr_rd_ack	                   (ch1_rd_burst_data_valid),    //ddr read data valid
	.ddr_dout			           (ch1_rd_burst_data),		     //ddr 2 fifo data input	
	.ddr_rdaddr		               (ch1_rd_burst_addr),		     //sdram read address
	.ddr_rd_finish		           (ch1_rd_burst_finish),        //ddr read burst finish	
	
	//sdram address control	
	.ddr_init_done	               (init_calib_complete),     //ddr init done	
	.frame_write_done	           (),	                      //sdram write one frame
	.frame_read_done	           ()	                      //sdram read one frame

);


//------------------------------------------------
//dcfifo_ctrl module instantiation
bank_switch	bank_switch_inst
(
	.clk						   (phy_clk),			      //ddr	write clock
	.rst_n					       (~rst),		              //global reset
	.vin1_vs                       (vin1_vs),    	      //cmos1帧同步
    .vin2_vs                       (vin2_vs),              //cmos2帧同步    
    .vout_vs                       (vout_vs),             //VGAs帧同步    
     
    .ch0_wr_bank                   (ch0_wr_bank),         //ch0 ddr write bank address
    .ch0_rd_bank                   (ch0_rd_bank),         //ch0 ddr read bank address
    
    .ch1_wr_bank                   (ch1_wr_bank),         //ch1 ddr write bank address
    .ch1_rd_bank                   (ch1_rd_bank)          //ch1 ddr read bank address
);


endmodule
