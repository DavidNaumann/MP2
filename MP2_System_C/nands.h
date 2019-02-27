#pragma once

#include "systemc.h"

// NAND Gates Equation Models

SC_MODULE(nand2_e)          // declare nand2_e sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_nand2_e()         // a C++ function
	{
		F.write(!(i[0].read() && i[1].read()));
	}

	SC_CTOR(nand2_e)          // constructor for and2
	{
		SC_METHOD(do_nand2_e);  // register do_and2 with kernel
		sensitive << i[0] << i[1];  // sensitivity list
	}
};

SC_MODULE(nand3_e)          // declare nand3_e sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_nand3_e()         // a C++ function
	{
		F.write(!(i[0].read() && i[1].read() && i[2].read()));
	}

	SC_CTOR(nand3_e)          // constructor for nand3_e
	{
		SC_METHOD(do_nand3_e);  // register do_nand3_e with kernel
		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(nand5_e)          // declare nand5_e sc_module
{
	sc_in<bool> i[5];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_nand5_e()         // a C++ function
	{
		F.write(!(i[0].read() && i[1].read() && i[2].read() && i[3].read() && i[4].read()));
	}

	SC_CTOR(nand5_e)          // constructor for nand5_e
	{
		SC_METHOD(do_nand5_e);  // register do_nand5_e with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // sensitivity list
	}
};

/*
________________________________________________________________________________

NAND Component Models
________________________________________________________________________________
*/

SC_MODULE(nand2_c)          // declare nand2_c sc_module
{
	sc_in<bool> i[2];       // input signal ports
	sc_out<bool> F;         // output signal ports

	sc_signal<bool> S;

	and2 a1;
	not1 n1;

	SC_CTOR(nand2_c): a1("A1"), n1("N1")          // constructor for nand2_c
	{
		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.F(S);

		n1.i[0](S);
		n1.F(F);

		sensitive << i[0] << i[1];  // sensitivity list
	}
};

SC_MODULE(nand3_c)          // declare nand3_c sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // output signal ports

	sc_signal<bool> S;

	and3 a1;
	not1 n1;

	SC_CTOR(nand3_c) : a1("A1"), n1("N1")          // constructor for nand3_c
	{
		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.F(S);

		n1.i[0](S);
		n1.F(F);

		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(nand5_c)          // declare nand3_c sc_module
{
	sc_in<bool> i[5];       // input signal ports
	sc_out<bool> F;         // output signal ports

	sc_signal<bool> S;

	and5 a1;
	not1 n1;

	SC_CTOR(nand5_c) : a1("A1"), n1("N1")          // constructor for nand3_c
	{
		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.i[3](i[3]);
		a1.i[4](i[4]);
		a1.F(S);

		n1.i[0](S);
		n1.F(F);

		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // sensitivity list
	}
};