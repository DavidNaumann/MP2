-- File: gates_5.vhd
-- Includes: 5 Input Gates such as AND5 and OR5
--  Created by: Kenneth Naumann

-- _________________________________________________________________
-- AND Gates for 5 Inputs

-- AND5_E, 5 input AND gate, Equation Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND5_E is
  port (  i1, i2, i3, i4, i5: in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
          o : out STD_LOGIC); -- o = Output
end AND5_E;

architecture AND5_E_EQ of AND5_E is
begin
  o <= (i1 AND i2 AND i3 AND i4 AND i5);
end AND5_E_EQ;

-- AND5_C, 3 input AND gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND5_C is
  port (  i1, i2, i3, i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end AND5_C;

architecture AND5_C_EQ of AND5_C is
  -- Includes component AND3 to simplify logic
  component OR3_E is
    port (  i1, i2, i3: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- negation of inputs
  signal neg_i1, neg_i2, neg_i3, neg_i4, neg_i5: STD_LOGIC;
  -- temporary outputs for logic simplification
  signal tempo_1, tempo_2: STD_LOGIC;
begin
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i2
  N2: NOT1 port map(i2, neg_i2);
  -- neg_i3 = !i3
  N3: NOT1 port map(i3, neg_i3);
  -- neg_i4 = !i4
  N4: NOT1 port map(i4, neg_i4);
  -- neg_i3 = !i3
  N5: NOT1 port map(i5, neg_i5);
  -- tempo_1 = !i1 || !i2
  O31: OR3_E port map(neg_i1, neg_i2, neg_i3, tempo_1);
  -- tempo_2 = !i1 || !i2 || !i3
  O32: OR3_E port map(neg_i4, neg_i5, tempo_1, tempo_2);
  -- o = i3 & i2 & i1 or !(!i1 || !i2 || !i3)
  N6: NOT1 port map(tempo_2,o);
end AND5_C_EQ;

-- AND5_SC, 5 input AND gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND5_SC is
  port (  i1, i2, i3, i4, i5: in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
          o : out STD_LOGIC); -- o = Output
end AND5_SC;

architecture AND5_SC_EQ of AND5_SC is
  -- Includes component AND3 to simplify logic
  component AND3_E is
    port (  i1,i2,i3: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo = Temporary output/signal
  signal tempo: STD_LOGIC;
begin
  -- tempo = i1 & i2 & i3
  A31: AND3_E port map(i1,i2, i3, tempo);
  -- o = i4 & i5 & tempo (or o = i1 & i2 & i3 & i4 & i5)
  A32: AND3_E port map(i4,i5, tempo, o);
end AND5_SC_EQ;

-- _________________________________________________________________
-- OR Gates for 5 Inputs

-- OR5_E, 5 input OR gate, Equation Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR5_E is
  port (  i1, i2, i3, i4, i5: in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
          o : out STD_LOGIC); -- o = Output
end OR5_E;

architecture OR5_E_EQ of OR5_E is
begin
  o <= (i1 OR i2 OR i3 OR i4 OR i5);
end OR5_E_EQ;

-- OR3_C, 5 input OR gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR5_C is
  port (  i1, i2, i3, i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end OR5_C;

architecture OR5_C_EQ of OR5_C is
  -- Includes component AND3 to simplify logic
  component AND3_E is
    port (  i1, i2, i3: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- negation of inputs
  signal neg_i1, neg_i2, neg_i3, neg_i4, neg_i5: STD_LOGIC;
  -- temporary outputs for logic simplification
  signal tempo_1, tempo_2: STD_LOGIC;
begin
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i2
  N2: NOT1 port map(i2, neg_i2);
  -- neg_i3 = !i3
  N3: NOT1 port map(i3, neg_i3);
  -- neg_i4 = !i4
  N4: NOT1 port map(i4, neg_i4);
  -- neg_i3 = !i3
  N5: NOT1 port map(i5, neg_i5);
  -- tempo_1 = !i1 & !i2
  A31: AND3_E port map(neg_i1, neg_i2, neg_i3, tempo_1);
  -- tempo_2 = !i1 & !i2 & !i3
  A32: AND3_E port map(neg_i4, neg_i5, tempo_1, tempo_2);
  -- o = i3 || i2 || i1 or !(!i1 & !i2 & !i3)
  N6: NOT1 port map(tempo_2,o);
end OR5_C_EQ;

-- OR5_SC, 5 input OR gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR5_SC is
  port (  i1, i2, i3, i4, i5: in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
          o : out STD_LOGIC); -- o = Output
end OR5_SC;

architecture OR5_SC_EQ of OR5_SC is
  -- Includes component OR3 to simplify logic
  component OR3_E is
    port (  i1,i2,i3: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo = Temporary output/signal
  signal tempo: STD_LOGIC;
begin
  -- tempo = i1 || i2 || i3
  O31: OR3_E port map(i1,i2, i3, tempo);
  -- o = i4 || i5 || tempo (or o = i1 || i2 || i3 || i4 || i5)
  O32: OR3_E port map(i4,i5, tempo, o);
end OR5_SC_EQ;
