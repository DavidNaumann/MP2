#pragma once

#include "systemc.h"

/*
________________________________________________________________________________

							XOR Equation Models
________________________________________________________________________________
*/

SC_MODULE(xor2_e)          // declare xor2 sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_xor2_e()         // a C++ function
	{
		F.write((i[0].read() && (!(i[1].read()))) || ((!(i[0].read())) && i[1].read()));
	}

	SC_CTOR(xor2_e)          // constructor for xor2
	{
		SC_METHOD(do_xor2_e);  // register do_xor2 with kernel
		sensitive << i[0] << i[1];  // sensitivity list
	}
};

SC_MODULE(xor3_e)          // declare xor3_e sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_xor3_e()         // a C++ function
	{
		F.write((!(i[0].read()) && !(i[1].read()) && i[2].read()) || (!(i[0].read()) && i[1].read() && !(i[2].read())) || ( i[0].read() && !(i[1].read()) && !(i[2].read())) || (i[0].read() && i[1].read() && i[2].read()));
	}

	SC_CTOR(xor3_e)          // constructor for xor3_e
	{
		SC_METHOD(do_xor3_e);  // register do_xor3_e with kernel
		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(xor5_e)          // declare xor5_e sc_module
{
	sc_in<bool> i[5];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_xor5_e()         // a C++ function
	{
		F.write((!(i[0].read()) && !(i[1].read()) && !(i[2].read()) && !(i[3].read()) && (i[4].read())) || (!(i[0].read()) && !(i[1].read()) && !(i[2].read()) && (i[3].read()) && !(i[4].read())) || (!(i[0].read()) && !(i[1].read()) && (i[2].read()) && !(i[3].read()) && !(i[4].read())) || (!(i[0].read()) && !(i[1].read()) && (i[2].read()) && (i[3].read()) && (i[4].read())) || (!(i[0].read()) && (i[1].read()) && !(i[2].read()) && !(i[3].read()) && !(i[4].read())) || (!(i[0].read()) && (i[1].read()) && !(i[2].read()) && (i[3].read()) && (i[4].read())) || (!(i[0].read()) && (i[1].read()) && (i[2].read()) && !(i[3].read()) && (i[4].read())) || (!(i[0].read()) && (i[1].read()) && (i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && !(i[1].read()) && !(i[2].read()) && !(i[3].read()) && !(i[4].read())) || ((i[0].read()) && !(i[1].read()) && !(i[2].read()) && (i[3].read()) && (i[4].read())) || ((i[0].read()) && !(i[1].read()) && (i[2].read()) && !(i[3].read()) && (i[4].read())) || ((i[0].read()) && !(i[1].read()) && (i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && !(i[2].read()) && !(i[3].read()) && (i[4].read())) || ((i[0].read()) && (i[1].read()) && !(i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && !(i[2].read()) && (i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && (i[2].read()) && !(i[3].read()) && !(i[4].read())) || ((i[0].read()) && (i[1].read()) && (i[2].read()) && (i[3].read()) && (i[4].read())));
	}

	SC_CTOR(xor5_e)          // constructor for xor5_e
	{
		SC_METHOD(do_xor5_e);  // register do_xor5_e with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // sensitivity list
	}
};

/*
________________________________________________________________________________

							XOR Component Models
________________________________________________________________________________
*/




/*
________________________________________________________________________________

XOR Self Component Models
________________________________________________________________________________
*/

SC_MODULE(xor2_sc)          // declare xor2_sc sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	xor2_e x1;

	SC_CTOR(xor2_sc): x1("X1")         // constructor for xor2_sc
	{
		x1.i[0](i[0]);
		x1.i[1](i[1]);
		x1.F(F);
		sensitive << i[0] << i[1];  // sensitivity list
	}
};

SC_MODULE(xor3_sc)          // declare xor3_sc sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // output signal ports

	sc_signal <bool> S;

	xor2_e x1, x2;

	SC_CTOR(xor3_sc): x1("X1"), x2("X2")         // constructor for xor3_sc
	{
		x1.i[0](i[0]);
		x1.i[1](i[1]);
		x1.F(S);
		
		x2.i[0](i[2]);
		x2.i[1](S);
		x2.F(F);

		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(xor5_sc)          // declare xor3_sc sc_module
{
	sc_in<bool> i[5];       // input signal ports
	sc_out<bool> F;         // output signal ports

	sc_signal <bool> S;

	xor3_e x1, x2;

	SC_CTOR(xor5_sc) : x1("X1"), x2("X2")         // constructor for xor5_sc
	{
		x1.i[0](i[0]);
		x1.i[1](i[1]);
		x1.i[2](i[2]);
		x1.F(S);

		x2.i[0](i[3]);
		x2.i[1](i[4]);
		x2.i[2](S);
		x2.F(F);

		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};