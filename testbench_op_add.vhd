LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_op_add IS
  -- empty
END tb_op_add;

ARCHITECTURE arch_1 OF tb_op_add IS

  -- DUT component
  COMPONENT op_add IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- selector
      i_b : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- data input
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); -- data output
  END COMPONENT;

  SIGNAL w_A, w_B, w_S : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

  -- Connect DUT
  u_DUT : op_add PORT MAP(
    i_A => w_A,
    i_B => w_B,
    o_S => w_S);

  PROCESS
  BEGIN-- Select input channel A
    w_A <= "0010";
    w_B <= "0010";
    WAIT FOR 1 ns;
    ASSERT(w_S = "0010") REPORT "Fail @ 1" SEVERITY error;

    WAIT;
  END PROCESS;
END arch_1;