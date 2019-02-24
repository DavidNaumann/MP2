#pragma once

#include "systemc.h"

// AND Gates

SC_MODULE(and5)          // declare and5 sc_module
{
	sc_in<bool> i[5];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_and5()         // a C++ function
	{
		F.write((i[0].read() && i[1].read() && i[2].read() && i[3].read() && i[4].read()));
	}

	SC_CTOR(and5)          // constructor for and5
	{
		SC_METHOD(do_and5);  // register do_and2 with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // sensitivity list
	}
};

// OR Gates

SC_MODULE(or5)          // declare or5 sc_module
{
	sc_in<bool> i[5];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_or5()         // a C++ function
	{
		F.write((i[0].read() || i[1].read() || i[2].read() || i[3].read() || i[4].read()));
	}

	SC_CTOR(or5)          // constructor for and2
	{
		SC_METHOD(do_or5);  // register do_and2 with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // sensitivity list
	}
};