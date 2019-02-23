// ------------------------------------
// Current Design Names: AND3, OR3
// File Name: gates_3.v
// Function: 3 bit gates
// Developer: Kenneth Naumann
// ------------------------------------

// AND Gate Modules

module AND3(
input i1, // input 1
input i2, // input 2
input i3, // input 3
output o // output
);

assign o = i1&i2&i3;

endmodule

// ------------------------------------

// OR Gate Modules

module OR3(
input i1, // input 1
input i2, // input 2
input i3, // input 3
output o // output
);

assign o = i1|i2|i3;

endmodule

// END OF gates_3.v
// ------------------------------------