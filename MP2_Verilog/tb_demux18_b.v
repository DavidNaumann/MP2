// ----------------------------
// Current Design Names: tb_SN74145
// File Name: tb_SN74145.v
// Function: Testbenches for encoder42.
// Developer: Kenneth Naumann
// ----------------------------
`timescale 1ps/1ps

// Test Benches for encoder42 Gates

module tb_demux18_b;
	
	// Constant for inputs
	localparam CONSTANT_INPUTS = 4;
	
	// integer for counting
	integer counter = 0;
	
	// inputs and test inputs
	reg [CONSTANT_INPUTS-1:0] test_i = 4'b0000; // temporary inputs
	
	// output
	wire [7:0] o; // output
	
	task apply_test (input [CONSTANT_INPUTS-1:0] test_i);
		begin
			test_i[0] = test_i[0];
			test_i[1] = test_i[1];
			test_i[2] = test_i[2];
			test_i[3] = test_i[3];
			#100;
		end
	endtask
	
	// instantiates the encoder42 gate
	demux18_b duv (.i(test_i), .o(o));
	
	// Procedure statement
	initial begin
		for (counter = 0; counter < (2**(CONSTANT_INPUTS)); counter = counter + 1) begin
			apply_test(test_i);
			test_i = test_i + 1'b1;
		end
		#100;
	end
	
endmodule