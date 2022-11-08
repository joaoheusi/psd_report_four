LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY op_not IS
  PORT (
    i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY op_not;

ARCHITECTURE arch_1 OF op_not IS

BEGIN

  o_S <= NOT i_A;

END ARCHITECTURE arch_1;