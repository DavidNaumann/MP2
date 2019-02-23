// ----------------------------
// Current Design Names: XOR2, XOR3, XOR5
// File Name: xors.v
// Function: all xor gates
// Developer: Kenneth Naumann
// ----------------------------

// XOR_E Gate Modules

module XOR2_E(
input i1, // input 1
input i2, // input 2
output o // output
);

assign o = (i1&(!i2))|(i2&(!i1));

endmodule

module XOR3_E(
input i1, 	// input 1
input i2, 	// input 2
input i3, 	// input 3
output o 	// output
);

assign o = (((!i1)&(!i2)&i3)|((!i1)&i2&(!i3))|(i1&(!i2)&(!i3))|(i1&i2&i3));

endmodule

module XOR5_E(
input i1, 	// input 1
input i2, 	// input 2
input i3, 	// input 3
input i4, 	// input 3
input i5, 	// input 3
output o 	// output
);

assign o = ((!i1&!i2&!i3&!i4&i5)|(!i1&!i2&!i3&i4&!i5)|(!i1&!i2&i3&!i4&!i5)|(!i1&!i2&i3&i4&i5)|(!i1&i2&!i3&!i4&!i5)|(!i1&i2&!i3&i4&i5)|(!i1&i2&i3&!i4&i5)|(!i1&i2&i3&i4&!i5)|(i1&!i2&!i3&!i4&!i5)|(i1&!i2&!i3&i4&i5)|(i1&!i2&i3&!i4&i5)|(i1&!i2&i3&i4&!i5)|(i1&i2&!i3&!i4&i5)|(i1&i2&!i3&i4&!i5)|(i1&i2&i3&!i4&!i5)|(i1&i2&i3&i4&i5));

endmodule

// XOR_C Gate Modules

module XOR2_C(
	input i1, // input 1
	input i2, // input 2
	output o // output
);

	assign o = (i1&(!i2))|(i2&(!i1));

endmodule

module XOR3_C(
	input i1, 	// input 1
	input i2, 	// input 2
	input i3, 	// input 3
	output o 	// output
);

	assign o = (((!i1)&(!i2)&i3)|((!i1)&i2&(!i3))|(i1&(!i2)&(!i3))|(i1&i2&i3));

endmodule

module XOR5_C(
	input i1, 	// input 1
	input i2, 	// input 2
	input i3, 	// input 3
	input i4, 	// input 3
	input i5, 	// input 3
	output o 	// output
);
	wire i1_n, i2_n, i3_n, i4_n, i5_n; // negation of inputs
	wire tempo_1, tempo_2, tempo_3, tempo_4, tempo_5, tempo_6, tempo_7, tempo_8, tempo_9, tempo_10; // temporary outputs
	
	NOT1 N1 (.i1(i1), .o(i1_n)); // negation of i1
	NOT1 N2 (.i1(i2), .o(i2_n)); // negation of i2
	NOT1 N3 (.i1(i3), .o(i3_n)); // negation of i3
	NOT1 N4 (.i1(i4), .o(i4_n)); // negation of i4
	NOT1 N5 (.i1(i5), .o(i5_n)); // negation of i5
	
	AND5 A1 (.i1(i1_n), .i2(i2_n), .i3(i3_n), .i4(i4_n), .i5(i5), .o(tempo_1));
	AND5 A2 (.i1(i1_n), .i2(i2_n), .i3(i3_n), .i4(i4), .i5(i5_n), .o(tempo_2));
	AND5 A3 (.i1(i1_n), .i2(i2_n), .i3(i3), .i4(i4_n), .i5(i5_n), .o(tempo_3));
	AND5 A4 (.i1(i1_n), .i2(i2_n), .i3(i3), .i4(i4), .i5(i5), .o(tempo_4));
	AND5 A5 (.i1(i1_n), .i2(i2), .i3(i3_n), .i4(i4_n), .i5(i5_n), .o(tempo_5));
	AND5 A6 (.i1(i1_n), .i2(i2), .i3(i3_n), .i4(i4), .i5(i5), .o(tempo_6));
	AND5 A7 (.i1(i1_n), .i2(i2), .i3(i3), .i4(i4_n), .i5(i5), .o(tempo_7));
	AND5 A8 (.i1(i1_n), .i2(i2), .i3(i3), .i4(i4), .i5(i5_n), .o(tempo_8));
	AND5 A9 (.i1(i1), .i2(i2_n), .i3(i3_n), .i4(i4_n), .i5(i5_n), .o(tempo_9));
	AND5 A10 (.i1(i1), .i2(i2_n), .i3(i3_n), .i4(i4), .i5(i5), .o(tempo_10));
	AND5 A11 (.i1(i1), .i2(i2_n), .i3(i3), .i4(i4_n), .i5(i5), .o(tempo_11));
	AND5 A12 (.i1(i1), .i2(i2_n), .i3(i3), .i4(i4), .i5(i5_n), .o(tempo_12));
	AND5 A13 (.i1(i1), .i2(i2), .i3(i3_n), .i4(i4_n), .i5(i5), .o(tempo_13));
	AND5 A14 (.i1(i1), .i2(i2), .i3(i3_n), .i4(i4), .i5(i5_n), .o(tempo_14));
	AND5 A15 (.i1(i1), .i2(i2), .i3(i3), .i4(i4_n), .i5(i5_n), .o(tempo_15));
	AND5 A16 (.i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .o(tempo_16));
	
	OR5 O1(.i1(tempo_1), .i2(tempo_2), .i3(tempo_3), .i4(tempo_4), .i5(tempo_5), .o(tempo_17));
	OR5 O2(.i1(tempo_17), .i2(tempo_6), .i3(tempo_7), .i4(tempo_8), .i5(tempo_9), .o(tempo_18));
	OR5 O3(.i1(tempo_18), .i2(tempo_10), .i3(tempo_11), .i4(tempo_12), .i5(tempo_13), .o(tempo_19));
	OR5 O4 (.i1(tempo_19), .i2(tempo_14), .i3(tempo_15), .i4(tempo_16), .i5(tempo_16), .o(o));

endmodule
