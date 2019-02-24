#pragma once

#include "systemc.h"

// AND Gates

SC_MODULE(and3)          // declare and2 sc_module
{
	sc_in<bool> i1, i2, i3;       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_and3()         // a C++ function
	{
		F.write(((i1.read() && i1.read()) && i3.read()));
	}

	SC_CTOR(and3)          // constructor for and3
	{
		SC_METHOD(do_and3);  // register do_and3 with kernel
		sensitive << i1 << i2 << i3;  // sensitivity list
	}
};

// OR Gates

SC_MODULE(or3)          // declare or2 sc_module
{
	sc_in<bool> i1, i2, i3;       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_or3()         // a C++ function
	{
		F.write((i1.read() || i2.read() || i3.read()));
	}

	SC_CTOR(or3)          // constructor for nand2
	{
		SC_METHOD(do_or3);  // register do_or2 with kernel
		sensitive << i1 << i2 << i3;  // sensitivity list
	}
};