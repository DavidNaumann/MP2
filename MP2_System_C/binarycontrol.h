#pragma once

#include <array>
#include <math.h>

// Returns array of ints
void int_to_binary_arr(bool i[], int bits, int curr_number)
{
	int counter = 0;
	int divider = curr_number; // stores current integer for calculation
	int max_integer = static_cast<int>((pow(2, bits) - 1)); // determines maximum number that can be created with bits

	for (counter = 0; counter < bits; counter++)
	{
		i[counter] = 0; // Sets entire bit array to 0
	}
	
	counter = 0;

	// checks if the number is less than the maximum integer that can be created with number of bits
	if (curr_number <= max_integer)
	{
		// if the number can be stored in bits without over flow
		while (divider > 1 or counter == 0)
		{
			if (counter < (bits - 1))
			{
				i[counter] = (divider % 2) ? true : false; // returns current bit value (true or false)
				divider = divider / 2; // divides the current number by 2 and returns it for further calculation
				// if the current number after division is less than or equal to 1
				if (divider <= 1)
				{
					// find the next bit's information and exit while loop
					i[(counter + 1)] = (divider) ? true : false;
				}
			}
			// else continue divider is less than 1
			counter++;
		}
	}

	return;
}