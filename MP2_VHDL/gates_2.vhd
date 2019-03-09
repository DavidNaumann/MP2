-- File: gates_2.vhd
-- Includes: 2 Input Gates such as AND2 and OR2
--  Created by: Kenneth Naumann

-- AND2, 2 input AND gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND2 is
  port( i1, i2 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2
        o    : out STD_LOGIC); -- o = Output
end entity;

architecture AND2_EQ of AND2 is

begin
  o <= i1 AND i2; -- o = i1 & i2
end architecture AND2_EQ;

-- OR2, 2 input OR gate, Component Creation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR2 is
  port( i1, i2 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2
        o    : out STD_LOGIC); -- o = Output
end entity;

architecture OR2_EQ of OR2 is

begin
  o <= i1 OR i2; -- o = i1 || i2
end architecture OR2_EQ;




