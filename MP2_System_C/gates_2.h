#pragma once

#include "systemc.h"

// AND Gates

SC_MODULE(and2)          // declare and2 sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_and2()         // a C++ function
	{
		F.write((i[0].read() && i[1].read()));
	}

	SC_CTOR(and2)          // constructor for and2
	{
		SC_METHOD(do_and2);  // register do_and2 with kernel
		sensitive << i[0] << i[1];  // sensitivity list
	}
};

// OR Gates

SC_MODULE(or2)          // declare or2 sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_or2()         // a C++ function
	{
		F.write((i[0].read() || i[1].read()));
	}

	SC_CTOR(or2)          // constructor for and2
	{
		SC_METHOD(do_or2);  // register do_or2 with kernel
		sensitive << i[0] << i[1];  // sensitivity list
	}
};