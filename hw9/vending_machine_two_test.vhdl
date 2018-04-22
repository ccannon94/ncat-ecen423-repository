library ieee;
use ieee.std_logic_1164.all;

entity vending_machine_two_test is
end vending_machine_two_test;

architecture test_2_arch of vending_machine_two_test is

  --Declare unit under test
  component vending_machine_two is
    port(clk, reset, nickel, dime, quarter : in std_logic;
    vend, change : out std_logic);
  end component vending_machine_two;

  --Inputs
  signal clk, reset, nickel, dime, quarter : std_logic;

  --Outputs
  signal vend, change : std_logic;

  --Constants
  constant clk_period : time := 10ns;

  begin
    uut : vending_machine_two port map(clk, reset, nickel, dime, quarter, vend, change);

    clk_process : process
    begin
      clk <= '0';
      wait for clk_period / 2;
      clk <= '1';
      wait for clk_period / 2;
    end process;

    input_process : process
    begin
      wait for 45 ns;
      dime <= '1';
      nickel <= '0';
      quarter = '0';
      wait for 40 ns;
      dime <= '0';
      nickel <= '0';
      quarter = '0';
      wait for 30 ns;
      nickel <= '1';
      dime <= '0';
      quarter = '0';
      wait for 80 ns;
      nickel <= '0';
      dime <= '0';
      quarter = '0';
      wait for 30 ns;
      nickel <= '1';
      dime <= '0';
      quarter = '0';
      wait for 10 ns;
      nickel <= '0';
      dime <= '1';
      quarter = '0';
      wait for 20 ns;
      nickel <= '1';
      dime <= '0';
      quarter = '0';
      wait for 10 ns;
      nickel <= '0';
      dime <= '1';
      quarter = '0';
      wait for 10 ns;
      nickel <= '0';
      dime <= '0';
      quarter = '0';
      wait for 30 ns;
      nickel <= '1';
      dime <= '0';
      quarter = '0';
      wait for 70 ns;
      nickel <= '0';
      dime <= '1';
      quarter = '0';
      wait for 10 ns;
      nickel <= '0';
      dime <= '0';
      quarter = '0';
      wait for 30 ns;
      nickel <= '0';
      dime <= '0';
      quarter = '1';
      wait for 20 ns;
      nickel <= '0';
      dime <= '0';
      quarter = '0';
      wait for 30 ns;
      nickel <= '1';
      dime <= '0';
      quarter <= '0';
      wait for 70 ns;
      nickel <= '0';
      dime <= '0';
      quarter <= '1';
      wait for 10 ns;
      nickel <= '0';
      dime <= '0';
      quarter = '0';
    end process;
end architecture test_2_arch;
