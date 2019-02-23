// ----------------------------
// Current Design Names: NAND2, NAND3, NAND5
// File Name: xors.v
// Function: all xor gates
// Developer: Kenneth Naumann
// ----------------------------

// NAND_E Gate Modules

module NAND2_E(
input i1, // input 1
input i2, // input 2
output o // output
);

assign o = (!i1 | !i2);

endmodule

module NAND3_E(
input i1, 	// input 1
input i2, 	// input 2
input i3, 	// input 3
output o 	// output
);

assign o = ((!i1 | !i2 | !i3));

endmodule

module NAND5_E(
input i1, 	// input 1
input i2, 	// input 2
input i3, 	// input 3
input i4, 	// input 3
input i5, 	// input 3
output o 	// output
);

assign o = ((!i1 | !i2 | !i3 | !i4 | !i5));

endmodule

// NAND_C Gate Modules

module NAND2_C(
	input i1, // input 1
	input i2, // input 2
	output o // output
);
	wire i1_n, i2_n; // negation of inputs
	
	NOT1 N1 (.i1(i1), .o(i1_n));
	NOT1 N2 (.i1(i2), .o(i2_n));

	OR2 O1 (.i1(i1_n), .i2(i2_n), .o(o));

endmodule

module NAND3_C(
	input i1, // input 1
	input i2, // input 2
	input i3, // input 3
	output o // output
);
	wire i1_n, i2_n, i3_n; // negation of inputs
	
	NOT1 N1 (.i1(i1), .o(i1_n));
	NOT1 N2 (.i1(i2), .o(i2_n));
	NOT1 N3 (.i1(i3), .o(i3_n));

	OR3 O1 (.i1(i1_n), .i2(i2_n), .i3(i3_n), .o(o));

endmodule

module NAND5_C(
	input i1, // input 1
	input i2, // input 2
	input i3, // input 3
	input i4, // input 3
	input i5, // input 3
	output o // output
);
	wire i1_n, i2_n, i3_n, i4_n, i5_n; // negation of inputs
	
	NOT1 N1 (.i1(i1), .o(i1_n));
	NOT1 N2 (.i1(i2), .o(i2_n));
	NOT1 N3 (.i1(i3), .o(i3_n));
	NOT1 N4 (.i1(i4), .o(i4_n));
	NOT1 N5 (.i1(i5), .o(i5_n));

	OR5 O1 (.i1(i1_n), .i2(i2_n), .i3(i3_n), .i4(i4_n), .i5(i5_n), .o(o));

endmodule

// NAND_SC Gate Modules

module NAND2_SC(
	input i1, // input 1
	input i2, // input 2
	output o // output
);

	NAND2_E NA1 (.i1(i1), .i2(i2), .o(o));

endmodule

module NAND3_SC(
	input i1, // input 1
	input i2, // input 2
	input i3, // input 3
	output o // output
);
	wire tempo_1, tempo_2; // temporary outputs
	
	NAND2_E NA1 (.i1(i1), .i2(i2), .o(tempo_1));
	NAND2_E NA2 (.i1(tempo_1), .i2(tempo_1), .o(tempo_2));
	NAND2_E NA3 (.i1(tempo_2), .i2(i3), .o(o));
endmodule

module NAND5_SC(
	input i1, // input 1
	input i2, // input 2
	input i3, // input 3
	input i4, // input 3
	input i5, // input 3
	output o // output
);
	wire tempo_1, tempo_2, tempo_3, tempo_4, tempo_5, tempo_6; // temporary outputs
	
	NAND2_E NA1 (.i1(i1), .i2(i2), .o(tempo_1));
	NAND2_E NA2 (.i1(i3), .i2(i4), .o(tempo_2));
	NAND2_E NA3 (.i1(tempo_1), .i2(tempo_1), .o(tempo_3));
	NAND2_E NA4 (.i1(tempo_2), .i2(tempo_2), .o(tempo_4));
	NAND2_E NA5 (.i1(tempo_3), .i2(tempo_4), .o(tempo_5));
	NAND2_E NA6 (.i1(tempo_5), .i2(tempo_5), .o(tempo_6));
	NAND2_E NA7 (.i1(tempo_6), .i2(i5), .o(o));

endmodule