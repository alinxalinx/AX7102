//////////////////////////////////////////////////////////////////////////////////
// Module Name:    udp数据通信模块
//////////////////////////////////////////////////////////////////////////////////

module udp(
			input  wire           reset_n,
			
			input  wire           e_rxc,
			input  wire	[7:0]	   e_rxd, 
			input  wire           e_rxdv,
			output wire	           e_txen,
			output wire	[7:0]      e_txd,                              
			output wire		       e_txer,		
		
			input  wire [7:0]     fifo_data,		                        //FIFO读出的8bit数据
			input  wire           fifo_prog_full,		                  //FIFO中的可编程满信号
		    output wire           fifo_rd_en,                           //FIFO读使能 

			input  wire [10:0]    frame_index,                          //IP包的序号
			
			input  wire [15:0]    tx_data_length,                       //发送IP包的数据长度/
			input  wire [15:0]    tx_total_length                       //发送IP包的总长度/

);


    

wire	[31:0] crcnext;
wire	[31:0] crc32;
wire	crcreset;
wire	crcen;


//IP frame发送
ipsend ipsend_inst(
	.clk                     (e_rxc),
	.txen                    (e_txen),
	.txer                    (e_txer),
	.dataout                 (e_txd),
	
	.datain                  (fifo_data),
	.fifo_prog_full         (fifo_prog_full),     //FIFO可编程满信号
   .fifo_rd_en              (fifo_rd_en),          //FIFO读使能 
	.frame_index             (frame_index), 		
	
	
	.crc                     (crc32),
	.crcen                   (crcen),
	.crcre                   (crcreset),
	.tx_state                (),
	.tx_data_length          (tx_data_length),
	.tx_total_length         (tx_total_length)

	);
	
//crc32校验
crc crc_inst(
	.Clk(e_rxc),
	.Reset(crcreset),
	.Enable(crcen),
	.Data_in(e_txd),
	.Crc(crc32),
	.CrcNext(crcnext));

////////IP frame接收程序////////////
wire [15:0] rx_total_length;
wire [15:0] rx_data_length;
wire data_o_valid;

iprecieve iprecieve_inst(
	.clk(e_rxc),
	.datain(e_rxd),
	.e_rxdv(e_rxdv),	
	.clr(reset_n),
	.board_mac(),	
	.pc_mac(),
	.IP_Prtcl(),
	.IP_layer(),
	.pc_IP(),	
	.board_IP(),
	.UDP_layer(),
	.data_o(),	
	.valid_ip_P(),
	.rx_total_length(rx_total_length),
	.data_o_valid(data_o_valid),                                       
	.rx_state(),
	.rx_data_length(rx_data_length),
	.ram_wr_addr(),
	.data_receive()	
	
	
	);
	
endmodule
