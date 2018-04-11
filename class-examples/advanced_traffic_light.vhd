library ieee;
use ieee.std_logic_1164.all;

entity five_count is
    port(clk, reset, enable : in std_logic;
    five_done : out std_logic);
end entity five_count;

architecture five_arch of five_count is
    signal count : std_logic_vector(2 downto 0) := "000";

    begin
        process(clk, reset)
        begin
            if(reset = '1') then
                count <= "000";
            elsif(clk'event and clk = '1' and enable = '1') then
                count <= count + "001";
            end if;
        end process;
        process(count)
        begin
            if(count >= "101") then five_done <= '1';
            else five_done <= '0';
            end if;
        end process;
end architecture five_arch;

library ieee;
use ieee.std_logic_1164.all;

entity ten_count is
    port(clk, reset, enable : in std_logic;
    ten_done : out std_logic);
end entity ten_count;

architecture ten_arch of ten_count is 
    signal count : std_logic_vector(3 downto 0) := "0000";

    begin
        process(clk, reset)
        begin
            if(reset = '1') then
                count <= "0000";
            elsif(clk'event and clk = '1' and enable = '1') then
                count <= count + "0001";
            end if;
        end process;
        process(count)
        begin
            if(count >= "1010") then ten_done <= '1';
            else ten_done <= '0';
            end if;
        end process;
end architecture ten_arch;

library ieee;
use ieee.std_logic_1164.all;

entity fsm_control is
    port(clk, reset, sensor_ew : in std_logic;
    five_reset, ten_reset, five_enable, ten_enable : out std_logic;
    north_south, east_west : std_logic_vector(2 downto 0));
end entity fsm_control;

architecture fsm_arch of fsm_control is
    signal current_state : std_logic_vector(2 downto 0) := "000";
    signal next_state : std_logic_vector(2 downto 0) := "000";

    begin 
        process(clk, reset)
        begin
            if(reset = '1') then next_state <= "000";
            elsif(clk'event and clk = '1') then
                case current_state is
                    when "000" =>
                        if(ten_done = '1' and sensor_ew = '1') then
                            next_state <= "001";
                        else next_state <= "000";
                        end if;
                    when "001" =>
                        next_state <= "010";
                    when "010" =>
                        next_state <= "011";
                    when "011" =>
                        next_state <= "100";
                    when "100" =>
                        if(five_done = '1' or sensor_ew = '0') then
                            next_state <= "101";
                        else next_state <= "100";
                        end if;
                    when "101" =>
                        next_state <= "110";
                    when "110" =>
                        next_state <= "111";
                    when "111" =>
                        next_state <= "000";
                end case;
            end if;
        end process;
        process(current_state)
        begin
            case current_state is
                when "000" =>
                    north_south <= "001";
                    east_west <= "100";
                    five_reset <= '0';
                    five_enable <= '0';
                    ten_reset <= '0';
                    ten_enable <= '1';
                when "001" =>
                    north_south <= "010";
                    east_west <= "100";
                    five_reset <= '0';
                    five_enable <= '0';
                    ten_reset <= '0';
                    ten_enable <= '0';
                when "010" =>
                    north_south <= "100";
                    east_west <= "100";
                    five_reset <= '0';
                    five_enable <= '0';
                    ten_reset <= '0';
                    ten_enable <= '0';
                when "011" =>
                    north_south <= "100";
                    east_west <= "001";
                    five_reset <= '1';
                    five_enable <= '1';
                    ten_reset <= '0';
                    ten_enable <= '0';
                when "100" =>
                    north_south <= "100";
                    east_west <= "001";
                    five_reset <= '0';
                    five_enable <= '1';
                    ten_reset <= '0';
                    ten_enable <= '0';
                when "101" =>
                    north_south <= "100";
                    east_west <= "010";
                    five_reset <= '0';
                    five_enable <= '0';
                    ten_reset <= '0';
                    ten_enable <= '0';
                when "110" =>
                    north_south <= "100";
                    east_west <= "100";
                    five_reset <= '0';
                    five_enable <= '0';
                    ten_reset <= '0';
                    ten_enable <= '0';
                when "111" =>
                    north_south <= "001";
                    east_west <= "100";
                    five_reset <= '0'
                    five_enable <= '0';
                    ten_reset <= '1';
                    ten_enable <= '1';
            end case;
        end process;
    current_state <= next_state;
end architecture fsm_arch;

library ieee;
use ieee.std_logic_1164.all;

entity traffic_controller is
    port(clk, reset, sensor_ew: in std_logic;
    north_south, east_west : std_logic_vector(2 downto 0));
end entity traffic_controller;

architecture traffic_control_arch of traffic_controller is
    signal five_reset, five_enable, five_done, ten_reset, ten_enable, ten_done : std_logic;

    component five_count is
        port(clk, reset, enable : in std_logic;
        five_done : out std_logic);
    end component five_count;

    component ten_count is
        port(clk, reset, enable : in std_logic;
        ten_done : out std_logic);
    end component ten_count;

    component fsm_control is
        port(clk, reset, sensor_ew : in std_logic;
        five_reset, ten_reset, five_enable, ten_enable : out std_logic;
        north_south, east_west : std_logic_vector(2 downto 0));
    end component fsm_control;

    begin
        fc : five_count port map(clk, five_reset, five_enable, five_done);
        tc : ten_count port map(clk, ten_reset, ten_enable, ten_done);
        fsm : fsm_control port map(clk, reset, sensor_ew, five_reset, ten_reset, 
            five_enable, ten_enable, north_south, east_west);
end architecture traffic_control_arch;