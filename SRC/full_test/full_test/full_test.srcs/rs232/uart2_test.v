`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    uart2_test 
// decription: test the RS232 
//////////////////////////////////////////////////////////////////////////////////
module uart2_test(
         input sys_clk,                      // 开发板上差分输入时钟P: 200Mhz
         input  rst_n,
         
 		 output SD_clk,					
         output SD_cs,
         output SD_datain,
         input  SD_dataout,        
         
         input uart2_rx,                       // 串口数据接收
         output uart2_tx);                     // 串口数据发送


wire clk;       //clock for 9600 uart port
wire SD_clk_i;
wire [7:0] txdata,rxdata;     //串口发送数据和串口接收数据



//产生时钟的频率为16*9600
clkdiv u0 (
		.clk200                  (sys_clk),             //200Mhz的晶振输入                     
		.clkout1                 (SD_clk_i),            //25M SD clock
		.clkout2                 (clk)                  //16倍波特率的时钟                        
 );

//串口接收程序
uartrx u1 (
		.clk                     (clk),                 //16倍波特率的时钟 
        .rx	                     (uart2_rx),  	        //串口接收
		.dataout                 (rxdata),              //uart 接收到的数据,一个字节                     
        .rdsig                   (rdsig),               //uart 接收到数据有效 
		.dataerror               (),
		.frameerror              ()
);

//串口发送程序
uarttx u2 (
		.clk                     (clk),                  //16倍波特率的时钟  
	    .tx                      (uart2_tx),			 //串口发送
		.datain                  (txdata),               //uart 发送的数据   
        .wrsig                   (wrsig),                //uart 发送的数据有效  
        .idle                    () 	
	
 );

//串口数据发送控制程序
uartctrl u3 (
		.SD_clk_i                (SD_clk_i),   
		.rst_n                   (rst_n),
		.SD_clk                  (SD_clk),		
		.SD_cs                   (SD_cs),
		.SD_datain               (SD_datain),		
		.SD_dataout              (SD_dataout),		
						
		.clk                     (clk),    
        .wrsig                   (wrsig),                //uart 发送的数据有效  
        .dataout                 (txdata)	             //uart 发送的数据，一个字节 
	
 );
   
  
  
endmodule

