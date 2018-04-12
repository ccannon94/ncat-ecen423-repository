library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light is
    port(clk, reset, carew : in std_logic;
    north_south, east_west : out std_logic_vector(2 downto 0));
end entity traffic_light;

architecture traffic_arch of traffic_light is
    signal current_state, next_state : std_logic_vector(2 downto 0);

    begin
        process(clk, reset)
        begin
            if(reset = "000") then next_state <= "000";
            elsif(clk'event and clk = '1') then
                case(current_state) is
                    when "000" =>
                        if(carew = '1') then
                            next_state <= "001";
                        else
                            next_state <= "000";
                        end if;
                    when "001" =>
                        next_state <= "010";
                    when "010" =>
                        next_state <= "011";
                    when "011" =>
                        next_state <= "100";
                    when "100" =>
                        next_state <= "101";
                    when others =>
                        next_state <= "000";
                end case;
            end if;
        end process;
        process(current_state)
            case current_state is
                when "000" =>
                    north_south <= "100";
                    east_west <= "001";
                when "001" =>
                    north_south <= "010";
                    east_west <= "001";
                when "010" =>
                    north_south <= "001";
                    east_west <= "001";
                when "011" =>
                    north_south <= "001";
                    east_west <= "100";
                when "100" =>
                    north_south <= "001";
                    east_west <= "010";
                when others =>
                    north_south <= "001";
                    east_west <= "001;"
            end case;
        end process;
        current_state <= next_state;
end architecture traffic_arch;