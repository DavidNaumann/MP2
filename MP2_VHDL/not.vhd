-- File: not.vhd
-- Includes: not gate
--  Created by: Kenneth Naumann

-- NOT1, 1 input NOT gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT1 is
  port( i1: in STD_LOGIC;
        o    : out STD_LOGIC);
end entity;

architecture NOT1_EQ of NOT1 is

begin
  o <= (NOT i1);
end architecture NOT1_EQ;
