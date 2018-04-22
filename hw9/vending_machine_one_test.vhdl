library ieee;
use ieee.std_logic_1164.all;

entity vending_machine_one_test is
end vending_machine_one_test;

architecture test_1_arch of vending_machine_one_test is

  --Declare unit under test
  component vending_machine_one is
    port(clk, reset, nickel, dime : in std_logic;
    vend, change : out std_logic);
  end component vending_machine_one;

  --Inputs
  signal clk, reset, nickel, dime : std_logic;

  --Outputs
  signal vend, change : out std_logic;

  --Constants
  constant clk_period : time := 10ns;

  begin
    uut : vending_machine_one port map(clk, reset, nickel, dime, vend, change);

    clk_process : clk_process
    begin
      clk <= '0';
      wait for clk_period / 2;
      clk <= '1';
      wait for clk_period / 2;
    end;

    input_process : clk_process
    begin
      wait for 45 ns;
      dime <= '1';
      nickel <= '0';
      wait for 40 ns;
      dime <= '0';
      nickel <= '0';
      wait for 30 ns;
      nickel <= '1';
      dime <= '0';
      wait for 80 ns;
      nickel <= '0';
      dime <= '0';
      wait for 30 ns;
      nickel <= '1';
      wait for 10 ns;
      nickel <= '0';
      dime <= '1';
      wait for 20 ns;
      nickel <= '1';
      dime = '0';
      wait for 10 ns;
      nickel <= '0';
      dime <= '1';
      wait for 10 ns;
      nickel <= '0';
      dime <= '0';
      wait for 30 ns;
      nickel <= '1';
      dime <= '0';
      wait for 70 ns;
      nickel <= '0';
      dime <= '1';
      wait for 10 ns;
      nickel <= '0';
      dime <= '0';
    end process;
end architecture test_1_arch;
