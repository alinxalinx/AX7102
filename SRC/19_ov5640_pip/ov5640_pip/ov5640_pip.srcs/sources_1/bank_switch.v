/*-------------------------------------------------------------------------
Filename			:		bank_switch.v
Description		:		back switch for ddr read and write.
Modification History	:
Data			By			Version			Change Description
===========================================================================
15/02/1
--------------------------------------------------------------------------*/
module	bank_switch
(
	input				clk,
	input				rst_n,
	
	input          vin1_vs,
	input          vin2_vs,	
	input          vout_vs,
	
	output	reg	[1:0]	ch0_wr_bank,
	output	reg	[1:0]	ch0_rd_bank,
	
	output	reg	[1:0]	ch1_wr_bank,
	output	reg	[1:0]	ch1_rd_bank
);


//----------------------------------
//negedge of bank_valid signal

reg vin1_vs_d0;
reg vin1_vs_d1;

reg vin2_vs_d0;
reg vin2_vs_d1;

reg vout_vs_d0;
reg vout_vs_d1;

always@(posedge clk)
begin
    vin1_vs_d0 <= vin1_vs;
    vin1_vs_d1 <= vin1_vs_d0;
end

always@(posedge clk)
begin
    vin2_vs_d0 <= vin2_vs;
    vin2_vs_d1 <= vin2_vs_d0;
end

always@(posedge clk)
begin
    vout_vs_d0 <= vout_vs;
    vout_vs_d1 <= vout_vs_d0;
end

//ch0 Ð´bankÇÐ»»
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ch0_wr_bank <= 2'd0;
    else if(~vin1_vs_d1 & vin1_vs_d0) //vin1 rising
        ch0_wr_bank <= ch0_wr_bank + 2'd1;
end

//ch0 ¶ÁbankÇÐ»»
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ch0_rd_bank <= 2'd0;
    else if(~vout_vs_d1 & vout_vs_d0) //vout rising
        ch0_rd_bank <= ch0_wr_bank - 2'd1;
end

//ch1 Ð´bankÇÐ»»
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ch1_wr_bank <= 2'd0;
    else if(~vin2_vs_d1 & vin2_vs_d0) //vin1 rising
        ch1_wr_bank <= ch1_wr_bank + 2'd1;
end

//ch1 ¶ÁbankÇÐ»»
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ch1_rd_bank <= 2'd0;
    else if(~vout_vs_d1 & vout_vs_d0) //vout rising
        ch1_rd_bank <= ch1_wr_bank - 2'd1;
end

endmodule
