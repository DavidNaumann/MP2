module tb_encoder21_c;
	
	reg i1, i2; // inputs
	wire o; // output
	
	task apply_test (input test_i2, input test_i1);
		begin
			i1 = test_i1;
			i2 = test_i2;
			#100;
		end
	endtask
	
	// instantiates the XOR2 gate
	encoder21_c duv (.i1(i1), .i2(i2), .o(o));
	
	// Procedure statement
	initial begin
		apply_test (0, 0);
		apply_test (0, 1);
		apply_test (1, 0);
		apply_test (1, 1);
		#100;
	end
	
endmodule
