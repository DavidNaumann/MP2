module SN74145(
input[3:0] i,
output[9:0] o // output 2
);

reg [9:0] o_tmp;
always @*

	case(i)
		4'b0000 : o_tmp = 10'b0111111111;
		4'b0001 : o_tmp = 10'b1011111111;
		4'b0010 : o_tmp = 10'b1101111111;
		4'b0011 : o_tmp = 10'b1110111111;
		4'b0100 : o_tmp = 10'b1111011111;
		4'b0101 : o_tmp = 10'b1111101111;
		4'b0110 : o_tmp = 10'b1111110111;
		4'b0111 : o_tmp = 10'b1111111011;
		4'b1000 : o_tmp = 10'b1111111101;
		4'b1001 : o_tmp = 10'b1111111110;
		default : o_tmp = 10'b1111111111;
	endcase
	
assign o = o_tmp;

endmodule

module SN74145_spc(
input[3:0] i,
output[9:0] o // output 2
);

reg [9:0] o_tmp;
always @*

	case(i)
		4'b0000 : o_tmp = 10'b0000001000;
		4'b0001 : o_tmp = 10'b0000000100;
		4'b0010 : o_tmp = 10'b0000000010;
		4'b0011 : o_tmp = 10'b0000000001;
		4'b0100 : o_tmp = 10'b0010000000;
		4'b0101 : o_tmp = 10'b0001000000;
		4'b0110 : o_tmp = 10'b0000100000;
		4'b0111 : o_tmp = 10'b0000010000;
		4'b1010 : o_tmp = 10'b1000000000;
		4'b1011 : o_tmp = 10'b0100000000;
		default : o_tmp = 10'b0000000000;
	endcase
	
assign o = o_tmp;

endmodule