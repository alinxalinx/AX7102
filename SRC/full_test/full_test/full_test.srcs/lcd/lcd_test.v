`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ALINX 
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////
module lcd_test(
     input sys_clk,
	 input rst_n,                 
	 input key3_flag,                 
 	 input key4_flag, 
 	        
	 output lcd_dclk,
	 output [7:0] lcd_r,
     output [7:0] lcd_g,
     output [7:0] lcd_b,
     output lcd_hsync,
     output lcd_vsync,
     output lcd_de
	     );

  reg[10 : 0] x_cnt;
  reg[9 : 0]  y_cnt;
  reg[7 : 0] grid_data_1;
  reg[7 : 0] grid_data_2;
  reg[23 : 0] bar_data;
  wire [1 : 0] lcd_dis_mode;
  reg[7 : 0]  lcd_r_reg;
  reg[7 : 0]  lcd_g_reg;
  reg[7 : 0]  lcd_b_reg;  
  reg hsync_r;
  reg vsync_r; 
  reg hsync_de;
  reg vsync_de;
  
 
  wire lcd_clk;
  
  assign lcd_dis_mode = {key3_flag,key4_flag};

 //LCD输出信号赋值
  assign lcd_dclk = ~lcd_clk;
  assign lcd_hsync = hsync_r;
  assign lcd_vsync = vsync_r;
  assign lcd_de = hsync_de & vsync_de;
  assign lcd_r = (hsync_de & vsync_de)?lcd_r_reg:8'b00000000;
  assign lcd_g = (hsync_de & vsync_de)?lcd_g_reg:8'b00000000;
  assign lcd_b = (hsync_de & vsync_de)?lcd_b_reg:8'b00000000;
  
//-----------------------------------------------------------//
// 水平扫描参数的设定480*272 60Hz LCD
//-----------------------------------------------------------//
parameter LinePeriod =525;           //行周期数
parameter H_SyncPulse=41;            //行同步脉冲（Sync a）
parameter H_BackPorch=2;             //显示后沿（Back porch b）
parameter H_ActivePix=480;           //显示时序段（Display interval c）
parameter H_FrontPorch=2;            //显示前沿（Front porch d）
parameter Hde_start=43;
parameter Hde_end=523;

//-----------------------------------------------------------//
// 垂直扫描参数的设定480*272 60Hz LCD
//-----------------------------------------------------------//
parameter FramePeriod =286;           //列周期数
parameter V_SyncPulse=10;             //列同步脉冲（Sync o）
parameter V_BackPorch=2;              //显示后沿（Back porch p）
parameter V_ActivePix=272;            //显示时序段（Display interval q）
parameter V_FrontPorch=2;             //显示前沿（Front porch r）
parameter Vde_start=12;
parameter Vde_end=284;

//----------------------------------------------------------------
////////// 水平扫描计数
//----------------------------------------------------------------
always @ (posedge lcd_clk)
       if(1'b0)    x_cnt <= 1;
       else if(x_cnt == LinePeriod) x_cnt <= 1;
       else x_cnt <= x_cnt+ 1;
		 
//----------------------------------------------------------------
////////// 水平扫描信号hsync,hsync_de产生
//----------------------------------------------------------------
always @ (posedge lcd_clk)
   begin
       if(~rst_n) hsync_r <= 1'b1;
       else if(x_cnt == 1) hsync_r <= 1'b0;            //产生hsync信号
       else if(x_cnt == H_SyncPulse) hsync_r <= 1'b1;
		 
		 		 
	    if(~rst_n) hsync_de <= 1'b0;
       else if(x_cnt == Hde_start) hsync_de <= 1'b1;    //产生hsync_de信号
       else if(x_cnt == Hde_end) hsync_de <= 1'b0;	
	end

//----------------------------------------------------------------
////////// 垂直扫描计数
//----------------------------------------------------------------
always @ (posedge lcd_clk)
       if(~rst_n) y_cnt <= 1;
       else if(y_cnt == FramePeriod) y_cnt <= 1;
       else if(x_cnt == LinePeriod) y_cnt <= y_cnt+1;

//----------------------------------------------------------------
////////// 垂直扫描信号vsync, vsync_de产生
//----------------------------------------------------------------
always @ (posedge lcd_clk)
  begin
       if(~rst_n) vsync_r <= 1'b1;
       else if(y_cnt == 1) vsync_r <= 1'b0;    //产生vsync信号
       else if(y_cnt == V_SyncPulse) vsync_r <= 1'b1;
		 
	    if(1'b0) vsync_de <= 1'b0;
       else if(y_cnt == Vde_start) vsync_de <= 1'b1;    //产生vsync_de信号
       else if(y_cnt == Vde_end) vsync_de <= 1'b0;	 
  end
		 

//----------------------------------------------------------------
////////// 格子测试图像产生
//----------------------------------------------------------------
 always @(posedge lcd_clk)   
   begin
     if ((x_cnt[4]==1'b1) ^ (y_cnt[4]==1'b1))            //产生格子1图像
			    grid_data_1<= 8'h00;
	  else
			    grid_data_1<= 8'hff;
				 
	  if ((x_cnt[6]==1'b1) ^ (y_cnt[6]==1'b1))            //产生格子2图像 
			    grid_data_2<=8'h00;
	  else
				 grid_data_2<=8'hff; 
   
	end
	
//----------------------------------------------------------------
////////// 彩色条测试图像产生
//----------------------------------------------------------------
 always @(posedge lcd_clk)   
   begin
     if (x_cnt==43)            
			    bar_data <= 24'hff0000;               //红色
	  else if (x_cnt==103)
			    bar_data <= 24'h00ff00;               //红色				 
	  else if (x_cnt==163)            
			    bar_data <= 24'h0000ff;               //蓝色
	  else if (x_cnt==223)            
			    bar_data <= 24'hff00ff;               //紫色
	  else if (x_cnt==283)            
			    bar_data <= 24'hffff00;               //黄色
	  else if (x_cnt==363)            
			    bar_data <= 24'h00ffff;               //青色
	  else if (x_cnt==423)            
			    bar_data <= 24'hffffff;               //黑色
	  else if (x_cnt==483)            
			    bar_data <= 24'h000000;               //白色
	  else          
			    bar_data <= bar_data;
   
	end
	
//----------------------------------------------------------------
////////// LCD图像选择输出
//----------------------------------------------------------------
 //LCD数据信号选择 
 always @(posedge lcd_clk)  
    if(~rst_n) begin 
	    lcd_r_reg<=0; 
	    lcd_g_reg<=0;
	    lcd_b_reg<=0;		 
	end
   else
     case(lcd_dis_mode)
		   2'b01:begin     
			     lcd_r_reg<=x_cnt[7:0];              //LCD显示水平渐变色
                 lcd_g_reg<=x_cnt[7:0];
                 lcd_b_reg<=x_cnt[7:0];
			end
		   2'b11:begin     
                  lcd_r_reg<=x_cnt[7:0];              //LCD显示水平渐变色
                  lcd_g_reg<=x_cnt[7:0];
                  lcd_b_reg<=x_cnt[7:0];
             end			
		   2'b10:begin     
			     lcd_r_reg<=bar_data[23:16];              //LCD显示彩色条
                 lcd_g_reg<=bar_data[15:8];
                 lcd_b_reg<=bar_data[7:0];			
			end
		   2'b00:begin     
                  lcd_r_reg<=bar_data[23:16];              //LCD显示彩色条
                  lcd_g_reg<=bar_data[15:8];
                  lcd_b_reg<=bar_data[7:0];            
             end			
		   default:begin
			        lcd_r_reg<=8'b11111111;                 //LCD显示全白
                 lcd_g_reg<=8'b11111111;
                 lcd_b_reg<=8'b11111111;
			end					  
         endcase;

	  
 //产生LCD的时钟
	  pll_lcd pll_lcd_inst
   (// Clock in ports
    .clk_in1(sys_clk),      // IN
    // Clock out ports
    .clk_out1(lcd_clk),     // OUT: 9Mhz lcd clock 
    // Status and control signals
    .reset(~rst_n),// IN
    .locked(LOCKED));      // OUT

			
endmodule



