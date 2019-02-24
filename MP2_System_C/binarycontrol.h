#pragma once

#include <array>
#include <math.h>

// Returns array of ints
void int_to_binary_arr(bool i[], int length, int curr_number)
{
	int counter = 0;
	int divider = curr_number;
	int max_integer = static_cast<int>((pow(2, length) - 1));

	for (counter = 0; counter < length; counter++)
	{
		i[counter] = 0;
	}
	
	counter = 0;

	if (curr_number <= max_integer)
	{
		while (divider > 1 or counter == 0)
		{
			if (counter < (length - 1))
			{
				i[counter] = (divider % 2) ? true : false;
				divider = divider / 2;
				if (divider <= 1)
				{
					i[(counter + 1)] = (divider) ? true : false;
				}
			}
			counter++;
		}
	}
}