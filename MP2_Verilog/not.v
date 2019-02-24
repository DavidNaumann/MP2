// ----------------------------
// Current Design Names: AND2, OR2
// File Name: gates_2.v
// Function: 2 bit gates
// Developer: Kenneth Naumann
// ----------------------------

// AND Gate Modules

module NOT1(
input i1, // input 1
output o // output
);

assign o = !i1;

endmodule