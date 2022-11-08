LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY selector IS
  PORT (
    i_s0 : IN STD_LOGIC;
    i_s1 : IN STD_LOGIC;
    i_s2 : IN STD_LOGIC;
    i_DATA_OP_ADD : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_DATA_OP_SUB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_DATA_OP_PLUS_ONE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_DATA_OP_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_DATA_OP_AND : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_DATA_OP_OR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_DATA_OP_XOR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_DATA_OP_NOT : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY selector;

ARCHITECTURE arch_1 OF selector IS

BEGIN
  PROCESS (i_s0, i_s1, i_s2)
  BEGIN
    IF (i_s0 = '0' AND i_s1 = '0' AND i_s2 = '0') THEN
      o_S <= i_DATA_OP_ADD;
    ELSIF (i_s0 = '1' AND i_s1 = '0' AND i_s2 = '0') THEN
      o_S <= i_DATA_OP_SUB;
    ELSIF (i_s0 = '0' AND i_s1 = '1' AND i_s2 = '0') THEN
      o_S <= i_DATA_OP_PLUS_ONE;
    ELSIF (i_s0 = '1' AND i_s1 = '1' AND i_s2 = '0') THEN
      o_S <= i_DATA_OP_A;
    ELSIF (i_s0 = '0' AND i_s1 = '0' AND i_s2 = '1') THEN
      o_S <= i_DATA_OP_AND;
    ELSIF (i_s0 = '1' AND i_s1 = '0' AND i_s2 = '1') THEN
      o_S <= i_DATA_OP_OR;
    ELSIF (i_s0 = '0' AND i_s1 = '1' AND i_s2 = '1') THEN
      o_S <= i_DATA_OP_XOR;
    ELSIF (i_s0 = '1' AND i_s1 = '1' AND i_s2 = '1') THEN
      o_S <= i_DATA_OP_NOT;
    ELSE
      o_S <= "0000";
    END IF;
  END PROCESS;
END ARCHITECTURE arch_1;