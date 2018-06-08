/*-------------------------------------------------------------------------
Filename			:		cmos_select.v
Description		:		
Modification History	:
Data			By			Version			Change Description
===========================================================================
15/02/1
--------------------------------------------------------------------------*/
module	cmos_select
(
     input                                        clk,
     input                                        reset_n, 
     input                                        key1_flag, 
     
     output                                       cmos_vsync,       //cmos vsync
     output                                       cmos_href,        //cmos hsync refrence
     output                                       cmos_pclk,        //cmos pxiel clock
     output   [7:0]                               cmos_d,          //cmos data

     input                                        cmos1_vsync,       //cmos vsync
     input                                        cmos1_href,        //cmos hsync refrence
     input                                        cmos1_pclk,        //cmos pxiel clock
     input   [7:0]                                cmos1_d,          //cmos data

     input                                        cmos2_vsync,       //cmos vsync
     input                                        cmos2_href,        //cmos hsync refrence
     input                                        cmos2_pclk,        //cmos pxiel clock
     input   [7:0]                                cmos2_d          //cmos data

);

reg key_sig;
reg [15:0] key_counter;

assign cmos_pclk = key1_flag ? cmos1_pclk : cmos2_pclk;
assign cmos_href = key1_flag ? cmos1_href : cmos2_href;
assign cmos_vsync = key1_flag ? cmos1_vsync : cmos2_vsync;
assign cmos_d = key1_flag ? cmos1_d : cmos2_d;  
            
 endmodule
 
     