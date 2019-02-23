// ----------------------------
// Current Design Names: TB_AND2, TB_OR2
// File Name: tb_gates_2.v
// Function: Testbenches for gates.
// Developer: Kenneth Naumann
// ----------------------------
`timescale 1ps/1ps

module TB_AND2;
	
	reg i1, i2; // input 1
	wire o; // output
	
	task apply_test (input test_i1, input test_i2);
		begin
			i1 = test_i1;
			i2 = test_i2;
			#100;
		end
	endtask
	
	// instantiates the AND2 gate
	AND2 duv (.i1(i1), .i2(i2), .o(o));
	
	// Procedure statement
	initial begin
		apply_test (0, 0);
		apply_test (0, 1);
		apply_test (1, 0);
		apply_test (1, 1);
		$wait;
	end
	
endmodule

module TB_OR2;
	
	reg i1, i2; // input 1
	wire o; // output
	
	task apply_test (input test_i1, input test_i2);
		begin
			i1 = test_i1;
			i2 = test_i2;
			#100;
		end
	endtask
	
	// instantiates the OR2 gate
	OR2 duv (.i1(i1), .i2(i2), .o(o));
	
	// Procedure statement
	initial begin
		apply_test (0, 0);
		apply_test (0, 1);
		apply_test (1, 0);
		apply_test (1, 1);
		$wait;
	end
	
endmodule
