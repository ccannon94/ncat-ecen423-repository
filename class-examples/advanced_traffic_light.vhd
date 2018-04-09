library iee;
use ieee.std_logic_1164.all;

entity five_count is
    port(clk, reset, enable : in std_logic;
    five_done : out std_logic);
end entity five_count;

entity ten_count is
    port(clk, reset, enable : in std_logic;
    ten_done : out std_logic);
end entity ten_count;

entity fsm_control is
    port(clk, reset : in std_logic;
    five_reset, ten_reset : out std_logic;
    north_south, east_west : std_logic_vector(2 downto 0));
end entity fsm_control;

entity traffic_controller is
    port();
end entity traffic_controller;