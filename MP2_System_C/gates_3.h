#pragma once

#include "systemc.h"

/*
________________________________________________________________________________

							AND Gate of 3 Inputs Model
________________________________________________________________________________
*/

SC_MODULE(and3)          // Declare and3 sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_and3()         // C++ function for AND3 gate
	{
		F.write((i[0].read() && i[1].read() && i[2].read()));
	}

	SC_CTOR(and3)          // Constructor for and3
	{
		SC_METHOD(do_and3);  // Register do_and3 with kernel
		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};

/*
________________________________________________________________________________

							OR Gate of 3 Inputs Models
________________________________________________________________________________
*/

SC_MODULE(or3)          // Declare or3 sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_or3()         // C++ function for OR3 gate
	{
		F.write((i[0].read() || i[1].read() || i[2].read()));
	}

	SC_CTOR(or3)          // Constructor for or3
	{
		SC_METHOD(do_or3);  // Register do_or3 with kernel
		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};

SC_MODULE(or3_c)          // Declare or3_c sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> n_i1, n_i2, n_i3; // Negated input variables
	sc_signal<bool> S; // Temporary output variable

	not1 n1, n2, n3, n4;
	and3 a1;

	SC_CTOR(or3_c) : n1("N1"), n2("N2"), n3("N3"), n4("N4"), a1("A1")        // Constructor for or3_c
	{
		// Negations

		n1.i[0](i[0]);
		n1.F(n_i1);

		n2.i[0](i[1]);
		n2.F(n_i2);

		n3.i[0](i[2]);
		n3.F(n_i3);

		// Creates AND of negated inputs

		a1.i[0](n_i1);
		a1.i[1](n_i2);
		a1.i[2](n_i3);
		a1.F(S);

		// Negates AND to create OR gate of inputs

		n4.i[0](S);
		n4.F(F);


		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};

SC_MODULE(or3_sc)          // Declare or3_sc sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S; // Temporary output of OR function
	
	// Gates needed for OR3 Gate
	
	or2 o1, o2;

	SC_CTOR(or3_sc) : o1("O1"), o2("O2")       // Constructor for or3_sc
	{
		o1.i[0](i[0]);
		o1.i[1](i[1]);
		o1.F(S);

		o2.i[0](i[2]);
		o2.i[1](S);
		o2.F(F);

		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};