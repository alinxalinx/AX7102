`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    SD_TOP 
//////////////////////////////////////////////////////////////////////////////////
module SD_TOP(
					input              clk,
					input              sd_rst_n,
					
					input              ddr_init_done,

					output             SD_clk,					
					output  reg        SD_cs,
					output  reg        SD_datain,
					input              SD_dataout,
					
	
					output  reg        sd_valid,
					output   [255:0]    sd_data,
                    output             init_o,					
                    output             pic_read_done		  
					
    );



wire [3:0] state;

wire [255:0]mydata_o;
wire myvalid_o;

wire [3:0] mystate_o;

wire read_o;

wire SD_cs_i;
wire SD_cs_r;
wire SD_datain_i;
wire SD_datain_r;

assign sd_data = mydata_o;
assign SD_clk=clk;

//---------------------------------
//sd card initial				
SD_initial SD_initial_inst(
         .rst_n(sd_rst_n),
			.SD_clk(clk),
			.SD_cs(SD_cs_i),
			.SD_datain(SD_datain_i),
			.SD_dataout(SD_dataout),
			.init_o(init_o),
			.state(state)
);

//---------------------------------
//sd card data read	 
SD_read	SD_read_inst(  
			.ddr_init_done(ddr_init_done), 
			.SD_clk(clk),
			.SD_cs(SD_cs_r),
			.SD_datain(SD_datain_r),
			.SD_dataout(SD_dataout),
				
			.mydata_o(mydata_o),
			.myvalid_o(myvalid_o),
		
			.mystate(mystate_o),
			
			.data_come(),
			
			.init(init_o),
			
			.read_o(pic_read_done)					
						
    );
	 


//---------------------------------
//SD signal select, 初始化和读的时候信号选择  
always @(*)
begin
	if(!init_o)
		begin
			SD_cs<=SD_cs_i;
			SD_datain<=SD_datain_i;
		end
	else
		begin
			SD_cs<=SD_cs_r;
			SD_datain<=SD_datain_r;
		end
end
 



//---------------------------------
//数据有效信号myvalid_o的脉冲宽度转换为一个clk的宽度  
always@(negedge clk or negedge sd_rst_n)
begin
	if(!sd_rst_n)
		begin
		sd_valid <= 0;
		end
	else
		begin
		  sd_valid <= myvalid_o;
		end
end
 
	 
endmodule


