// ----------------------------
// Current Design Names: ENCODER42_E
// File Name: encoder42.v
// Function: all encoder42 models
// Developer: Kenneth Naumann
// ----------------------------

// ENCODER42 Gate Modules

module encoder42(
input i0, // input 1
input i1, // input 2
input i2, // input 3
input i3, // input 4
output wire o0, // output 1
output wire o1 // output 2
);

assign o1 = (i3 | i2);
assign o0 = (i3 | i1);

endmodule