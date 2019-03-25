#pragma once

#include <systemc.h>

/*
i[0..2] = select lines
i[3..10] = data lines

*/
SC_MODULE(mux81_b)          // Declare mux81_b sc_module
{
	sc_in<bool> i[11];       // Input signal ports
	sc_out<bool> F; // Output signal ports
	sc_in<bool> E;

	int currline = 0; // currline calculation

	void do_mux81_b()         // C++ function for mux81 gate
	{


		if (E)
		{
			currline = (i[0] + (i[1] * 2) + (i[2] * 4));
			switch (currline)
			{
			case 0:
				F = i[3];
				break;
			case 1:
				F = i[4];
				break;
			case 2:
				F = i[5];
				break;
			case 3:
				F = i[6];
				break;
			case 4:
				F = i[7];
				break;
			case 5:
				F = i[8];
				break;
			case 6:
				F = i[9];
				break;
			case 7:
				F = i[10];
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

	SC_CTOR(mux81_b)          // Constructor for mux81_b
	{
		SC_METHOD(do_mux81_b);  // Register do_demux14_b with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4] << i[5] << i[6] << i[7] << i[8] << i[9] << i[10];  // Sensitivity list
	}
};