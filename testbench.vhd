LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_calc IS
  -- empty
END tb_calc;

ARCHITECTURE arch_1 OF tb_calc IS

  -- DUT component
  COMPONENT calc IS
    PORT (
      i_CLK : IN STD_LOGIC;
      i_ENABLE : IN STD_LOGIC;
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      i_x : IN STD_LOGIC;
      i_y : IN STD_LOGIC;
      i_z : IN STD_LOGIC;
      o_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    ); -- data output
  END COMPONENT;

  SIGNAL w_A, w_B, w_S : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_CLK, w_ENABLE, w_X, w_Y, w_Z : STD_LOGIC := '0';

  CONSTANT c_CLK_P : TIME := 1 ns;

BEGIN

  -- Connect DUT
  u_CALC : calc PORT MAP(
    i_A => w_A,
    i_B => w_B,
    i_CLK => w_CLK,
    i_ENABLE => w_ENABLE,
    i_x => w_X,
    i_y => w_Y,
    i_z => w_Z,
    o_OUT => w_S);

  p_CLK : PROCESS
  BEGIN
    w_CLK <= '1';
    WAIT FOR c_CLK_P;
    w_CLK <= '0';
    WAIT FOR c_CLK_P;
  END PROCESS p_CLK;

  PROCESS
  BEGIN

    w_A <= "0011";
    w_B <= "0010";
    w_ENABLE <= '1';

    w_X <= '1';
    WAIT FOR 10 ns;
    ASSERT false REPORT "Reset complete" SEVERITY note;

    -- OP ADD
    w_X <= '0';
    w_Y <= '0';
    w_Z <= '0';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0101") REPORT "Fail @ add" SEVERITY error;

    -- OP SUB
    w_X <= '0';
    w_Y <= '0';
    w_Z <= '1';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0001") REPORT "Fail @ SUB" SEVERITY error;

    -- OP PLUS_ONE
    w_X <= '0';
    w_Y <= '1';
    w_Z <= '0';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0100") REPORT "Fail @ PLUSONE" SEVERITY error;

    -- OP A
    w_X <= '0';
    w_Y <= '1';
    w_Z <= '1';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0011") REPORT "Fail @ A" SEVERITY error;

    -- OP AND
    w_X <= '1';
    w_Y <= '0';
    w_Z <= '0';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0010") REPORT "Fail @ AND" SEVERITY error;

    -- OP OR
    w_X <= '1';
    w_Y <= '0';
    w_Z <= '1';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0011") REPORT "Fail @ OR" SEVERITY error;

    -- OP XOR
    w_X <= '1';
    w_Y <= '1';
    w_Z <= '0';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0001") REPORT "Fail @ XOR" SEVERITY error;

    -- OP NOT
    w_X <= '1';
    w_Y <= '1';
    w_Z <= '1';
    WAIT FOR 10 ns;
    ASSERT(w_S = "1100") REPORT "Fail @ NOT" SEVERITY error;

    -- OP ADD
    w_X <= '0';
    w_Y <= '0';
    w_Z <= '0';
    WAIT FOR 10 ns;
    ASSERT(w_S = "0101") REPORT "Fail @ add" SEVERITY error;

    ASSERT false REPORT "Testbench Complete" SEVERITY note;
    WAIT;
  END PROCESS;
END arch_1;