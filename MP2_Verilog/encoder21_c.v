module encoder21_c(
	input i1, // input 1
	input i2, // input 2
	output o // output
);

	wire tempo_1,tempo_2; // temporary outputs
	
	encoder42 en1 (.i1(i1), .i2(i1), .i3(i1), .i4(i2), .o0(tempo_1),.o1(tempo_2));
	
	assign o = o0 & o1;

endmodule
