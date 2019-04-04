#pragma once

#include "systemc.h"

/*
________________________________________________________________________________

							AND Gate of 5 Inputs Model
________________________________________________________________________________
*/

SC_MODULE(and5)          // Declare and5 sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_and5()         // C++ function for AND5 gate
	{
		F.write((i[0].read() && i[1].read() && i[2].read() && i[3].read() && i[4].read()));
	}

	SC_CTOR(and5)          // Constructor for and5
	{
		SC_METHOD(do_and5);  // Register do_and5 with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // Sensitivity list
	}
};

/*
________________________________________________________________________________

							OR Gate of 5 Inputs Models
________________________________________________________________________________
*/

SC_MODULE(or5)          // Declare or5 sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_or5()         // C++ function for OR5 gate
	{
		F.write((i[0].read() || i[1].read() || i[2].read() || i[3].read() || i[4].read()));
	}

	SC_CTOR(or5)          // Constructor for or5
	{
		SC_METHOD(do_or5);  // Register do_or5 with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // Sensitivity list
	}
};

SC_MODULE(or5_c)          // Declare or3_c sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> n_i1, n_i2, n_i3, n_i4, n_i5; // Negated input variables
	sc_signal<bool> S; // Temporary output variable

	// Gates needed for component model of OR5 minimal SOP
	
	not1 n1, n2, n3, n4, n5, n6;
	and5 a1;

	SC_CTOR(or5_c) : n1("N1"), n2("N2"), n3("N3"), n4("N4"), n5("N5"), n6("N6"), a1("A1")        // Constructor for or3_c
	{
		// Negations

		n1.i[0](i[0]);
		n1.F(n_i1);

		n2.i[0](i[1]);
		n2.F(n_i2);

		n3.i[0](i[2]);
		n3.F(n_i3);

		n4.i[0](i[3]);
		n4.F(n_i4);

		n5.i[0](i[4]);
		n5.F(n_i5);

		// Creates AND of negated inputs
		a1.i[0](n_i1);
		a1.i[1](n_i2);
		a1.i[2](n_i3);
		a1.i[3](n_i4);
		a1.i[4](n_i5);
		a1.F(S);

		// Negates AND of negated inputs to OR Gate
		n6.i[0](S);
		n6.F(F);


		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // Sensitivity list
	}
};

SC_MODULE(or5_sc)          // Declare or5_sc sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S; // Temporary output of OR function

					   // Gates needed for OR5 Gate

	or3 o1, o2;

	SC_CTOR(or5_sc) : o1("O1"), o2("O2")      // Constructor for or5_sc
	{
		o1.i[0](i[0]);
		o1.i[1](i[1]);
		o1.i[2](i[2]);
		o1.F(S);

		o2.i[0](i[3]);
		o2.i[1](i[4]);
		o2.i[2](S);
		o2.F(F);

		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // Sensitivity list
	}
};