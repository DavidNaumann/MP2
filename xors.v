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
