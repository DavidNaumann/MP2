#pragma once

#include "systemc.h"

/*
________________________________________________________________________________

							XOR Equation Models
________________________________________________________________________________
*/

SC_MODULE(xor2)          // Declare xor2 sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_xor2()         // C++ function for XOR2 gate
	{
		F.write((i[0].read() && (!(i[1].read()))) || ((!(i[0].read())) && i[1].read()));
	}

	SC_CTOR(xor2)          // Constructor for xor2
	{
		SC_METHOD(do_xor2);  // Register do_xor2 with kernel
		sensitive << i[0] << i[1];  // Sensitivity list
	}
};

SC_MODULE(xor3)          // Declare xor3_e sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_xor3()         // C++ function for XOR3 gate
	{
		F.write((!(i[0].read()) && !(i[1].read()) && i[2].read()) || (!(i[0].read()) && i[1].read() && !(i[2].read())) || ( i[0].read() && !(i[1].read()) && !(i[2].read())) || (i[0].read() && i[1].read() && i[2].read()));
	}

	SC_CTOR(xor3)          // constructor for xor3_e
	{
		SC_METHOD(do_xor3);  // register do_xor3_e with kernel
		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(xor5)          // declare xor5 sc_module
{
	sc_in<bool> i[5];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_xor5()         // a C++ function
	{
		F.write((!(i[0].read()) && !(i[1].read()) && !(i[2].read()) && !(i[3].read()) && (i[4].read())) || (!(i[0].read()) && !(i[1].read()) && !(i[2].read()) && (i[3].read()) && !(i[4].read())) || (!(i[0].read()) && !(i[1].read()) && (i[2].read()) && !(i[3].read()) && !(i[4].read())) || (!(i[0].read()) && !(i[1].read()) && (i[2].read()) && (i[3].read()) && (i[4].read())) || (!(i[0].read()) && (i[1].read()) && !(i[2].read()) && !(i[3].read()) && !(i[4].read())) || (!(i[0].read()) && (i[1].read()) && !(i[2].read()) && (i[3].read()) && (i[4].read())) || (!(i[0].read()) && (i[1].read()) && (i[2].read()) && !(i[3].read()) && (i[4].read())) || (!(i[0].read()) && (i[1].read()) && (i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && !(i[1].read()) && !(i[2].read()) && !(i[3].read()) && !(i[4].read())) || ((i[0].read()) && !(i[1].read()) && !(i[2].read()) && (i[3].read()) && (i[4].read())) || ((i[0].read()) && !(i[1].read()) && (i[2].read()) && !(i[3].read()) && (i[4].read())) || ((i[0].read()) && !(i[1].read()) && (i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && !(i[2].read()) && !(i[3].read()) && (i[4].read())) || ((i[0].read()) && (i[1].read()) && !(i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && !(i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && (i[2].read()) && !(i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && (i[2].read()) && (i[3].read()) && (i[4].read())));
	}

	SC_CTOR(xor5)          // constructor for xor5
	{
		SC_METHOD(do_xor5);  // register do_xor5 with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // sensitivity list
	}
};

/*
________________________________________________________________________________

							XOR Component Models
________________________________________________________________________________
*/

SC_MODULE(xor2_c)          // Declare xor2_c sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S0, S1; // Temporary outputs
	sc_signal<bool> n[2];
	
	// Gates needed for component model of XOR2 minimal SOP

	not1 n1; // variables for the inversion of all of the inputs
	and2 a1; // AND Gate needed for minimal SOP of xor2
	or2 o1; // OR Gate needed for minimal SOP of xor2

	SC_CTOR(xor2_c) : n1("N1"), a1("A1"), o1("O1")         // Constructor for xor2_c
	{
		n1.i[0](i[0]);
		n1.F(n[0]);
		
		n1.i[0](i[1]);
		n1.F(n[1]);

		a1.i[0](i[0]);
		a1.i[1](n[1]);
		a1.F(S0);

		a1.i[0](n[0]);
		a1.i[1](i[1]);
		a1.F(S1);

		o1.i[0](S0);
		o1.i[1](S1);
		o1.F(F);
		sensitive << i[0] << i[1];  // sensitivity list
	}
};

SC_MODULE(xor3_c)          // Declare xor3_c sc_module
{	
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S0, S1, S2, S3; // Temporary outputs
	sc_signal<bool> n[2]; // Temporary signal array for inversion of all inputs

	// Gates needed for component model of XOR3 minimal SOP
	
	not1 n1; // Variables for the inversion of all of the inputs
	and3 a1; // AND Gate needed for minimal SOP of xor3
	or5 o1; // OR Gate needed for minimal SOP of xor3

	SC_CTOR(xor3_c) : n1("N1"), a1("A1"), o1("O1")         // Constructor for xor3_c
	{

		n1.i[0](i[0]);
		n1.F(n[0]);

		n1.i[0](i[1]);
		n1.F(n[1]);

		n1.i[0](i[2]);
		n1.F(n[2]);

		a1.i[0](i[0]);
		a1.i[1](n[1]);
		a1.i[2](n[2]);
		a1.F(S0);

		a1.i[0](n[0]);
		a1.i[1](i[1]);
		a1.i[2](n[2]);
		a1.F(S1);

		a1.i[0](n[0]);
		a1.i[1](n[1]);
		a1.i[2](i[2]);
		a1.F(S2);

		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.F(S3);

		o1.i[0](S0);
		o1.i[0](S0);
		o1.i[0](S1);
		o1.i[0](S2);
		o1.i[0](S3);
		o1.F(F);

		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(xor5_c)          // Declare xor5_c sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15; // Temporary outputs for AND GATES expression
	sc_signal<bool> SO0, SO1, SO2; // Temporary output for OR GATES in SOP expression
	sc_signal<bool> n[5]; // Temporary signal array for inversion of all inputs

	// Gates needed for component model of XOR5 minimal SOP

	not1 n1; // Variables for the inversion of all of the inputs
	and3 a1; // AND needed for minimal SOP of XOR5
	or5 o1; // OR needed for minimal SOP of XOR5

	SC_CTOR(xor5_c) : n1("N1"), a1("A1"), o1("O1")         // Constructor for xor5_c
	{

		n1.i[0](i[0]);
		n1.F(n[0]);

		n1.i[0](i[1]);
		n1.F(n[1]);

		n1.i[0](i[2]);
		n1.F(n[2]);
		
		n1.i[0](i[3]);
		n1.F(n[3]);

		n1.i[0](i[4]);
		n1.F(n[4]);

		a1.i[0](i[0]);
		a1.i[1](n[1]);
		a1.i[2](n[2]);
		a1.i[3](n[3]);
		a1.i[4](n[4]);
		a1.F(S0);

		a1.i[0](n[0]);
		a1.i[1](i[1]);
		a1.i[2](n[2]);
		a1.i[4](n[3]);
		a1.i[3](n[4]);
		a1.F(S1);

		a1.i[0](n[0]);
		a1.i[1](n[1]);
		a1.i[2](i[2]);
		a1.i[3](n[3]);
		a1.i[4](n[4]);
		a1.F(S2);

		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.i[3](n[3]);
		a1.i[4](n[4]);
		a1.F(S3);

		a1.i[0](n[0]);
		a1.i[1](n[1]);
		a1.i[2](n[2]);
		a1.i[3](i[3]);
		a1.i[4](n[4]);
		a1.F(S4);

		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](n[2]);
		a1.i[3](i[3]);
		a1.i[4](n[4]);
		a1.F(S5);

		a1.i[0](i[0]);
		a1.i[1](n[1]);
		a1.i[2](i[2]);
		a1.i[3](i[3]);
		a1.i[4](n[4]);
		a1.F(S6);

		a1.i[0](n[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.i[3](i[3]);
		a1.i[4](n[4]);
		a1.F(S7);

		a1.i[0](n[0]);
		a1.i[1](n[1]);
		a1.i[2](n[2]);
		a1.i[3](n[3]);
		a1.i[4](i[4]);
		a1.F(S8);

		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](n[2]);
		a1.i[3](n[3]);
		a1.i[4](i[4]);
		a1.F(S9);

		a1.i[0](i[0]);
		a1.i[1](n[1]);
		a1.i[2](i[2]);
		a1.i[3](n[3]);
		a1.i[4](i[4]);
		a1.F(S10);

		a1.i[0](n[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.i[3](n[3]);
		a1.i[4](i[4]);
		a1.F(S11);

		a1.i[0](i[0]);
		a1.i[1](n[1]);
		a1.i[2](n[2]);
		a1.i[3](i[3]);
		a1.i[4](i[4]);
		a1.F(S12);

		a1.i[0](n[0]);
		a1.i[1](i[1]);
		a1.i[2](n[2]);
		a1.i[3](i[3]);
		a1.i[4](i[4]);
		a1.F(S13);

		a1.i[0](n[0]);
		a1.i[1](n[1]);
		a1.i[2](i[2]);
		a1.i[3](i[3]);
		a1.i[4](i[4]);
		a1.F(S14);

		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.i[3](i[3]);
		a1.i[4](i[4]);
		a1.F(S15);


		o1.i[0](S0);
		o1.i[0](S1);
		o1.i[0](S2);
		o1.i[0](S3);
		o1.i[0](S4);
		o1.F(SO0);

		o1.i[0](S6);
		o1.i[0](S7);
		o1.i[0](S8);
		o1.i[0](S9);
		o1.i[0](S10);
		o1.F(SO1);

		o1.i[0](S11);
		o1.i[0](S12);
		o1.i[0](S13);
		o1.i[0](S14);
		o1.i[0](S15);
		o1.F(SO2);

		o1.i[0](SO0);
		o1.i[0](SO0);
		o1.i[0](SO1);
		o1.i[0](SO1);
		o1.i[0](SO2);
		o1.F(F);

		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // Sensitivity list
	}
};

/*
________________________________________________________________________________

XOR Self Component Models
________________________________________________________________________________
*/

SC_MODULE(xor2_sc)          // Declare xor2_sc sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	xor2 x1;

	SC_CTOR(xor2_sc): x1("X1")         // Constructor for xor2_sc
	{
		x1.i[0](i[0]);
		x1.i[1](i[1]);
		x1.F(F);
		sensitive << i[0] << i[1];  // Sensitivity list
	}
};

SC_MODULE(xor3_sc)          // Declare xor3_sc sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal <bool> S;

	xor2 x1, x2;

	SC_CTOR(xor3_sc): x1("X1"), x2("X2")         // Constructor for xor3_sc
	{
		x1.i[0](i[0]);
		x1.i[1](i[1]);
		x1.F(S);
		
		x2.i[0](i[2]);
		x2.i[1](S);
		x2.F(F);

		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};

SC_MODULE(xor5_sc)          // Declare xor5_sc sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal <bool> S;

	xor3 x1, x2;

	SC_CTOR(xor5_sc) : x1("X1"), x2("X2")         // Constructor for xor5_sc
	{
		x1.i[0](i[0]);
		x1.i[1](i[1]);
		x1.i[2](i[2]);
		x1.F(S);

		x2.i[0](i[3]);
		x2.i[1](i[4]);
		x2.i[2](S);
		x2.F(F);

		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};