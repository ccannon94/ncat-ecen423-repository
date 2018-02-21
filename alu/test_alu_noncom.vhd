library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_alu_noncom is
end test_alu_noncom;

architecture test_arch of test_alu_noncom is

  -- Component delcaration of Unit Under Test
  component alu_noncom is port(g, h : in STD_LOGIC_VECTOR(3 downto 0); sel : in STD_LOGIC_VECTOR(1 downto 0); z : out STD_LOGIC_VECTOR(3 downto 0));
  end component;

  -- Simulation Inputs
  signal input_one : STD_LOGIC_VECTOR(3 downto 0);
  signal input_two : STD_LOGIC_VECTOR(3 downto 0);
  signal sel : STD_LOGIC_VECTOR(1 downto 0);

  -- Simulation Output
  signal output : STD_LOGIC_VECTOR(3 downto 0);

  begin

    --Instantiate unit under test
    uut: alu_noncom PORT MAP(input_one, input_two, sel, output);

    stim_proc : process
      begin
        wait for 100 ns;

        input_one <= "0000";
        input_two <= "1111";

        sel <= "00";
        wait for 100 ns;
        sel <= "01";
        wait for 100 ns;
        sel <= "10";
        wait for 100 ns;
        sel <= "11";
        wait for 100 ns;

        input_one <= "1101";
        input_two <= "0110";

        wait for 100 ns;

        sel <= "00";
        wait for 100 ns;
        sel <= "01";
        wait for 100 ns;
        sel <= "10";
        wait for 100 ns;
        sel <= "11";
        wait for 100 ns;

        input_one <= "1001";
        input_two <= "0101";

        wait for 100 ns;

        sel <= "00";
        wait for 100 ns;
        sel <= "01";
        wait for 100 ns;
        sel <= "10";
        wait for 100 ns;
        sel <= "11";
        wait for 100 ns;
  end process;
end architecture test_arch;
