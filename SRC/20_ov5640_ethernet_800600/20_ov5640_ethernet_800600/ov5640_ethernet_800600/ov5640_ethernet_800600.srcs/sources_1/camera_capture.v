`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    camera_capture 
//////////////////////////////////////////////////////////////////////////////////
module camera_capture(
	input reg_conf_done,	
	input camera_pclk,
   input camera_href,
	input camera_vsync,
	input [7:0] camera_data,	
	
	output reg [11:0] camera_h_count,             //only for chipscope debug
	output reg [10:0] camera_v_count,             //only for chipscope debug
	output reg        fifo_rst
	
);

//产生FIFO reset 
always @(posedge camera_pclk)
begin
  fifo_rst<=camera_vsync;
end


//检测camera_vsync的上升沿
reg camera_vsync_r1;
reg camera_vsync_r2;
reg vsync_rise;
always @(posedge camera_pclk)
begin
  camera_vsync_r1<=camera_vsync;
  camera_vsync_r2<=camera_vsync_r1;
  vsync_rise<=(~camera_vsync_r2)&camera_vsync_r1;
end


//检测camera_vsync的下升沿
reg camera_vsync_d1;
reg camera_vsync_d2;
reg vsync_down;
always @(posedge camera_pclk)
begin
  camera_vsync_d1<=camera_vsync;
  camera_vsync_d2<=camera_vsync_d1;
  vsync_down<=(~camera_vsync_d1)&camera_vsync_d2;
end



//产生camera行计数  
always @(posedge camera_pclk)
begin
	 if (!reg_conf_done) 
       camera_h_count<=0;
	 else if((camera_href==1'b1) & (camera_vsync==1'b0))  
       camera_h_count<=camera_h_count+1'b1;	  
	 else 
	 	 camera_h_count<=0; 
end

//产生camera行计数  
reg camera_href_r1;
reg camera_href_r2;
reg href_en;
always @(posedge camera_pclk)
begin
   camera_href_r1<=camera_href;
	camera_href_r2<=camera_href_r1;
	if((camera_href_r1==1'b1) && (camera_href_r2==1'b0))  //检测上升沿
       href_en<=1'b1;	  
	 else 
	 	 href_en<=1'b0; 
end

//产生camera列计数
always @(posedge camera_pclk)
begin
	 if (camera_vsync==1'b1) 
       camera_v_count<=0;
	 else if(href_en==1'b1)   
       camera_v_count<=camera_v_count+1'b1;	  
	 else 
	 	 camera_v_count<=camera_v_count;
end


		
endmodule

