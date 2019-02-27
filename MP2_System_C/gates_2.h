#pragma once

#include "systemc.h"

/*
________________________________________________________________________________

						AND Gate of 2 Inputs Model
________________________________________________________________________________
*/

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

/*
________________________________________________________________________________

						OR Gate of 2 Inputs Models
________________________________________________________________________________
*/

SC_MODULE(or2)          // declare or2 sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_or2()         // a C++ function
	{
		F.write((i[0].read() || i[1].read()));
	}

	SC_CTOR(or2)          // constructor for or2
	{
		SC_METHOD(do_or2);  // register do_or2 with kernel
		sensitive << i[0] << i[1];  // sensitivity list
	}
};

SC_MODULE(or2_c)          // declare or2_c sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	sc_signal<bool> n_i1, n_i2;
	sc_signal<bool> S;

	not1 n1;
	and2 a1;

	SC_CTOR(or2_c): n1("N1"), a1("A1")        // Constructor for or2_c
	{
		// Negation of inputs

		n1.i[0](i[0]);
		n1.F(n_i1);

		n1.i[0](i[1]);
		n1.F(n_i2);

		// Creates AND of negated inputs

		a1.i[0](n_i1);
		a1.i[1](n_i2);
		a1.F(S);

		// Negates AND of negated inputs to create OR gate
		
		n1.i[0](S);
		n1.F(F);


		sensitive << i[0] << i[1];  // Sensitivity list
	}
};

SC_MODULE(or2_sc)          // Declare or5_sc sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S; // Temporary output of OR function

					   // Gates needed for OR5 Gate

	or2 o1;

	SC_CTOR(or2_sc) : o1("O1")       // Constructor for or5_sc
	{
		o1.i[0](i[0]);
		o1.i[1](i[1]);
		o1.F(F);

		sensitive << i[0] << i[1];  // Sensitivity list
	}
};