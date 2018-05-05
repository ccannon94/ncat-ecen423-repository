library ieee;
use ieee.std_logic_1164.all;

entity testbench_one is
end entity testbench_one;

architecture test_one of testbench_one is

  component fsm is
    port(clk, reset, timer_done : in std_logic;
    sensors : in std_logic_vector(3 downto 0);
    north_light, south_light : out std_logic_vector(4 downto 0);
    east_west_lights : out std_logic_vector(2 downto 0);
    reset_timer, enable_timer : out std_logic);
  end component fsm;

  --Inputs
  signal clk, reset, timer_done : std_logic := '0';
  signal sensors : std_logic_vector(3 downto 0) := "0000";

  --Outputs
  signal north_light, south_light : std_logic_vector(4 downto 0) := "00000";
  signal east_west_lights := std_logic_vector(2 downto 0) := "000";
  signal reset_timer, enable_timer : out std_logic := '0';

  --Constants
  constant clk_period : time := 10ns;

  begin
    uut : fsm port map(clk, reset, timer_done, sensors, north_light, south_light, east_west_lights, reset_timer, enable_timer);

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
      sensor <= "0100";
      wait for 40 ns;
      sensor <= "0001";
      timer_done <= '1';
      wait for 20 ns;
      timer_done <= '0';
      sensor <= "0000";
      wait for 30 ns;
      timer_done <= '1';
      wait for 60 ns;
      sensor <= "1100";
      wait for 40 ns;
      sensor <= "0000";
      timer_done <= '1';
      wait for 60 ns;
      sensor <= "0011";
      wait for 40 ns;
      sensor <= "0000";
      timer_done <= '1';
      wait for 20 ns;
      timer_done <= '0';
    end process;
end architecture test_one;
