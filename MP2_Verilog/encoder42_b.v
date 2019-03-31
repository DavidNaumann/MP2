// ----------------------------
// Current Design Names: ENCODER42_B
// File Name: encoder42_b.v
// Function: all encoder42_b model
// Developer: Kenneth Naumann
// ----------------------------

// ENCODER42_B Gate Module

module encoder42_b(
input i0, // input 1
input i1, // input 2
input i2, // input 3
input i3, // input 4
output wire o0, // output 1
output wire o1 // output 2
);

if (i0 == 0)
	assign o0 = 0;
	assign o1 = 1;

if (i1 == 1)
	assign o0 = 1;
	assign o1 = 0;

if (i2 == 1)
	assign o0 = 0;
	assign o1 = 1;

if (i3 == 1)
	assign o0 = 1;
	assign o1 = 1;

endmodule