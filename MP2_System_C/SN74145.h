#pragma once

#include <systemc.h>

/*
Active High = i[3..2]
Active Low = i[0..1]

1234
LLHH 3
LLHL 2
LLLH 1
LLLL 0
LHHH 7
LHHL 6
LHLH 5
LHLL 4
HLHH F
HLHL F
HLLH 9
HLLL 8
HHHH Z
HHHL Z
HHLH Z
HHLL Z

*/

SC_MODULE(SN74145_b)          // Declare SN74145_b sc_module
{
	sc_in<bool> i[4];       // Input signal ports
	sc_out<sc_lv<10>> F_ARR; // Output signal ports

	std::string tempo; // temporary output

	int currline = 0; // currline calculation

	void do_SN74145_b()         // C++ function for mux81 gate
	{
		tempo = "";
		currline = (i[0] + (i[1] * 2) + (i[2] * 4) + (i[3]*8));
		switch (currline)
		{
			case 0:
				tempo = "1111111110";
				break;
			case 1:
				tempo = "1111111101";
				break;
			case 2:
				tempo = "1111111011";
				break;
			case 3:
				tempo = "1111110111";
				break;
			case 4:
				tempo = "1111101111";
				break;
			case 5:
				tempo = "1111011111";
				break;
			case 6:
				tempo = "1110111111";
				break;
			case 7:
				tempo = "1101111111";
				break;
			case 8:
				tempo = "1011111111";
				break;
			case 9:
				tempo = "0111111111";
				break;
			default:
				tempo = "ZZZZZZZZZZ";
				break;
		}
		F_ARR = tempo.c_str();
	}

	SC_CTOR(SN74145_b)          // Constructor for SN74145_b
	{
		SC_METHOD(do_SN74145_b);  // Register do_demux14_b with kernel
		sensitive << i[0] << i[1] << i[2] << i[3];  // Sensitivity list
	}
};

SC_MODULE(SN74145_spc)          // Declare SN74145_b sc_module
{
	sc_in<bool> i[4];       // Input signal ports
	sc_out<sc_lv<10>> F_ARR; // Output signal ports

	std::string tempo; // temporary output

	int currline = 0; // currline calculation

	void do_SN74145_spc()         // C++ function for mux81 gate
	{
		tempo = "";
		currline = (i[0] + (i[1] * 2) + (i[2] * 4) + (i[3] * 8));
		switch (currline)
		{
		case 0:
			tempo = "0000001000";
			break;
		case 1:
			tempo = "0000000100";
			break;
		case 2:
			tempo = "0000000010";
			break;
		case 3:
			tempo = "0000000001";
			break;
		case 4:
			tempo = "0010000000";
			break;
		case 5:
			tempo = "0001000000";
			break;
		case 6:
			tempo = "0000100000";
			break;
		case 7:
			tempo = "0000010000";
			break;
		case 8:
			tempo = "ZZZZZZZZZZ";
			break;
		case 9:
			tempo = "ZZZZZZZZZZ";
			break;
		case 10:
			tempo = "1000000000";
			break;
		case 11:
			tempo = "0100000000";
			break;
		default:
			tempo = "ZZZZZZZZZZ";
			break;
		}
		F_ARR = tempo.c_str();
	}

	SC_CTOR(SN74145_spc)          // Constructor for SN74145_b
	{
		SC_METHOD(do_SN74145_spc);  // Register do_demux14_b with kernel
		sensitive << i[0] << i[1] << i[2] << i[3];  // Sensitivity list
	}
};