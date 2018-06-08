`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/15 16:51:54
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(

   /* gtp接口信号*/		
    output [1:0]                          tx_disable,        
    input                                 Q0_CLK0_GTREFCLK_PAD_N_IN,
    input                                 Q0_CLK0_GTREFCLK_PAD_P_IN,
    input                                 DRP_CLK_IN_P,
    input                                 DRP_CLK_IN_N,
    input   [3:0]                         RXN_IN,
    input   [3:0]                         RXP_IN,
    output  [3:0]                         TXN_OUT,
    output  [3:0]                         TXP_OUT,

   // Differential system clocks
     input                                 sys_clk_p,
     input                                 sys_clk_n,
     input                                 sys_rst,
	
   /*ddr3接口信号*/	
     inout  [31:0]                         ddr3_dq,
     inout  [3:0]                          ddr3_dqs_n,
     inout  [3:0]                          ddr3_dqs_p,
     
     output  [14:0]                        ddr3_addr,
     output  [2:0]                         ddr3_ba,
     output                                ddr3_ras_n,
     output                                ddr3_cas_n,
     output                                ddr3_we_n,
     output                                ddr3_reset_n,
     output  [0:0]                         ddr3_ck_p,
     output  [0:0]                         ddr3_ck_n,
     output  [0:0]                         ddr3_cke,
     output  [0:0]                         ddr3_cs_n,
     output  [3:0]                         ddr3_dm,
     output  [0:0]                         ddr3_odt,
	
	//VGA port	
	 output                                vga_clk,
	 output                                vga_en,
	 output			                       vga_hs,		   //horizontal sync 
	 output			                       vga_vs,		   //vertical sync
	 output  [7:0]	                       vga_r,		   //VGA R data
	 output	 [7:0]	                       vga_g,		   //VGA G data
	 output	 [7:0]	                       vga_b,		   //VGA B data
	
	//cmos1 interface
     output                                cmos1_scl,         //cmos i2c clock
     inout                                 cmos1_sda,         //cmos i2c data
     input                                 cmos1_vsync,       //cmos vsync
     input                                 cmos1_href,        //cmos hsync refrence
     input                                 cmos1_pclk,        //cmos pxiel clock

     input   [7:0]                         cmos1_d,           //cmos data
     output                                cmos1_reset,       //cmos reset


	//cmos2 interface
     output                                cmos2_scl,         //cmos i2c clock
     inout                                 cmos2_sda,         //cmos i2c data
     input                                 cmos2_vsync,       //cmos vsync
     input                                 cmos2_href,        //cmos hsync refrence
     input                                 cmos2_pclk,        //cmos pxiel clock

     input   [7:0]                         cmos2_d,          //cmos data
     output                                cmos2_reset,       //cmos reset
	
	//led/key status indication
	 output   [3:0]                        led_out,          //扩展板上LED
	 input   [3:0]                         key_in,          //扩展板上按键
	 output                                led1,            //核心板上led

	//rtc interface
	 input                                 uart1_rx,                  //usb uart rx
     output                                uart1_tx,                  //usb uart tx 
	
	 output                                DS1302_RST,                 //ds1302 CE/RST
	 output                                DS1302_SCLK,                //ds1302 SCLK
	 inout                                 DS1302_SIO,                 //ds1302 SIO	 
	 
	//USB interface	 
     output  [1:0]                        usb_fifoaddr,               //CY68013 FIFO Address
     output                               usb_slcs,                   //CY68013 Chipset select
     output                               usb_sloe,                   //CY68013 Data output enable
     output                               usb_slrd,                   //CY68013 READ indication
     output                               usb_slwr,                   //CY68013 Write indication
     inout [15:0]                         usb_fd,                     //CY68013 Data
     input                                usb_flaga,                  //CY68013 EP2 FIFO empty indication; 1:not empty; 0: empty
     input                                usb_flagb,                  //CY68013 EP4 FIFO empty indication; 1:not empty; 0: empty
     input                                usb_flagc,                   //CY68013 EP6 FIFO full indication; 1:not full; 0: full	 
 
	//Ethernet interface     
 	 output                               e_reset,
     input                                e_rxc,                       //125Mhz ethernet gmii rx clock
     input                                e_rxdv,                       //GMII 接收数据有效信号
     input                                e_rxer,                       //GMII 接收数据错误信号                    
     input  [7:0]                         e_rxd,                        //GMII 接收数据          

     input                                e_txc,                      //25Mhz ethernet mii tx clock         
     output                               e_gtxc,                     //25Mhz ethernet gmii tx clock  
     output                               e_txen,                     //GMII 发送数据有效信号    
     output                               e_txer,                     //GMII 发送数据错误信号                    
     output [7:0]                         e_txd,                       //GMII 发送数据   
     
	//lcd interface     
	 output                               lcd_dclk,
	 output [7:0]                         lcd_r,
     output [7:0]                         lcd_g,
     output [7:0]                         lcd_b,
     output                               lcd_hsync,
     output                               lcd_vsync,
     output                               lcd_de,
     
   //SD interface  
 	output                                SD_clk,					
    output                                SD_cs,
    output                                SD_datain,
    input                                 SD_dataout,        
    
    input                                 uart2_rx,                       //RS232 串口数据接收
    output                                uart2_tx                        // RS232串口数据发送            
     
	 
	
);

wire sys_clk;
wire key1_flag;
wire key2_flag;
wire key3_flag;
wire key4_flag;

assign led1 = uart2_rx ^ uart1_rx;

//cmos gtp vga display 
ov5640_ddr_vga ov5640_ddr_vga_inst
(

   /* gtp接口信号*/		
	.tx_disable			                     (tx_disable),			   
    .Q0_CLK0_GTREFCLK_PAD_N_IN               (Q0_CLK0_GTREFCLK_PAD_N_IN),  
    .Q0_CLK0_GTREFCLK_PAD_P_IN               (Q0_CLK0_GTREFCLK_PAD_P_IN),                  
	.DRP_CLK_IN_P			                 (DRP_CLK_IN_P),			   
    .DRP_CLK_IN_N                            (DRP_CLK_IN_N),  
    .RXN_IN                                  (RXN_IN),     
    .RXP_IN                                  (RXP_IN), 
    .TXN_OUT                                 (TXN_OUT),     
    .TXP_OUT                                 (TXP_OUT),     
 
   /* 时钟接口信号*/	
    .sys_clk_p                               (sys_clk_p),    
    .sys_clk_n                               (sys_clk_n),       
    .sys_rst                                 (sys_rst),    
    .key1_flag                               (key1_flag), 
    .key2_flag                               (key2_flag),     
    .sys_clk                                 (sys_clk), 
     
    /*ddr3接口信号*/	
    .ddr3_dq                                 (ddr3_dq),         
    .ddr3_dqs_n                              (ddr3_dqs_n),         
    .ddr3_dqs_p                              (ddr3_dqs_p),         
    .ddr3_addr                               (ddr3_addr),
    .ddr3_ba                                 (ddr3_ba),         
    .ddr3_ras_n                              (ddr3_ras_n),            
    .ddr3_cas_n                              (ddr3_cas_n),   
    .ddr3_we_n                               (ddr3_we_n), 
    .ddr3_reset_n                            (ddr3_reset_n),                
    .ddr3_ck_p                               (ddr3_ck_p),  
    .ddr3_ck_n                               (ddr3_ck_n),            
    .ddr3_cke                                (ddr3_cke),            
    .ddr3_cs_n                               (ddr3_cs_n),  
    .ddr3_dm                                 (ddr3_dm),            
    .ddr3_odt                                (ddr3_odt),   

	//VGA port	
    .vga_clk                                (vga_clk), 
    .vga_en                                 (vga_en),     
    .vga_hs                                 (vga_hs), 
    .vga_vs                                 (vga_vs),    
    .vga_r                                  (vga_r), 
    .vga_g                                  (vga_g),     
    .vga_b                                  (vga_b), 

 	//cmos1 interface
    .cmos1_scl                              (cmos1_scl), 
    .cmos1_sda                              (cmos1_sda),  
    .cmos1_vsync                            (cmos1_vsync),  
    .cmos1_href                             (cmos1_href),  
    .cmos1_pclk                             (cmos1_pclk),  
    .cmos1_d                                (cmos1_d),  
    .cmos1_reset                            (cmos1_reset),  
                	
	//cmos2 interface
    .cmos2_scl                              (cmos2_scl),  
    .cmos2_sda                              (cmos2_sda),      
    .cmos2_vsync                            (cmos2_vsync),  
    .cmos2_href                             (cmos2_href), 
    .cmos2_pclk                             (cmos2_pclk),  
    .cmos2_d                                (cmos2_d),      
    .cmos2_reset                            (cmos2_reset)
);

key_test  key_test_inst
(
    .sys_clk                                 (sys_clk),  
    .rst_n                                   (sys_rst),  
    .key_in                                  (key_in),          
    .key1_flag                               (key1_flag),  
    .key2_flag                               (key2_flag),
    .key3_flag                               (key3_flag),  
    .key4_flag                               (key4_flag),       
    .led_out                                 (led_out) 

);

rtc_test rtc_test_inst
(
    .sys_clk                                 (sys_clk),  
    .rst_n                                   (sys_rst), 
    
    .led1                                    (), 
    .uart1_rx                                (),  
    .uart1_tx                                (uart1_tx),  
    .DS1302_RST                              (DS1302_RST),  
    .DS1302_SCLK                             (DS1302_SCLK),         
    .DS1302_SIO                              (DS1302_SIO)      
);


usb_test usb_test_inst
(
    .sys_clk                                 (sys_clk),  
    .reset_n                                 (sys_rst),     
    .usb_fifoaddr                            (usb_fifoaddr),      
    .usb_slcs                                (usb_slcs),   
    .usb_sloe                                (usb_sloe),      
    .usb_slrd                                (usb_slrd),        
    .usb_slwr                                (usb_slwr),      
    .usb_fd                                  (usb_fd),   
    .usb_flaga                               (usb_flaga),      
    .usb_flagb                               (usb_flagb),
    .usb_flagc                               (usb_flagc)                  
);

ethernet_test ethernet_test_inst
(
    .reset_n                                 (sys_rst),  
    .sys_clk                                 (sys_clk),  
    .e_reset                                 (e_reset),  
    .e_rxc                                   (e_rxc),  
    .e_rxdv                                  (e_rxdv),  
    .e_rxer                                  (e_rxer),  
    .e_rxd                                   (e_rxd),  
    .e_txc                                   (e_txc),  
    .e_gtxc                                  (e_gtxc),   
    .e_txen                                  (e_txen),  
    .e_txer                                  (e_txer),  
    .e_txd                                   (e_txd)      
    
);

lcd_test lcd_test_inst
(
    .sys_clk                                 (sys_clk),  
    .rst_n                                   (sys_rst),    
    .key3_flag                               (key3_flag),  
    .key4_flag                               (key4_flag),      
    .lcd_dclk                                (lcd_dclk), 
    .lcd_r                                   (lcd_r),   
    .lcd_g                                   (lcd_g),         
    .lcd_b                                   (lcd_b),   
    .lcd_hsync                               (lcd_hsync),          
    .lcd_vsync                               (lcd_vsync),   
    .lcd_de                                  (lcd_de)                            
    
);


uart2_test uart2_test_inst
(
    .sys_clk                                 (sys_clk),  
    .rst_n                                   (sys_rst),      
    .SD_clk                                  (SD_clk),  
    .SD_cs                                   (SD_cs),  
    .SD_datain                               (SD_datain),  
    .SD_dataout                              (SD_dataout),         

    .uart2_rx                                 (),  
    .uart2_tx                                 (uart2_tx) 
    
);

endmodule
