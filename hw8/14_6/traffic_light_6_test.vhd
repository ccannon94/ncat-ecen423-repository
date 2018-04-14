library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light_6_test is
end traffic_light_6_test;

architecture test_6_arch of traffic_light_6_test is

    -- Component declaration of Unit Under Test
    component traffic_light is
        port(clk, reset, carew, carns : in std_logic;
        north_south, east_west : out std_logic_vector(2 downto 0));
    end component traffic_light;

    -- Simulation Inputs
    signal clk, reset, carew, carns: std_logic;

    constant clk_period : time := 10ns;

    -- Simulation Outputs
    signal north_south, east_west : std_logic_vector(2 downto 0);

    begin
        uut : traffic_light port map(clk, reset, carew, carns, north_south, east_west);

        clk_process : process
        begin
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end process;

        input_process : process
        begin
            wait for 50 ns;
            carew <= '1';
            wait for 20 ns;
            carew <= '0';
            wait for 30 ns;
            carns <= '1';
            wait for 20 ns;
            carns <= '0';
        end process;
end architecture test_6_arch;