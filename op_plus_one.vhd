LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY op_plus_one IS
  PORT (
    i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY op_plus_one;

ARCHITECTURE arch_1 OF op_plus_one IS

BEGIN

  o_S <= i_A + "0001";

END ARCHITECTURE arch_1;