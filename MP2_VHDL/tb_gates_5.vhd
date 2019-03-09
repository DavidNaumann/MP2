-- File: tb_gates_5.vhd
-- Includes: Testbenches for 5 Input Gates such as AND5 and OR5
--  Created by: Kenneth Naumann

-- _________________________________________________________________
-- AND Gates for 5 Inputs Test Benches

-- TB_AND5_E, Test Bench for AND5_E gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_AND5_E is
end entity TB_AND5_E;

-- Begin Test Bench AND5_EQ Entity
architecture AND5_E_VERIFY of TB_AND5_E is
  -- i1 = Input 1, i2 = Input 2, i3 = input 3, etc.
  -- o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = AND5 Gate, portmapping test bench variables to test entity's
  duv:  entity work.AND5_E(AND5_E_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 5 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding AND5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding AND5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding AND5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding AND5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding AND5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
  -- Start loop for cycling through inputs
    for i in 0 to 32 loop
      -- take current input cycle and apply to AND5
      apply_test(curr_i);
      -- Increments the current input vectors
      curr_i <= curr_i + "00001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture AND5_E_VERIFY;

-- TB_AND5_C, Test Bench for AND5_C gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_AND5_C is
end entity TB_AND5_C;

-- Begin Test Bench AND5_C_EQ Entity
architecture AND5_C_VERIFY of TB_AND5_C is
  -- i1 = Input 1, i2 = Input 2, i3 = input 3, etc.
  -- o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = AND5 Gate, portmapping test bench variables to test entity's
  duv:  entity work.AND5_C(AND5_C_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 5 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding AND5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding AND5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding AND5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding AND5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding AND5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
  -- Start loop for cycling through inputs
    for i in 0 to 32 loop
      -- take current input cycle and apply to AND5_C
      apply_test(curr_i);
      -- Increments the current input vectors
      curr_i <= curr_i + "00001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture AND5_C_VERIFY;

-- TB_AND5_SC, Test Bench for AND5_SC gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_AND5_SC is
end entity TB_AND5_SC;

-- Begin Test Bench AND5_SC_EQ Entity
architecture AND5_SC_VERIFY of TB_AND5_SC is
  -- i1 = Input 1, i2 = Input 2, i3 = input 3, etc.
  -- o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = AND5 Gate, portmapping test bench variables to test entity's
  duv:  entity work.AND5_SC(AND5_SC_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 5 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding AND5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding AND5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding AND5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding AND5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding AND5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
  -- Start loop for cycling through inputs
    for i in 0 to 32 loop
      -- take current input cycle and apply to AND5_C
      apply_test(curr_i);
      -- Increments the current input vectors
      curr_i <= curr_i + "00001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture AND5_SC_VERIFY;

-- _________________________________________________________________
-- OR Gates for 5 Inputs Test Benches

-- TB_OR5_E, Test Bench for OR5_E gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Begin Test Bench OR5_E Entity
entity TB_OR5_E is
end entity TB_OR5_E;

architecture OR5_E_VERIFY of TB_OR5_E is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
  -- o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = OR 5 Gate, portmapping test bench variables to test entity's
  duv:  entity work.OR5_E(OR5_E_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- applys test input vector to inputs of test entity
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding OR5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding OR5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding OR5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding OR5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding OR5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Begin loop to send inputs to test in OR5_E
    for i in 0 to 32 loop
      -- binds input vector to input variables for current test input vector
      apply_test(curr_i);
      -- increments the input vector by one for next test
      curr_i <= curr_i + "00001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture OR5_E_VERIFY;

-- TB_OR5_C, Test Bench for OR5_C gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Begin Test Bench OR5_C Entity
entity TB_OR5_C is
end entity TB_OR5_C;

architecture OR5_C_VERIFY of TB_OR5_C is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
  -- o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = OR 5 Gate, portmapping test bench variables to test entity's
  duv:  entity work.OR5_C(OR5_C_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- applys test input vector to inputs of test entity
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding OR5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding OR5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding OR5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding OR5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding OR5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Begin loop to send inputs to test in OR5_C
    for i in 0 to 32 loop
      -- binds input vector to input variables for current test input vector
      apply_test(curr_i);
      -- increments the input vector by one for next test
      curr_i <= curr_i + "00001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture OR5_C_VERIFY;

-- TB_OR5_SC, Test Bench for OR5_SC gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Begin Test Bench OR5_SC Entity
entity TB_OR5_SC is
end entity TB_OR5_SC;

architecture OR5_SC_VERIFY of TB_OR5_SC is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
  -- o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = OR 5 Gate, portmapping test bench variables to test entity's
  duv:  entity work.OR5_SC(OR5_SC_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- applys test input vector to inputs of test entity
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding OR5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding OR5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding OR5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding OR5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding OR5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Begin loop to send inputs to test in OR5_C
    for i in 0 to 32 loop
      -- binds input vector to input variables for current test input vector
      apply_test(curr_i);
      -- increments the input vector by one for next test
      curr_i <= curr_i + "00001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture OR5_SC_VERIFY;