// ----------------------------
// Current Design Names: tb_encoder42
// File Name: tb_encoder42.v
// Function: Testbenches for encoder42.
// Developer: Kenneth Naumann
// ----------------------------
`timescale 1ps/1ps

// Test Benches for AND Gates

module tb_encoder42;
	
	// Constant for inputs
	localparam CONSTANT_INPUTS = 4;
	
	// integer for counting
	integer counter = 0;
	
	// inputs and test inputs
	reg i1, i2, i3, i4; // inputs
	reg [CONSTANT_INPUTS-1:0] test_i = 4'b0000; // temporary inputs
	
	// output
	wire o0, o1; // output
	
	task apply_test (input [CONSTANT_INPUTS-1:0] test_i);
		begin
			i1 = test_i[0];
			i2 = test_i[1];
			i3 = test_i[2];
			i4 = test_i[3];
			#100;
		end
	endtask
	
	// instantiates the encoder42 gate
	encoder42 duv (.i1(i1), .i2(i2), .i3(i3), .o0(o0), .o1(o1));
	
	// Procedure statement
	initial begin
		for (counter = 0; counter < (2**(CONSTANT_INPUTS)); counter = counter + 1) begin
			apply_test(test_i);
			test_i = test_i + 1'b1;
		end
		#100;
	end
	
endmodule
