#pragma once

#include <systemc.h>

SC_MODULE(decoder24)          // Declare decoder24 sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<sc_bv<4>> F_ARR; // Output signal ports
	sc_in<bool> E;

	sc_bv<4> tempF_ARR; // temporary F_ARR

	void do_decoder24()         // C++ function for encoder42 gate
	{
		tempF_ARR[0] = (i[0] || i[1]) || (!E);
		tempF_ARR[1] = (!i[0] || i[1]) || (!E);
		tempF_ARR[2] = (i[0] || !i[1]) || (!E);
		tempF_ARR[3] = (((!i[0] || !i[1])) || (!E));
		F_ARR.write(tempF_ARR);
	}

	SC_CTOR(decoder24)          // Constructor for decoder24
	{
		SC_METHOD(do_decoder24);  // Register do_decoder24 with kernel
		sensitive << i[0] << i[1];  // Sensitivity list
	}
};

SC_MODULE(decoder24_b)          // Declare decoder24 sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<sc_bv<4>> F_ARR; // Output signal ports
	sc_in<bool> E;

	std::string tempo; // temporary output

	int sum = 0;

	sc_bv<4> tempF_ARR; // temporary F_ARR

	void do_decoder24_b()         // C++ function for encoder42 gate
	{

		sum = i[0] + i[1];

		if (E)
		{
			switch (sum)
			{
			case 2:
				tempo = "0111";
				break;
			case 1:
				(i[0]) ? (tempo = "1101") : (tempo = "1011");
				break;
			case 0:
				tempo = "1110";
				break;
			default:
				F_ARR = "xxxx";
				break;
			}
		}
		else
		{
			tempo = "1111";
		}

		F_ARR = tempo.c_str();
	}

	SC_CTOR(decoder24_b)          // Constructor for decoder24
	{
		SC_METHOD(do_decoder24_b);  // Register do_decoder24 with kernel
		sensitive << i[0] << i[1];  // Sensitivity list
	}
};