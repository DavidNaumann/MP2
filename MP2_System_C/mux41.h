#pragma once

#include <systemc.h>

/*
i[0..1] = select lines
i[2..5] = data lines

*/
SC_MODULE(mux41_b)          // Declare mux41_b sc_module
{
	sc_in<bool> i[6];       // Input signal ports
	sc_out<bool> F; // Output signal ports
	sc_in<bool> E;

	int currline = 0; // currline calculation

	void do_mux41_b()         // C++ function for mux41 gate
	{
		if (E)
		{
			currline = (i[0] + (i[1] * 2));
			switch (currline)
			{
			case 0:
				F = i[2];
				break;
			case 1:
				F = i[3];
				break;
			case 2:
				F = i[4];
				break;
			case 3:
				F = i[5];
				break;
			default:
				F = 0;
			}
		}
		else
		{
			F = 0;
		}
	}

	SC_CTOR(mux41_b)          // Constructor for mux41_b
	{
		SC_METHOD(do_mux41_b);  // Register mux41_b with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4] << i[5];  // Sensitivity list
	}
};