#pragma once

#include <systemc.h>

SC_MODULE(decoder24)          // Declare decoder24 sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<sc_lv<4>> F_ARR; // Output signal ports
	sc_in<bool> E;

	sc_lv<4> tempF_ARR; // temporary F_ARR

	void do_decoder24()         // C++ function for encoder42 gate
	{
<<<<<<< HEAD
		tempF_ARR[0] = (i[0] || i[1]) || (!E);
		tempF_ARR[1] = (!i[0] || i[1]) || (!E);
		tempF_ARR[2] = (i[0] || !i[1]) || (!E);
		tempF_ARR[3] = (((!i[0] || !i[1])) || (!E));
		if (E)
		{
			tempF_ARR[0] = 'Z';
			tempF_ARR[1] = 'Z';
			tempF_ARR[2] = 'Z';
			tempF_ARR[3] = 'Z';

		}
=======
		tempF_ARR[0] = ((!(i[0] && i[1])) || (!E));
		tempF_ARR[1] = ((!(!(i[0]) &&  i[1])) || (!E));
		tempF_ARR[2] = ((!(i[0] && !(i[1]))) || (!E));
		tempF_ARR[3] = (((i[0] || i[1])) || (!E));
>>>>>>> parent of cd3b2f9... Fixed decoder for correct logic function
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
	sc_out<sc_lv<4>> F_ARR; // Output signal ports
	sc_in<bool> E;

	int sum = 0;

	sc_lv<4> tempF_ARR; // temporary F_ARR

	void do_decoder24_b()         // C++ function for encoder42 gate
	{

		sum = i[0] + i[1];

		if (E)
		{
			switch (sum)
			{
			case 2:
				F_ARR = "1110";
				break;
			case 1:
				if (i[0])
				{
					F_ARR = "1101";
				}
				else
				{
					F_ARR = "1011";
				}
				break;
			case 0:
				F_ARR = "0111";
				break;
			default:
				F_ARR = "xxxx";
				break;
			}
		}
		else
		{
			F_ARR = "1111";
		}
		tempF_ARR[0] = ((!(i[0] && i[1])) || (!E));
		tempF_ARR[1] = ((!(!(i[0]) && i[1])) || (!E));
		tempF_ARR[2] = ((!(i[0] && !(i[1]))) || (!E));
		tempF_ARR[3] = (((i[0] || i[1])) || (!E));
		F_ARR.write(tempF_ARR);
	}

	SC_CTOR(decoder24_b)          // Constructor for decoder24
	{
		SC_METHOD(do_decoder24_b);  // Register do_decoder24 with kernel
		sensitive << i[0] << i[1];  // Sensitivity list
	}
};