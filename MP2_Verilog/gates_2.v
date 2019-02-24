// ----------------------------
// Current Design Names: AND2, OR2
// File Name: gates_2.v
// Function: 2 bit gates
// Developer: Kenneth Naumann
// ----------------------------

// AND Gate Modules

module AND2(
input i1, // input 1
input i2, // input 2
output o // output
);

assign o = i1&i2;

endmodule

// OR Gate Modules

module OR2(
input i1, // input 1
input i2, // input 2
output o // output
);

assign o = i1|i2;

endmodule