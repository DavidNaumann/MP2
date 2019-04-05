module demux18_b(
input[3:0] i,
output[7:0] o // output 2
);

reg[7:0] o_tmp = 8'b00000000;

always @*
	case({i[3], i[2], i[1]})
		3'b000 : o_tmp = 8'b00000001;
		3'b001 : o_tmp = 8'b00000010;
		3'b010 : o_tmp = 8'b00000100;
		3'b011 : o_tmp = 8'b00001000;
		3'b100 : o_tmp = 8'b00010000;
		3'b101 : o_tmp = 8'b00100000;
		3'b110 : o_tmp = 8'b01000000;
		3'b111 : o_tmp = 8'b10000000;
		default: o_tmp = 8'b00000000;
	endcase
	
assign o = (i[0] ? o_tmp : 8'b00000000);

endmodule
