#pragma once

#include "systemc.h"

// AND Gates

SC_MODULE(not1)          // declare and2 sc_module
{
	sc_in<bool> i[1];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_not1()         // a C++ function
	{
		F.write(!(i[0].read()));
	}

	SC_CTOR(not1)          // constructor for and2
	{
		SC_METHOD(do_not1);  // register do_and2 with kernel
		sensitive << i[0];  // sensitivity list
	}
};