// ----------------------------
// Current Design Names: TB_AND5, TB_OR5
// File Name: tb_gates_5.v
// Function: Testbenches for gates.
// Developer: Kenneth Naumann
// ----------------------------
`timescale 1ps/1ps

// Test Benches for AND Gates

module TB_AND5;
	
	// Constant for inputs
	localparam CONSTANT_INPUTS = 5;
	
	// integer for counting
	integer counter = 0;
	
	// inputs and test inputs
	reg i1, i2, i3, i4, i5; // inputs
	reg [CONSTANT_INPUTS-1:0] test_i = 5'b00000; // temporary inputs
	
	// output
	wire o; // output
	
	task apply_test (input [CONSTANT_INPUTS-1:0] test_i);
		begin
			i1 = test_i[0];
			i2 = test_i[1];
			i3 = test_i[2];
			i4 = test_i[3];
			i5 = test_i[4];
			#100;
		end
	endtask
	
	// instantiates the AND5 gate
	AND5 duv (.i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .o(o));
	
	// Procedure statement
	initial begin
		for (counter = 0; counter < (2**(CONSTANT_INPUTS)); counter = counter + 1) begin
			apply_test(test_i);
			test_i = test_i + 1'b1;
		end
		#100;
	end
	
endmodule

// Test Benches for OR Gates

module TB_OR5;
	
	// Constant for inputs
	localparam CONSTANT_INPUTS = 5;
	
	// integer for counting
	integer counter = 0;
	
	// inputs and test inputs
	reg i1, i2, i3, i4, i5; // inputs
	reg [CONSTANT_INPUTS-1:0] test_i = 5'b00000; // temporary inputs
	
	// output
	wire o; // output
	
	task apply_test (input [CONSTANT_INPUTS-1:0] test_i);
		begin
			i1 = test_i[0];
			i2 = test_i[1];
			i3 = test_i[2];
			i4 = test_i[3];
			i5 = test_i[4];
			#100;
		end
	endtask
	
	// instantiates the OR5 gate
	OR5 duv (.i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .o(o));
	
	// Procedure statement
	initial begin
		for (counter = 0; counter < (2**(CONSTANT_INPUTS)); counter = counter + 1) begin
			apply_test(test_i);
			test_i = test_i + 1'b1;
		end
		#100;
	end
	
endmodule
