#pragma once

#include "systemc.h"

SC_MODULE(demux14_b)          // Declare demux14 sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<sc_lv<4>> F_ARR; // Output signal ports
	sc_in<bool> E;

	char tempo[5] = "0000"; // Temporary output
	char temp_i = '0';

	int sum = 0; // Sum of all ports

	void do_demux14_b()         // C++ function for demux14 gate
	{
		if (E)
		{
			tempo[0] = '0';
			tempo[1] = '0';
			tempo[2] = '0';
			tempo[3] = '0';
			sum = i[0] + i[1];
			temp_i = '0' + i[2];
			switch (sum)
			{
			case 2:
				tempo[0] = temp_i;
				break;
			case 1:
				(i[0]) ? (tempo[2] = temp_i) : (tempo[1] = temp_i);
				break;
			case 0:
				tempo[3] = temp_i;
				break;
			default:
				F_ARR = tempo;
				break;
			}
		}
		else
		{
			tempo[0] = 'Z';
			tempo[1] = 'Z';
			tempo[2] = 'Z';
			tempo[3] = 'Z';
		}

		F_ARR = tempo;
	}

	SC_CTOR(demux14_b)          // Constructor for demux14_b
	{
		SC_METHOD(do_demux14_b);  // Register do_demux14_b with kernel
		sensitive << i[0] << i[1];  // Sensitivity list
		sensitive << E;
	}
};