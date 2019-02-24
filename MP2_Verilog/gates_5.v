// ------------------------------------
// Current Design Names: AND5, OR5
// File Name: gates_5.v
// Function: 5 bit gates
// Developer: Kenneth Naumann
// ------------------------------------

// AND Gate Modules

module AND5(
input i1, // input 1
input i2, // input 2
input i3, // input 3
input i4, // input 4
input i5, // input 5
output o // output
);

assign o = i1&i2&i3&i4&i5;

endmodule

// ------------------------------------

// OR Gate Modules

module OR5(
input i1, // input 1
input i2, // input 2
input i3, // input 3
input i4, // input 4
input i5, // input 5
output o // output
);

assign o = i1|i2|i3|i4|i5;

endmodule

// END OF gates_5.v
// ------------------------------------