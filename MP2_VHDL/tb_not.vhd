-- File: tb_not.vhd
-- Includes: Testbench for NOT1
--  Created by: Kenneth Naumann

-- TB_NOT1, Test Bench for NOT1 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_NOT1 is
end entity TB_NOT1;

-- Begin NOT1 verification with test bench
architecture NOT1_VERIFY of TB_NOT1 is
  -- i1 = Input 1, o = output
  signal i1, o : STD_LOGIC;
begin
  -- Design Under Verication = AND 2 Gate, portmapping test bench variables to test entity's
  duv:  entity work.NOT1(NOT1_EQ)
        port map (i1 => i1, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 2 bit vector and splits between inputs
      (curr_i : in STD_LOGIC) is
    begin
      -- binds passed input from vector to corresponding AND2 input
      i1 <= curr_i;
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Tests NOT gate for 0 as input
    apply_test('0');
    -- Tests NOT gate for 1 as input
    apply_test('1');
    wait;
  end process apply_test_cases;
end architecture NOT1_VERIFY;
