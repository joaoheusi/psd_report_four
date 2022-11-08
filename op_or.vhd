LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY op_or IS
  PORT (
    i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY op_or;

ARCHITECTURE arch_1 OF op_or IS

BEGIN

  o_S <= i_A OR i_B;

END ARCHITECTURE arch_1;