// ----------------------------
// Current Design Names: tb_encoder42
// File Name: tb_encoder42.v
// Function: Testbenches for encoder42.
// Developer: Kenneth Naumann
// ----------------------------
`timescale 1ps/1ps

// Test Benches for AND Gates

module tb_encoder83_c;
	
	// Constant for inputs
	localparam CONSTANT_INPUTS = 8;
	
	// integer for counting
	integer counter = 0;
	
	// inputs and test inputs
	reg i1, i2, i3, i4, i5, i6, i7, i8; // inputs
	reg [CONSTANT_INPUTS-1:0] test_i = 8'b00000000; // temporary inputs
	
	// output
	wire [2:0] o; // output
	
	task apply_test (input [CONSTANT_INPUTS-1:0] test_i);
		begin
			i1 = test_i[0];
			i2 = test_i[1];
			i3 = test_i[2];
			i4 = test_i[3];
			i5 = test_i[4];
			i6 = test_i[5];
			i7 = test_i[6];
			i8 = test_i[7];
			#100;
		end
	endtask
	
	// instantiates the encoder42 gate
	encoder83_c duv (.i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .i8(i8), .o(o));
	
	// Procedure statement
	initial begin
		for (counter = 0; counter < (2**(CONSTANT_INPUTS)); counter = counter + 1) begin
			apply_test(test_i);
			test_i = test_i + 1'b1;
		end
		#100;
	end
	
endmodule
