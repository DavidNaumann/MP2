-- File: xors.vhd
-- Includes: 2 Input, 3 Input and 5 Input Gates for XORs
--  Created by: Kenneth Naumann

-- need equation and component (AND3,AND2*)

-- _________________________________________________________________
-- XOR Gates for 2 Inputs


-- XOR2_E, 2 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2_E is
  port (  i1, i2 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2
          o : out STD_LOGIC); -- o = Output
end XOR2_E;

architecture XOR2_E_EQ of XOR2_E is
  -- Includes component OR2 to simplify logic
  component OR2 is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
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
  -- neg_i1 = negation of i1, neg_i2 = negation of i2
  signal neg_i1, neg_i2: STD_LOGIC;
  -- Signal for a' & b
  signal and_anb_o: STD_LOGIC;
  -- Signal for a & b'
  signal and_abn_o: STD_LOGIC;
begin

  o <= ((i1 AND (NOT i2)) OR ((NOT i1) AND i2));
  
end XOR2_E_EQ;

-- XOR2_C, 2 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2_C is
  port (  i1, i2 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2
          o : out STD_LOGIC); -- o = Output
end XOR2_C;

architecture XOR2_C_EQ of XOR2_C is
  -- Includes component OR2 to simplify logic
  component OR2 is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
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
  -- neg_i1 = negation of i1, neg_i2 = negation of i2
  signal neg_i1, neg_i2: STD_LOGIC;
  -- Signal for a' & b
  signal and_anb_o: STD_LOGIC;
  -- Signal for a & b'
  signal and_abn_o: STD_LOGIC;
begin
  -- N# = Not Gate Instance #
  -- O# = Or Gate Instance #
  -- A# = Gate Instance #
  -- neg_i1 = !i1
  N1: NOT1 port map(i1, neg_i1);
  -- neg_i2 = !i1
  N2: NOT1 port map(i2, neg_i2);
  -- and_abn_o = i1 & neg_i2 (or i1 & !i2)
  A21: AND2 port map(i1,neg_i2, and_abn_o);
  -- and_anb_o = neg_i1 & i2 (or !i1 & !i2)
  A22: AND2 port map(neg_i1,i2, and_anb_o);
  -- o = and_abn_o || and_anb_o (or (i1 & !i2) || (!i1 & i2))
  O21: OR2 port map(and_abn_o, and_anb_o, o);
end XOR2_C_EQ;

-- _________________________________________________________________
-- XOR Gates for 3 Inputs

-- XOR3_E, 3 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR3_E is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end XOR3_E;

architecture XOR3_E_EQ of XOR3_E is
begin

  o <= (((NOT i1) AND (NOT i2) AND i3) OR ((NOT i1) AND i2 AND (NOT i3)) OR (i1 AND (NOT i2) AND (NOT i3)) OR (i1 AND i2 AND i3));
  
end XOR3_E_EQ;

-- XOR3_C, 3 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR3_C is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end XOR3_C;

architecture XOR3_C_EQ of XOR3_C is
  -- Includes component AND3 to simplify logic
  component AND3_E is
    port (  i1, i2, i3: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component OR3 to simplify logic
  component OR2 is
    port (  i1, i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component NOT1 to simplify logic
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo_# = Temporary output/signal
  signal neg_i1, neg_i2, neg_i3: STD_LOGIC;
  signal tempo_1, tempo_2, tempo_3, tempo_4, tempo_5, tempo_6: STD_LOGIC;
begin

  N1: NOT1 port map(i1, neg_i1);
  N2: NOT1 port map(i2, neg_i2);
  N3: NOT1 port map(i3, neg_i3);
  -- tempo_1 = i1'i2'i3
  A31: AND3_E port map(neg_i1, neg_i2, i3, tempo_1);
  -- tempo_2 = i1'i2i3'
  A32: AND3_E port map(neg_i1, i2, neg_i3, tempo_2);
  -- tempo_3 = i1i2'i3'
  A33: AND3_E port map(i1, neg_i2, neg_i3, tempo_3);
  -- tempo_4 = i1i2i3
  A34: AND3_E port map(i1, i2, i3, tempo_4);
  -- tempo_5 = i1'i2'i3 or i1'i2i3'
  O21: OR2 port map(tempo_1, tempo_2, tempo_5);
  -- tempo_6 = i1i2'i3' or i1i2i3
  O22: OR2 port map(tempo_3, tempo_4, tempo_6);
  -- o = XOR3 = i1'i2'i3 or i1'i2i3' or i1i2'i3' or i1i2i3
  O23: OR2 port map(tempo_5, tempo_6, o);
  
end XOR3_C_EQ;

-- XOR3_SC, 3 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR3_SC is
  port (  i1, i2, i3 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end XOR3_SC;

architecture XOR3_SC_EQ of XOR3_SC is
  -- Includes component XOR2 to simplify logic
  component XOR2_E is
    port (  i1,i2: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo = Temporary output/signal
  signal tempo: STD_LOGIC;
begin
  -- tempo = i1 xor i2
  X21: XOR2_E port map(i1, i2, tempo);
  -- o = i3 xor tempo (or i1 xor i2 xor i3)
  X22: XOR2_E port map(i3, tempo, o);
end XOR3_SC_EQ;

-- _________________________________________________________________
-- XOR Gates for 5 Inputs

-- XOR5_C, 5 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR5_E is
  port (  i1, i2, i3, i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end XOR5_E;

architecture XOR5_E_EQ of XOR5_E is
signal tempo_1, tempo_2, tempo_3, tempo_4, tempo_5: STD_LOGIC;

begin

tempo_1 <= (((NOT i1) AND (NOT i2) AND (NOT i3) AND (NOT i4) AND i5) OR ((NOT i1) AND (NOT i2) AND (NOT i3) AND i4 AND (NOT i5)) OR ((NOT i1) AND (NOT i2) AND i3 AND (NOT i4) AND (NOT i5)));
tempo_2 <=  (((NOT i1) AND (NOT i2) AND i3 AND i4 AND i5) OR ((NOT i1) AND i2 AND (NOT i3) AND (NOT i4) AND (NOT i5)) OR ((NOT i1) AND i2 AND (NOT i3) AND i4 AND i5));
tempo_3 <= (((NOT i1) AND i2 AND i3 AND (NOT i4) AND i5) OR ((NOT i1) AND i2 AND i3 AND i4 AND (NOT i5)) OR (i1 AND (NOT i2) AND (NOT i3) AND (NOT i4) AND (NOT i5)));
tempo_4 <= ((i1 AND (NOT i2) AND (NOT i3) AND i4 AND i5) OR (i1 AND (NOT i2) AND i3 AND (NOT i4) AND i5) OR (i1 AND (NOT i2) AND i3 AND i4 AND (NOT i5)));
tempo_5 <= ((i1 AND i2 AND (NOT i3) AND (NOT i4) AND i5) OR (i1 AND i2 AND (NOT i3) AND i4 AND (NOT i5)) OR (i1 AND i2 AND i3 AND (NOT i4) AND (NOT i5)) OR (i1 AND i2 AND i3 AND i4 AND i5));
  
o <= (tempo_1 OR tempo_2 OR tempo_3 OR tempo_4 OR tempo_5);
end XOR5_E_EQ;

-- XOR5_C, 5 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR5_C is
  port (  i1, i2, i3, i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3
          o : out STD_LOGIC); -- o = Output
end XOR5_C;

architecture XOR5_C_EQ of XOR5_C is
  -- Includes component AND3 to simplify logic
  component AND5_E is
    port (  i1, i2, i3, i4, i5: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component OR5 to simplify logic
  component OR5_E is
    port (  i1, i2, i3, i4, i5: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- Includes component NOT1 to simplify logic
  component NOT1 is
    port (  i1: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo_# = Temporary output/signal
  signal neg_i1, neg_i2, neg_i3, neg_i4, neg_i5: STD_LOGIC;
  signal tempo_1, tempo_2, tempo_3, tempo_4, tempo_5, tempo_6, tempo_7, tempo_8: STD_LOGIC;
  signal tempo_9, tempo_10, tempo_11, tempo_12, tempo_13, tempo_14, tempo_15, tempo_16: STD_LOGIC;
  signal tempo_17, tempo_18, tempo_19: STD_LOGIC;
begin

  N1: NOT1 port map(i1, neg_i1);
  N2: NOT1 port map(i2, neg_i2);
  N3: NOT1 port map(i3, neg_i3);
  N4: NOT1 port map(i4, neg_i4);
  N5: NOT1 port map(i5, neg_i5);
  
  -- tempo_1 = i1'i2'i3'i4'i5
  A51: AND5_E port map(neg_i1, neg_i2, neg_i3, neg_i4, i5, tempo_1);
  -- tempo_2 = i1'i2'i3'i4i5'
  A52: AND5_E port map(neg_i1, neg_i2, neg_i3, i4, neg_i5, tempo_2);
  -- tempo_3 = i1'i2'i3i4'i5'
  A53: AND5_E port map(neg_i1, neg_i2, i3, neg_i4, neg_i5, tempo_3);
  -- tempo_4 = i1'i2'i3i4i5
  A54: AND5_E port map(neg_i1, neg_i2, i3, i4, i5, tempo_4);
  -- tempo_5 = i1'i2i3'i4'i5'
  A55: AND5_E port map(neg_i1, i2, neg_i3, neg_i4, neg_i5, tempo_5);
  -- tempo_6 = i1'i2i3'i4i5
  A56: AND5_E port map(neg_i1, i2, neg_i3, i4, i5, tempo_6);
  -- tempo_7 = i1'i2i3i4'i5
  A57: AND5_E port map(neg_i1, i2, i3, neg_i4, i5, tempo_7);
  -- tempo_8 = i1'i2i3i4i5'
  A58: AND5_E port map(neg_i1, i2, i3, i4, neg_i5, tempo_8);
  -- tempo_9 = i1i2'i3'i4'i5'
  A59: AND5_E port map(i1, neg_i2, neg_i3, neg_i4, neg_i5, tempo_9);
  -- tempo_10 = i1i2'i3'i4i5
  A510: AND5_E port map(i1, neg_i2, neg_i3, i4, i5, tempo_10);
  -- tempo_11 = i1i2'i3i4'i5
  A511: AND5_E port map(i1, neg_i2, i3, neg_i4, i5, tempo_11);
  -- tempo_12 = i1i2'i3i4i5'
  A512: AND5_E port map(i1, neg_i2, i3, i4, neg_i5, tempo_12);
  -- tempo_13 = i1i2i3'i4'i5
  A513: AND5_E port map(i1, i2, neg_i3, neg_i4, i5, tempo_13);
  -- tempo_14 = i1i2i3'i4i5'
  A514: AND5_E port map(i1, i2, neg_i3, i4, neg_i5, tempo_14);
  -- tempo_15 = i1i2i3i4'i5'
  A515: AND5_E port map(i1, i2, i3, neg_i4, neg_i5, tempo_15);
  -- tempo_16 = i1i2i3i4i5
  A516: AND5_E port map(i1, i2, i3, i4, i5, tempo_16);  
 
  -- Store last parts in Sum of products
  O51: OR5_E port map(tempo_1, tempo_2, tempo_3, tempo_4, tempo_5, tempo_17);
  O52: OR5_E port map(tempo_17, tempo_6, tempo_7, tempo_8, tempo_9, tempo_18);
  O53: OR5_E port map(tempo_18, tempo_10, tempo_11, tempo_12, tempo_13, tempo_19);
  O54: OR5_E port map(tempo_19, tempo_14, tempo_15, tempo_16, '0', o);
end XOR5_C_EQ;

-- XOR5, 5 input XOR gate, Creation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR5_SC is
  port (  i1, i2, i3, i4, i5 : in STD_LOGIC; -- i1 = Input 1, i2 = Input 2, i3 = Input 3, etc.
          o : out STD_LOGIC); -- o = Output
end XOR5_SC;

architecture XOR5_SC_EQ of XOR5_SC is
  -- Includes component XOR3 to simplify logic
  component XOR3_E is
    port (  i1,i2,i3: in STD_LOGIC;
            o: out STD_LOGIC);
  end component;
  -- tempo = Temporary output/signal
  signal tempo: STD_LOGIC;
begin
  -- tempo = i1 xor i2 xor i3
  X31: XOR3_E port map(i1, i2, i3, tempo);
  -- o = i4 xor i5 xor tempo (or i1 xor i2 xor i3 xor i4 xor i5)
  X32: XOR3_E port map(i4, i5, tempo, o);
end XOR5_SC_EQ;