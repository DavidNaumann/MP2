-- File: nands.vhd
-- Includes: 2 Input, 3 Input and 5 Input Gates for NAND
--  Created by: Kenneth Naumann

-- _________________________________________________________________
-- NAND Gates for 2 Inputs


-- NAND2_E, 2 input NAND gate, Equation Creation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND2_E is
  port (  i1, i2 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2
          o : out STD_LOGIC); -- o = Output
end NAND2_E;

architecture NAND2_E_EQ of NAND2_E is
begin
  o <= NOT (i1 AND i2);
end NAND2_E_EQ;

-- NAND2_C, 2 input NAND gate, Component Creation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND2_C is
  port (  i1, i2 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2
          o : out STD_LOGIC); -- o = Output
end NAND2_C;

architecture NAND2_C_EQ of NAND2_C is
  -- Includes component OR2 to simplify logic
  component OR2 is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component NOT1 to simplify logic
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- neg_i1 = negation of i1, neg_i2 = negation of i2, etc.
  signal neg_i1, neg_i2: STD_LOGIC;
begin
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i2
  N2: NOT1 port map(i2, neg_i2);
  -- o = neg_i1 || neg_i2 (or o = !i1 || !i2)
  O21: OR2 port map(neg_i1,neg_i2,o);
end NAND2_C_EQ;

-- _________________________________________________________________
-- NAND Gates for 3 Inputs

-- NAND3, 3 input NAND gate, Equation Creation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND3_E is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2
          o : out STD_LOGIC); -- o = Output
end NAND3_E;

architecture NAND3_E_EQ of NAND3_E is
begin
  o <= NOT (i1 AND i2 AND i3);
end NAND3_E_EQ;

-- NAND3_C, 3 input NAND gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND3_C is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end NAND3_C;

architecture NAND3_C_EQ of NAND3_C is
  -- Includes component OR3 to simplify logic
  component OR3_E is
    port (  i1, i2, i3: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component NOT1 to simplify logic
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- neg_i1 = negation of i1, neg_i2 = negation of i2, etc.
  signal neg_i1, neg_i2, neg_i3: STD_LOGIC;
begin
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i2
  N2: NOT1 port map(i2, neg_i2);
  -- neg_i3 = !i3
  N3: NOT1 port map(i3, neg_i3);
  -- o = neg_i1 || neg_i2 || neg_i3 (or o = !i1 || !i2 || !i3)
  O31: OR3_E port map(neg_i1, neg_i2, neg_i3, o);
end NAND3_C_EQ;

-- NAND3_SC, 3 input NAND gate, Self Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND3_SC is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end NAND3_SC;

architecture NAND3_SC_EQ of NAND3_SC is
  -- Includes component OR3 to simplify logic
  component NAND2_E is
    port (  i1, i2 : in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo_# = temporary storage of logic outputs
  signal tempo_1, tempo_2: STD_LOGIC;
begin
  -- i1 NAND i2
  NA21: NAND2_E port map(i1, i2, tempo_1);
  -- (i1 AND i2) -> not(i1 NAND i2)
  NA22: NAND2_E port map(tempo_1, tempo_1, tempo_2);
  -- NAND3 -> not (i1 AND i2 AND i3)
  NA23: NAND2_E port map(i3, tempo_2, o);
  
end NAND3_SC_EQ;

-- _________________________________________________________________
-- NAND Gates for 5 Inputs

-- NAND5, 5 input NAND gate, Equation Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND5_E is
  port (  i1, i2, i3, i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end NAND5_E;

architecture NAND5_E_EQ of NAND5_E is
begin

  o <= NOT (i1 AND i2 AND i3 AND i4 AND i5);

end NAND5_E_EQ;

-- NAND5, 5 input NAND gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND5_C is
  port (  i1, i2, i3 , i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
          o : out STD_LOGIC); -- o = Output
end NAND5_C;

architecture NAND5_C_EQ of NAND5_C is
  -- Includes component OR5 to simplify logic
  component OR5_E is
    port (  i1,i2,i3,i4,i5: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component NOT1 to simplify logic
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- neg_i1 = negation of i1, neg_i2 = negation of i2, etc.
  signal neg_i1, neg_i2, neg_i3, neg_i4, neg_i5: STD_LOGIC;
begin
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i2
  N2: NOT1 port map(i2, neg_i2);
  -- neg_i3 = !i3
  N3: NOT1 port map(i3, neg_i3);
  -- neg_i4 = !i4
  N4: NOT1 port map(i4, neg_i4);
  -- neg_i5 = !i5
  N5: NOT1 port map(i5, neg_i5);
  -- o = neg_i1 || neg_i2 || neg_i3 || neg_i4 || neg_i5 (or o = !i1 || !i2 || !i3 || !i4 || !i5)
  O51: OR5_E port  map(neg_i1,neg_i2,neg_i3,neg_i4,neg_i5,o);
end NAND5_C_EQ;

-- NAND5, 5 input NAND gate, Self Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND5_SC is
  port (  i1, i2, i3, i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end NAND5_SC;

architecture NAND5_SC_EQ of NAND5_SC is
  -- Includes component OR3 to simplify logic
  component NAND2_E is
    port (  i1, i2 : in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo_# = temporary storage of logic outputs
  signal tempo_1, tempo_2, tempo_3, tempo_4, tempo_5, tempo_6: STD_LOGIC;
begin
  -- tempo_1 = i1 NAND i2
  NA21: NAND2_E port map(i1, i2, tempo_1);
  -- tempo_2 = i3 NAND i4
  NA22: NAND2_E port map(i3, i4, tempo_2);
  -- tempo_3 = i1 AND i2 = NOT (i1 NAND i2)
  NA23: NAND2_E port map(tempo_1, tempo_1, tempo_3);
  -- tempo_4 = i3 AND i4 = NOT (i3 NAND i4)
  NA24: NAND2_E port map(tempo_2, tempo_2, tempo_4);
  -- tempo_5 = NAND4 = NOT (i1 AND i2 AND i3 AND i4)
  NA25: NAND2_E port map(tempo_3, tempo_4, tempo_5);
  -- tempo_6 = i1 AND i2 AND i3 AND i4
  NA26: NAND2_E port map(tempo_5, tempo_5, tempo_6);
  -- tempo_6 = NAND5
  NA27: NAND2_E port map(i5, tempo_6, o);
  
end NAND5_SC_EQ;