#pragma once

#include <systemc.h>

SC_MODULE(demux14_b)          // Declare demux14 sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<sc_bv<4>> F_ARR; // Output signal ports
	sc_in<bool> E;

	char tempo[5] = "0000"; // Temporary output
	char ls = '0' + i[2]; // Line select

	int sum = 0; // Sum of all ports

	sc_bv<4> tempF_ARR; // temporary F_ARR

	void do_demux14_b()         // C++ function for demux14 gate
	{

		sum = i[0] + i[1];

		switch (sum)
		{
			case 2:
				tempo[3] = ls;
				break;
			case 1:
				(i[0]) ? (tempo[1] = ls) : (tempo[2] = ls);
				break;
			case 0:
				tempo[0] = ls;
				break;
			default:
				F_ARR = "0000";
				break;
		}

		F_ARR = tempo;
	}

	SC_CTOR(demux14_b)          // Constructor for demux14_b
	{
		SC_METHOD(do_demux14_b);  // Register do_demux14_b with kernel
		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};