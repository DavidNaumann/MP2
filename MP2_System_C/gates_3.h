#pragma once

#include "systemc.h"

// AND Gates

SC_MODULE(and3)          // declare and2 sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_and3()         // a C++ function
	{
		F.write((i[0].read() && i[1].read() && i[2].read()));
	}

	SC_CTOR(and3)          // constructor for and2
	{
		SC_METHOD(do_and3);  // register do_and2 with kernel
		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

// OR Gates

SC_MODULE(or3)          // declare or2 sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_or3()         // a C++ function
	{
		F.write((i[0].read() || i[1].read() || i[2].read()));
	}

	SC_CTOR(or3)          // constructor for and2
	{
		SC_METHOD(do_or3);  // register do_or2 with kernel
		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};