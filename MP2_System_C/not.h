#pragma once

#include "systemc.h"

/*
________________________________________________________________________________

						NOT Gate of 1 Input Model
________________________________________________________________________________
*/

SC_MODULE(not1)          // Declare not1 sc_module
{
	sc_in<bool> i[1];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_not1()         // C++ function for NOT1 gate
	{
		F.write(!(i[0].read()));
	}

	SC_CTOR(not1)          // Constructor for not1
	{
		SC_METHOD(do_not1);  // Register do_not1 with kernel
		sensitive << i[0];  // Sensitivity list
	}
};