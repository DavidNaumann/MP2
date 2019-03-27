#pragma once

#include <systemc.h>

/*
i[0..1] = select lines
i[2..5] = data lines

*/
SC_MODULE(mux41_b)          // Declare mux41_b sc_module
{
	sc_in<bool> i[6];       // Input signal ports
	sc_out<sc_lv<1>> F_ARR; // Output signal ports
	sc_in<bool> E;

	std::string temp_arr;

	int currline = 0; // currline calculation

	void do_mux41_b()         // C++ function for mux41 gate
	{
		if (E)
		{
			currline = (i[0] + (i[1] * 2));
			switch (currline)
			{
			case 0:
				temp_arr = '0' + i[2];
				break;
			case 1:
				temp_arr = '0' + i[3];
				break;
			case 2:
				temp_arr = '0' + i[4];
				break;
			case 3:
				temp_arr = '0' + i[5];
				break;
			default:
				temp_arr = '0';
			}
		}
		else
		{
			temp_arr = 'Z';
		}
		F_ARR = temp_arr.c_str();
	}

	SC_CTOR(mux41_b)          // Constructor for mux41_b
	{
		SC_METHOD(do_mux41_b);  // Register mux41_b with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4] << i[5];  // Sensitivity list
	}
};