`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ethernet_test
// 描述：此程序用于千兆以太网udp通信测试，千兆以太网通信时，FPGA和RTL8211之间通信接口为GMII
//      此程序不适用百兆以太网数据通信，百兆以太网MII接口udp通信的程序参考ethernet_100
//////////////////////////////////////////////////////////////////////////////////
module ethernet_test(
					input reset_n, 					                          
                    input sys_clk,              
					output e_reset,
//               output CLK_25_ASIC,
//                   output e_mdc,                      //MDIO的时钟信号，用于读写PHY的寄存器
// 					inout  e_mdio,                     //MDIO的数据信号，用于读写PHY的寄存器
		
            
					input	 e_rxc,                      //125Mhz ethernet gmii rx clock
					input	 e_rxdv,	                    //GMII 接收数据有效信号
					input	 e_rxer,	                    //GMII 接收数据错误信号					
					input  [7:0] e_rxd,                //GMII 接收数据	      

					input	 e_txc,                      //25Mhz ethernet mii tx clock         
					output e_gtxc,                     //25Mhz ethernet gmii tx clock  
					output e_txen,                     //GMII 发送数据有效信号	
					output e_txer,                     //GMII 发送数据错误信号					
					output [7:0] e_txd	              //GMII 发送数据 
  
    );
                

wire [31:0] ram_wr_data;
wire [31:0] ram_rd_data;
wire [8:0] ram_wr_addr;
wire [8:0] ram_rd_addr;

assign e_gtxc=e_rxc;	 
assign e_reset = 1'b1; 

wire [31:0] datain_reg;
         
wire [3:0] tx_state;
wire [3:0] rx_state;
wire [15:0] rx_total_length;          //rx 的IP包的长度
reg [15:0] tx_total_length;          //tx 的IP包的长度
wire [15:0] rx_data_length;           //rx 的UDP的数据包长度
reg [15:0] tx_data_length;           //rx 的UDP的数据包长度

wire data_receive;
reg ram_wr_finish;

reg [31:0] udp_data [4:0];                        //存储发送字符
reg ram_wren_i;
reg [8:0] ram_addr_i;
reg [31:0] ram_data_i;
reg [4:0] i;

wire data_o_valid;
wire wea;
wire [8:0] addra;
wire [31:0] dina;

assign wea=ram_wr_finish?data_o_valid:ram_wren_i;          //ram 写使能信号选择
assign addra=ram_wr_finish?ram_wr_addr:ram_addr_i;         //ram 写地址选择
assign dina=ram_wr_finish?ram_wr_data:ram_data_i;          //ram 写数据选择


//assign tx_data_length=data_receive?rx_data_length:16'd28;  //发送数据长度选择，判断是否接收到数据包，是的话，按接收到的数据长度发送
//assign tx_total_length=data_receive?rx_total_length:16'd48;//发送Frame长度选择，判断是否接收到数据包，是的话，按接收到的Frame长度发送



////////udp发送和接收程序/////////////////// 
udp u1(
	.reset_n(reset_n),
	.e_rxc(e_rxc),
	.e_rxd(e_rxd),
   .e_rxdv(e_rxdv),
	.e_txen(e_txen),
	.e_txd(e_txd),
	.e_txer(e_txer),		
	
	.data_o_valid(data_o_valid),                    //数据接收有效信号,写入RAM/
	.ram_wr_data(ram_wr_data),                      //接收到的32bit数据写入RAM/	
	.rx_total_length(rx_total_length),              //接收IP包的总长度/
	.rx_state(rx_state),                            //for chipscope test
	.rx_data_length(rx_data_length),                //接收IP包的数据长度/	
	.ram_wr_addr(ram_wr_addr),                      //ram写数据地址
	.data_receive(data_receive),                    //接收到以太网数据包标志

	.ram_rd_data(ram_rd_data),                      //RAM读出的32bit数据/
	.tx_state(tx_state),                            //for chipscope test

	.tx_data_length(tx_data_length),                //发送IP包的数据长度/	
	.tx_total_length(tx_total_length),              //接发送IP包的总长度/
	.ram_rd_addr(ram_rd_addr)                       //ram读数据地址

	);


//////////ram用于存储以太网接收到的数据或测试数据///////////////////
ram ram_inst (
  .clka(e_rxc),           // input clka
  .wea(wea),     // input [0 : 0] wea
  .addra(addra),    // input [8 : 0] addra
  .dina(dina),     // input [31 : 0] dina
  .clkb(e_rxc),           // input clkb
  .addrb(ram_rd_addr),    // input [8 : 0] addrb
  .doutb(ram_rd_data)     // output [31 : 0] doutb
);

/********************************************/
//存储待发送的字符
/********************************************/
always @(*)
begin     //定义发送的字符
	 udp_data[0]<={8'd72,8'd69,8'd76,8'd76};   //存储字符HELL 
	 udp_data[1]<={8'd79,8'd32,8'd65,8'd76};   //存储字符O空格AL 
     udp_data[2]<={8'd73,8'd78,8'd88,8'd32};   //存储字符INX空格
	 udp_data[3]<={8'd65,8'd88,8'd55,8'd49};   //存储字符AX71 	 
	 udp_data[4]<={8'd48,8'd48,8'd10,8'd13};   //存储字符00换行符回车符                            

end 


//////////RAM写入默认发送的数据//////////////////
always@(posedge e_rxc)
begin	
  if(reset_n==1'b0) begin
     ram_wr_finish<=1'b0;
	  ram_addr_i<=0;
	  ram_data_i<=0;
	  i<=0;
  end
  else begin
     if(i==5) begin
        ram_wr_finish<=1'b1;        //ram写入完毕
        ram_wren_i<=1'b0;		  
     end
     else begin                    //ram写入udp_data[0]~udp[4]的数据
        ram_wren_i<=1'b1;
		  ram_addr_i<=ram_addr_i+1'b1;
		  ram_data_i<=udp_data[i];
		  i<=i+1'b1;
	  end
  end 
end 


//////////发送Frame长度选择，判断是否接收到数据包，是的话，按接收到的Frame长度发送//////////////////
always@(negedge e_rxc)
begin	
  if(reset_n==1'b0) begin
      tx_total_length<=16'd48;
	  tx_data_length<=16'd28;
  end
  else begin
     if(data_receive==1'b1) begin
        tx_total_length<=rx_total_length; 
		tx_data_length<=rx_data_length;
     end
  end	  
end 

endmodule
