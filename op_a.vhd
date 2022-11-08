LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY op_a IS
  PORT (
    i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY op_a;

ARCHITECTURE arch_1 OF op_a IS

BEGIN

  o_S <= i_A;

END ARCHITECTURE arch_1;