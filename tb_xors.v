// ----------------------------
// Current Design Names: TB_XOR2, TB_XOR3, TB_XOR5
// File Name: tb_xors.v
// Function: Testbenches for XOR gates.
// Developer: Kenneth Naumann
// ----------------------------
`timescale 1ps/1ps

// XOR2_E Testbench

module TB_XOR2_E;
	
	reg i1, i2; // inputs
	wire o; // output
	
	task apply_test (input test_i1, input test_i2);
		begin
			i1 = test_i1;
			i2 = test_i2;
			#100;
		end
	endtask
	
	// instantiates the XOR2 gate
	XOR2_E duv (.i1(i1), .i2(i2), .o(o));
	
	// Procedure statement
	initial begin
		apply_test (0, 0);
		apply_test (0, 1);
		apply_test (1, 0);
		apply_test (1, 1);
		#100;
	end
	
endmodule

// XOR3_E Testbench

module TB_XOR3_E;
	
	// Constant for inputs
	localparam CONSTANT_INPUTS = 3;
	
	// integer for counting
	integer counter = 0;
	
	// inputs and test inputs
	reg i1, i2, i3; // inputs
	reg [CONSTANT_INPUTS-1:0] test_i = 3'b000; // temporary inputs
	
	// output
	wire o; // output
	
	task apply_test (input [CONSTANT_INPUTS-1:0] test_i);
		begin
			i1 = test_i[0];
			i2 = test_i[1];
			i3 = test_i[2];
			#100;
		end
	endtask
	
	// instantiates the XOR3 gate
	XOR3_E duv (.i1(i1), .i2(i2), .i3(i3), .o(o));
	
	// Procedure statement
	initial begin
		for (counter = 0; counter < (2**(CONSTANT_INPUTS)); counter = counter + 1) begin
			apply_test(test_i);
			test_i = test_i + 1'b1;
		end
		#100;
	end
	
endmodule

// XOR5_E Testbench

module TB_XOR5_E;
	
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
	
	// instantiates the XOR5 gate
	XOR5_E duv (.i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .o(o));
	
	// Procedure statement
	initial begin
		for (counter = 0; counter < (2**(CONSTANT_INPUTS)); counter = counter + 1) begin
			apply_test(test_i);
			test_i = test_i + 1'b1;
		end
		#100;
	end
	
endmodule