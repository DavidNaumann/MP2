-- File: gates_3.vhd
-- Includes: 3 Input Gates such as AND3 and OR3
--  Created by: Kenneth Naumann

-- _________________________________________________________________
-- AND Gates for 3 Inputs

-- AND3, 3 input AND gate, Equation Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND3_E is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end AND3_E;

architecture AND3_E_EQ of AND3_E is
begin
  o <= (i1 AND i2 AND i3);
end AND3_E_EQ;

-- AND3_C, 3 input AND gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND3_C is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end AND3_C;

architecture AND3_C_EQ of AND3_C is
  -- Includes component AND2 to simplify logic
  component OR2 is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component NOT1 to simplify logic
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- negation of inputs
  signal neg_i1, neg_i2, neg_i3: STD_LOGIC;
  -- temporary outputs for logic simplification
  signal tempo_1, tempo_2: STD_LOGIC;
begin
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i2
  N2: NOT1 port map(i2, neg_i2);
  -- neg_i3 = !i3
  N3: NOT1 port map(i3, neg_i3);
  -- tempo_1 = !i1 || !i2
  O21: OR2 port map(neg_i1,neg_i2,tempo_1);
  -- tempo_2 = !i1 || !i2 || !i3
  O22: OR2 port map(neg_i3, tempo_1, tempo_2);
  -- o = i3 & i2 & i1 or !(!i1 || !i2 || !i3)
  N4: NOT1 port map(tempo_2,o);
end AND3_C_EQ;

-- AND3, 3 input AND gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND3_SC is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end AND3_SC;

architecture AND3_SC_EQ of AND3_SC is
  -- Includes component AND2 to simplify logic
  component AND2 is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo = Temporary output/signals
  signal tempo: STD_LOGIC;
begin
  -- tempo = i1 & i2
  A21: AND2 port map(i1,i2,tempo);
  -- o = i3 & tempo (or o = i1 & i2 & i3)
  A22: AND2 port map(i3,tempo,o);
end AND3_SC_EQ;


-- _________________________________________________________________
-- OR Gates for 3 Inputs

-- OR3_E, 3 input OR gate, Equation Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR3_E is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end OR3_E;

architecture OR3_E_EQ of OR3_E is
begin
  o <= (i1 OR i2 OR i3);
end OR3_E_EQ;

-- OR3_C, 3 input OR gate, Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR3_C is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end OR3_C;

architecture OR3_C_EQ of OR3_C is
  -- Includes component AND2 to simplify logic
  component AND2 is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component NOT1 to simplify logic
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- negation of inputs
  signal neg_i1, neg_i2, neg_i3: STD_LOGIC;
  -- temporary outputs for logic simplification
  signal tempo_1, tempo_2: STD_LOGIC;
begin
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i2
  N2: NOT1 port map(i2, neg_i2);
  -- neg_i3 = !i3
  N3: NOT1 port map(i3, neg_i3);
  -- tempo_1 = !i1 & !i2
  A21: AND2 port map(neg_i1,neg_i2,tempo_1);
  -- tempo_2 = !i1 & !i2 & !i3
  A22: AND2 port map(neg_i3, tempo_1, tempo_2);
  -- o = i3 || i2 || i1 or !(!i1 & !i2 & !i3)
  N4: NOT1 port map(tempo_2,o);
end OR3_C_EQ;

-- OR3_SC, 3 input OR gate, Self Component Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR3_SC is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end OR3_SC;

architecture OR3_SC_EQ of OR3_SC is
  -- Includes component OR2 to simplify logic
  component OR2 is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo = Temporary output/variable
  signal tempo: STD_LOGIC;
begin
  -- tempo = i1 || i2
  O21: OR2 port map(i1,i2,tempo);
  -- o = i3 || tempo (or o = i1 || i2 || i3)
  O22: OR2 port map(i3,tempo,o);
end OR3_SC_EQ;