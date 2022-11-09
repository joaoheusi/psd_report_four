LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY calc IS
  PORT (
    i_CLK : IN STD_LOGIC;
    i_ENABLE : IN STD_LOGIC;
    i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_x : IN STD_LOGIC;
    i_y : IN STD_LOGIC;
    i_z : IN STD_LOGIC;
    o_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END calc;

ARCHITECTURE arch_1 OF calc IS

  COMPONENT reg IS
    PORT (
      i_ID : IN STD_LOGIC;
      i_CLK : IN STD_LOGIC;
      i_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_DATA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT selector IS
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
  END COMPONENT;

  COMPONENT op_add IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT op_sub IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT op_plus_one IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT op_a IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT op_and IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT op_or IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT op_xor IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT op_not IS
    PORT (
      i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL w_i_A, w_i_B : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_i_DATA_REG, w_o_DATA_REG : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_E, w_CLK : STD_LOGIC := '0';
  SIGNAL w_X, w_Y, w_Z : STD_LOGIC := '0';
  SIGNAL w_o_OP_ADD : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_o_OP_SUB : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_o_OP_PLUS_ONE : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_o_OP_A : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_o_OP_AND : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_o_OP_OR : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_o_OP_XOR : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL w_o_OP_NOT : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN

  reg_DUT : reg PORT MAP(
    i_ID => w_E,
    i_CLK => w_CLK,
    i_DATA => w_i_DATA_REG,
    o_DATA => w_o_DATA_REG
  );

  selector_DUT : selector PORT MAP(
    i_s0 => w_Z,
    i_s1 => w_Y,
    i_s2 => w_X,
    i_DATA_OP_ADD => w_o_OP_ADD,
    i_DATA_OP_SUB => w_o_OP_SUB,
    i_DATA_OP_PLUS_ONE => w_o_OP_PLUS_ONE,
    i_DATA_OP_A => w_o_OP_A,
    i_DATA_OP_AND => w_o_OP_AND,
    i_DATA_OP_OR => w_o_OP_OR,
    i_DATA_OP_XOR => w_o_OP_XOR,
    i_DATA_OP_NOT => w_o_OP_NOT,
    o_S => w_i_DATA_REG
  );

  op_add_DUT : op_add PORT MAP(
    i_A => w_i_A,
    i_B => w_i_B,
    o_S => w_o_OP_ADD
  );

  op_sub_DUT : op_sub PORT MAP(
    i_A => w_i_A,
    i_B => w_i_B,
    o_S => w_o_OP_SUB
  );

  op_plus_one_DUT : op_plus_one PORT MAP(
    i_A => w_i_A,
    o_S => w_o_OP_PLUS_ONE
  );

  op_a_DUT : op_a PORT MAP(
    i_A => w_i_A,
    o_S => w_o_OP_A
  );

  op_and_DUT : op_and PORT MAP(
    i_A => w_i_A,
    i_B => w_i_B,
    o_S => w_o_OP_AND
  );

  op_or_DUT : op_or PORT MAP(
    i_A => w_i_A,
    i_B => w_i_B,
    o_S => w_o_OP_OR
  );

  op_xor_DUT : op_xor PORT MAP(
    i_A => w_i_A,
    i_B => w_i_B,
    o_S => w_o_OP_XOR
  );

  op_not_DUT : op_not PORT MAP(
    i_A => w_i_A,
    o_S => w_o_OP_NOT
  );

  PROCESS (i_CLK, i_ENABLE)
  BEGIN
    w_CLK <= i_CLK;
    w_E <= i_ENABLE;
    w_i_A <= i_A;
    w_i_B <= i_B;
    w_X <= i_x;
    w_Y <= i_y;
    w_Z <= i_z;
    o_OUT <= w_o_DATA_REG;
  END PROCESS;

END arch_1; -- arch_1