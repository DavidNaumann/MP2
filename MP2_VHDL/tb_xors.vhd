-- File: tb_xors.vhd
-- Includes: Testbenches for XOR2, XOR3, XOR5 gates
--  Created by: Kenneth Naumann

-- _________________________________________________________________
-- XOR Gates for 2 Inputs Test Benches

-- TB_XOR2_E, Test Bench for XOR2 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR2_E is
end entity TB_XOR2_E;

architecture XOR2_E_VERIFY of TB_XOR2_E is
  -- i1 = Input 1, i2 = Input 2, o = output
  signal i1, i2, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(1 downto 0) := "00";
begin
  -- Design Under Verication = XOR2 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR2_E(XOR2_E_EQ)
        port map (i1 => i1, i2 => i2, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 2 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(1 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR2 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR2 input
      i2 <= curr_i(1);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 4 loop
      -- takes current input cycle and apply to XOR2
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "01";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR2_E_VERIFY;

-- TB_XOR2_C, Test Bench for XOR2_C gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR2_C is
end entity TB_XOR2_C;

architecture XOR2_C_VERIFY of TB_XOR2_C is
  -- i1 = Input 1, i2 = Input 2, o = output
  signal i1, i2, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(1 downto 0) := "00";
begin
  -- Design Under Verication = XOR2 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR2_C(XOR2_C_EQ)
        port map (i1 => i1, i2 => i2, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 2 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(1 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR2 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR2 input
      i2 <= curr_i(1);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 4 loop
      -- takes current input cycle and apply to XOR2
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "01";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR2_C_VERIFY;

-- _________________________________________________________________
-- XOR Gates for 3 Inputs Test Benches

-- TB_XOR3, Test Bench for XOR3 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR3_E is
end entity TB_XOR3_E;

architecture XOR3_E_VERIFY of TB_XOR3_E is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, o = output
  signal i1, i2, i3, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
  -- Design Under Verication = XOR3 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR3_E(XOR3_E_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 3 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(2 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR3 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR3 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding XOR3 input
      i3 <= curr_i(2);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 8 loop
      -- takes current input cycle and apply to XOR3
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR3_E_VERIFY;

-- TB_XOR3_C, Test Bench for XOR3 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR3_C is
end entity TB_XOR3_C;

architecture XOR3_C_VERIFY of TB_XOR3_C is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, o = output
  signal i1, i2, i3, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
  -- Design Under Verication = XOR3 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR3_C(XOR3_C_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 3 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(2 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR3 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR3 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding XOR3 input
      i3 <= curr_i(2);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 8 loop
      -- takes current input cycle and apply to XOR3
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR3_C_VERIFY;

-- TB_XOR3_SC, Test Bench for XOR3 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR3_SC is
end entity TB_XOR3_SC;

architecture XOR3_SC_VERIFY of TB_XOR3_SC is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, o = output
  signal i1, i2, i3, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
  -- Design Under Verication = XOR3 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR3_SC(XOR3_SC_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 3 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(2 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR3 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR3 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding XOR3 input
      i3 <= curr_i(2);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 8 loop
      -- takes current input cycle and apply to XOR3
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR3_SC_VERIFY;

-- _________________________________________________________________
-- XOR Gates for 5 Inputs Test Benches

-- TB_XOR5_E, Test Bench for XOR5 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR5_E is
end entity TB_XOR5_E;

architecture XOR5_E_VERIFY of TB_XOR5_E is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = XOR3 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR5_E(XOR5_E_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 3 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR35 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding XOR5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding XOR5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding XOR5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 32 loop
      -- takes current input cycle and apply to XOR5
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR5_E_VERIFY;

-- TB_XOR5_C, Test Bench for XOR5 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR5_C is
end entity TB_XOR5_C;

architecture XOR5_C_VERIFY of TB_XOR5_C is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = XOR3 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR5_C(XOR5_C_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 3 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding XOR5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding XOR5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding XOR5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 32 loop
      -- takes current input cycle and apply to XOR5
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR5_C_VERIFY;

-- TB_XOR5_SC, Test Bench for XOR5 gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creates entity for test bench
entity TB_XOR5_SC is
end entity TB_XOR5_SC;

architecture XOR5_SC_VERIFY of TB_XOR5_SC is
  -- i1 = Input 1, i2 = Input 2, i3 = Input 3, o = output
  signal i1, i2, i3, i4, i5, o : STD_LOGIC;
  -- curri = Temporary variable to loop through inputs
  signal curr_i : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
  -- Design Under Verication = XOR3 Gate, portmapping test bench variables to test entity's
  duv:  entity work.XOR5_SC(XOR5_SC_EQ)
        port map (i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5, o => o);
        
  apply_test_cases : process is
    procedure apply_test -- Takes 3 bit vector and splits between inputs
      (curr_i : in STD_LOGIC_VECTOR(4 downto 0)) is
    begin
      -- binds passed input from vector to corresponding XOR5 input
      i1 <= curr_i(0);
      -- binds passed input from vector to corresponding XOR5 input
      i2 <= curr_i(1);
      -- binds passed input from vector to corresponding XOR5 input
      i3 <= curr_i(2);
      -- binds passed input from vector to corresponding XOR5 input
      i4 <= curr_i(3);
      -- binds passed input from vector to corresponding XOR5 input
      i5 <= curr_i(4);
      wait for 100 ps;
    end procedure apply_test;
  begin
    -- Starts loop for cycling through inputs
    for i in 0 to 32 loop
      -- takes current input cycle and apply to XOR3
      apply_test(curr_i);
      -- Increments the current input vector
      curr_i <= curr_i + "001";
    end loop;
    wait;
  end process apply_test_cases;
end architecture XOR5_SC_VERIFY;