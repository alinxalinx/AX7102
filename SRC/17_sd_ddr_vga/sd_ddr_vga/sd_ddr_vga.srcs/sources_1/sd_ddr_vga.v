/*-------------------------------------------------------------------------
Filename			:		sd_ddr_vga.v
Description		:		read picture from sd, and store in ddr, display on VGA.
===========================================================================*/
`timescale 1ns / 1ps
module sd_ddr_vga
(
   // Differential system clocks
     input                                        sys_clk_p,
     input                                        sys_clk_n,
     input                                        sys_rst,
	
   /*ddr3�ӿ��ź�*/	
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
	
	//SD SPI interface
	 output                                       SD_clk,          //sd spi clock
	 output 		 	                          SD_cs,           //sd spi cs
	 output 			                          SD_datain,       //sd spi data input
	 input 			                              SD_dataout       //sd spi data output
	
	//led status indication
//	 output   [3:0]                               led
	
);



//assign led[0] = ~ddr_init_done;          //led1灯亮:ddr初始化成�?
//assign led[1] = ~sd_init_done;           //led2灯亮:SD初始化成�?
//assign led[2] = ~pic_read_done;          //led3灯亮:SD图像读取完成
//assign led[3] = 1'b0;

//---------------------------------------------
wire   phy_clk;
wire	clk_vga;		   //vga clock
wire	clk_sd;		   //sd clock

system_ctrl	u_system_ctrl
(
	.clk				(phy_clk),			  //ddr control clock
	.rst_n				(sys_rst),		      //external reset

	.clk_c0				(clk_vga),		     //65MHz vga clock
	.clk_c1				(clk_sd)		     //25MHz sd clock

);
 

//-----------------------------------------------               
//SD card ctrl system
wire			   sys_we; 						//wrfifo write enable
wire	[255:0]    sys_data_in; 				//wrfifo write data 
wire              sd_init_done;           //SD initial done
wire              pic_read_done;          //picture read done
wire	          init_calib_complete;			   //ddr init done

SD_TOP	u_SD_TOP
(
	//Global Clock
	.clk			    (clk_sd),			//sd clock	
	.sd_rst_n  		    (sys_rst),	         //global reset
	.ddr_init_done	    (init_calib_complete),	//ddr init done
	
	//SD SPI Interface
	.SD_clk			    (SD_clk),         //SD SPI clock 
	.SD_cs			    (SD_cs),          //SD SPI CS	
	.SD_datain			(SD_datain),		//SD SPI data in	
	.SD_dataout			(SD_dataout),		//SD SPI data out

	//Ouput SD Data                 
	.sd_valid		    (sys_we),			//sd data valid
	.sd_data			(sys_data_in),  	//sd data
	.init_o             (sd_init_done),
	.pic_read_done      (pic_read_done)   //sd read finish

);


//-------------------------------------
// vga display
wire			 sys_rd; 						//rdfifo read enable
wire	[255:0]	 sys_data_out; 				//rdfifo read data 
wire             rd_load;    	         //ddr read address and fifo reset 
wire             data_valid;             //system data output enable 
  
vga_disp	vga_disp_inst
(
	//global clock
	.vga_clk_i			   (clk_vga),			    //vga clock
	.vga_rst			   (~sys_rst),		        //global reset

	//vga port
	.vga_clk			   (vga_clk),		        //vga clock	
	.vga_en			       (vga_en),		        //vga black enable	
	.vga_hsync			   (vga_hs),		        //vga horizontal sync 
	.vga_vsync			   (vga_vs),		        //vga vertical sync
	.vga_r			       (vga_r),			        //vga red data	
	.vga_g			       (vga_g),		        //vga red data		
	.vga_b			       (vga_b),			    //vga red data	

	//user interface
	.ddr_rden   		   (sys_rd),			    //vga read enable
	.ddr_data  		       (sys_data_out),	        //vga data
	.vga_framesync	       (data_valid),            //vga frame sync
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
	.clk_write				        (clk_sd),	             //fifo write clock
	
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
	.frame_write_done		        (frame_write_done),	   //ddr write one frame
	.frame_read_done  	            (frame_read_done),	   //ddr read one frame
	.sys_we	                        (sys_we),              //fifo write enable
	.sys_data_in	                (sys_data_in),         //fifo data input	
	.sys_rd	                        (sys_rd),	           //fifo read enable
	.sys_data_out	                (sys_data_out),	       //fifo data output
	.wr_load	                    (1'b0),	               //ddr write address reset
	.rd_load	                    (1'b0),	               //ddr read address reset
	.data_valid	                    (data_valid),	       //system data output enable	
	.pic_read_done                  (pic_read_done)
	
);


endmodule


