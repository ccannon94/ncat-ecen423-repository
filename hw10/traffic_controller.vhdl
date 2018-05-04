library IEEE;
use IEEE.std_logic_1164.all;

entity controller is
  port(clk, reset : in std_logic;
  sensors : in std_logic_vector(3 downto 0);
  north_light, south_light : out std_logic_vector(4 downto 0);
  east_west_lights : out std_logic_vector(2 downto 0);
  north_turn_count, south_turn_count, east_count, west_count : out std_logic_vector(3 downto 0));
end entity controller;

architecture control_arch of controller is
  signal north_light_sig : std_logic_vector(4 downto 0);
  signal south_light_sig : std_logic_vector(4 downto 0);
  signal east_west_lights_sig : std_logic_vector(2 downto 0);
  signal nt_count_sig : std_logic_vector(3 downto 0);
  signal st_count_sig : std_logic_vector(3 downto 0);
  signal e_count_sig : std_logic_vector(3 downto 0);
  signal w_count_sig : std_logic_vector(3 downto 0);
  signal td_sig : std_logic;
  signal enable_timer_sig : std_logic;
  signal reset_timer_sig : std_logic;

  component fsm is
    port(clk, reset, timer_done : in std_logic;
    sensors : in std_logic_vector(3 downto 0);
    north_light, south_light : out std_logic_vector(4 downto 0);
    east_west_lights : out std_logic_vector(2 downto 0);
    reset_timer, enable_timer : out std_logic);
  end component fsm;

  component timer is
    port(clk, reset, enable : in std_logic;
    time_done : out std_logic);
  end component timer;

  component counter is
    port(sensors : in std_logic_vector(3 downto 0);
    north_turn_count, south_turn_count, east_count, west_count : out std_logic_vector(3 downto 0));
  end component counter;

  begin
    fsm_component : fsm port map(clk, reset, td_sig, sensors, north_light_sig, south_light_sig, east_west_lights_sig, reset_timer_sig, enable_timer_sig);

    timer_component : timer port map(clk, reset_timer_sig, enable_timer_sig, td_sig);

    counter_component : counter port map(sensors, nt_count_sig, st_count_sig, e_count_sig, w_count_sig);

    north_light <= north_light_sig;
    south_light <= south_light_sig;
    east_west_lights <= east_west_lights_sig;
    north_turn_count <= nt_count_sig;
    south_turn_count <= st_count_sig;
    east_count <= e_count_sig;
    west_count <= w_count_sig;

end architecture control_arch;
