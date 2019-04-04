#pragma once

#include "systemc.h"

/*
________________________________________________________________________________

							NAND Equation Models
________________________________________________________________________________
*/

SC_MODULE(nand2)          // Declare nand2 sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_nand2()         // C++ function for NAND2 gate
	{
		F.write(!(i[0].read() && i[1].read()));
	}

	SC_CTOR(nand2)          // Constructor for nand2
	{
		SC_METHOD(do_nand2);  // Register do_nand2 with kernel
		sensitive << i[0] << i[1];  // Sensitivity list
	}
};

SC_MODULE(nand3)          // Declare nand3 sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // output signal ports

	void do_nand3()         // C++ function for NAND3 Gate
	{
		F.write(!(i[0].read() && i[1].read() && i[2].read()));
	}

	SC_CTOR(nand3)          // constructor for nand3
	{
		SC_METHOD(do_nand3);  // register do_nand3 with kernel
		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(nand5)          // Declare nand5 sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	void do_nand5()         // C++ function for NAND5 Gate
	{
		F.write(!(i[0].read() && i[1].read() && i[2].read() && i[3].read() && i[4].read()));
	}

	SC_CTOR(nand5)          // constructor for nand5
	{
		SC_METHOD(do_nand5);  // register do_nand5 with kernel
		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // sensitivity list
	}
};

/*
________________________________________________________________________________

							NAND Component Models
________________________________________________________________________________
*/

SC_MODULE(nand2_c)          // Declare nand2_c sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S;

	// Gates for NAND2 in minimal SOP form

	and2 a1;
	not1 n1;

	SC_CTOR(nand2_c): a1("A1"), n1("N1")          // Constructor for nand2_c
	{
		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.F(S);

		n1.i[0](S);
		n1.F(F);

		sensitive << i[0] << i[1];  // Sensitivity list
	}
};

SC_MODULE(nand3_c)          // Declare nand3_c sc_module
{
	sc_in<bool> i[3];       // input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S;

	// Gates for NAND3 in minimal SOP form

	and3 a1;
	not1 n1;

	SC_CTOR(nand3_c) : a1("A1"), n1("N1")          // Constructor for nand3_c
	{
		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.F(S);

		n1.i[0](S);
		n1.F(F);

		sensitive << i[0] << i[1] << i[2];  // Sensitivity list
	}
};

SC_MODULE(nand5_c)          // Declare nand5_c sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S;

	// Gates for NAND5 in minimal SOP form

	and5 a1;
	not1 n1;

	SC_CTOR(nand5_c) : a1("A1"), n1("N1")          // constructor for nand5_c
	{
		a1.i[0](i[0]);
		a1.i[1](i[1]);
		a1.i[2](i[2]);
		a1.i[3](i[3]);
		a1.i[4](i[4]);
		a1.F(S);

		n1.i[0](S);
		n1.F(F);

		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // Sensitivity list
	}
};

/*
________________________________________________________________________________

						NAND Self Component Models
________________________________________________________________________________
*/

SC_MODULE(nand2_sc)          // Declare nand2_sc sc_module
{
	sc_in<bool> i[2];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	// Gate for NAND2 in self component form
	
	nand2 na1;

	SC_CTOR(nand2_sc) : na1("NA1")          // Constructor for nand2_sc
	{
		na1.i[0](i[0]);
		na1.i[1](i[1]);
		na1.F(F);

		sensitive << i[0] << i[1];  // Sensitivity list
	}
};

SC_MODULE(nand3_sc)          // Declare nand3_sc sc_module
{
	sc_in<bool> i[3];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S0, S1;

	// Gate for NAND3 in self component form

	nand2 na1, na2, na3;

	SC_CTOR(nand3_sc) : na1("NA1"), na2("NA2"), na3("NA3")         // Constructor for nand3_sc
	{
		na1.i[0](i[0]);
		na1.i[1](i[1]);
		na1.F(S0);

		na2.i[0](S0);
		na2.i[1](S0);
		na2.F(S1);

		na3.i[0](S1);
		na3.i[1](i[2]);
		na3.F(F);


		sensitive << i[0] << i[1] << i[2];  // sensitivity list
	}
};

SC_MODULE(nand5_sc)          // Declare nand5_sc sc_module
{
	sc_in<bool> i[5];       // Input signal ports
	sc_out<bool> F;         // Output signal ports

	sc_signal<bool> S0, S1;

	// Gate for NAND2 in self component form
	nand3 na1, na2, na3;

	SC_CTOR(nand5_sc) : na1("NA1"), na2("NA2"), na3("NA3")        // Constructor for nand5_sc
	{
		na1.i[0](i[0]);
		na1.i[1](i[1]);
		na1.i[2](i[2]);
		na1.F(S0);

		na2.i[0](S0);
		na2.i[1](S0);
		na2.i[2](S0);
		na2.F(S1);

		na3.i[0](S1);
		na3.i[1](i[3]);
		na3.i[2](i[4]);
		na3.F(F);


		sensitive << i[0] << i[1] << i[2] << i[3] << i[4];  // Sensitivity list
	}
};

/*
________________________________________________________________________________

						END NAND GATES HEADER FILE

*/