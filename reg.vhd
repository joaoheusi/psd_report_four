LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY reg IS
  PORT (
    i_ID : IN STD_LOGIC := '0';
    i_CLK : IN STD_LOGIC := '0';
    i_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    o_DATA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"
  );
END ENTITY reg;

ARCHITECTURE arch_1 OF reg IS
BEGIN

  PROCESS (i_CLK, i_ID)
  BEGIN
    IF RISING_EDGE(i_CLK) THEN
      IF (i_ID = '1') THEN
        o_DATA <= i_DATA;
      END IF;
    END IF;
  END PROCESS;
END ARCHITECTURE arch_1; -- arch_1