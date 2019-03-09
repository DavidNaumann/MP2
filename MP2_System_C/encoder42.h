#pragma once

#include "systemc.h"

// NEED TO DOCUMENT

/*
________________________________________________________________________________

						4:2 Encoder Models
________________________________________________________________________________
*/

SC_MODULE(encoder42)          // Declare encoder42 sc_module
{
	sc_in<bool> i[4];       // Input signal ports
	sc_out<sc_bv<2>> F_ARR; // Output signal ports
	
	sc_bv<2> tempF_ARR; // temporary F_ARR

	void do_encoder42()         // C++ function for encoder42 gate
	{
		tempF_ARR[0] = i[3] || (i[1] && !i[2]);
		tempF_ARR[1] = i[3] || i[2];
		F_ARR.write(tempF_ARR);
		cout << tempF_ARR[0] << tempF_ARR[1] << endl;
	}

	SC_CTOR(encoder42)          // Constructor for encoder42
	{
		SC_METHOD(do_encoder42);  // Register do_encoder42 with kernel
		sensitive << i[0] << i[1] << i[2] << i[3];  // Sensitivity list
	}
};

SC_MODULE(encoder42_c)          // Declare encoder42_c sc_module
{
	sc_in<bool> i[4];       // Input signal ports
	sc_out<sc_bv<2>> F_ARR;         // Output signal ports

	std::string tempo = "";
	int total_inputs = 4;
	int counter;
	int peak_i;

	void do_encoder42()         // C++ function for encoder42 gate
	{
		tempo = "";
		peak_i = -1;
		for (counter = 0; counter < total_inputs; counter++)
		{
			if (i[counter])
			{
				peak_i = counter;
			}
		}
		
		switch (peak_i)
		{
			case 0:
				tempo = "00";
				break;
			case 1:
				tempo = "01";
				break;
			case 2:
				tempo = "10";
				break;
			case 3:
				tempo = "11";
				break;
			default:
				tempo = "00";
				break;
		}

		F_ARR = tempo.c_str();
	}

	SC_CTOR(encoder42_c)       // Constructor for and3
	{
		SC_METHOD(do_encoder42);
		sensitive << i[0] << i[1] << i[2] << i[3];  // Sensitivity list
	}
};