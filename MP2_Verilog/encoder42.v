// ----------------------------
// Current Design Names: ENCODER42_E
// File Name: encoder42.v
// Function: all encoder42 models
// Developer: Kenneth Naumann
// ----------------------------

// ENCODER42 Gate Modules

module encoder42(
input i1, // input 1
input i2, // input 2
input i3, // input 3
input i4, // input 4
output wire o0, // output 1
output wire o1 // output 2
);

assign o1 = (i3 | i4);
assign o0 = ((i2 & (!i3)) | i4);

endmodule