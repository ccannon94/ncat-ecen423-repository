library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light_three is
    port(clk, reset, carew : in std_logic;
    north_south, east_west : out std_logic_vector(2 downto 0));
end entity traffic_light_three;

architecture traffic_arch of traffic_light_three is
    signal current_state, next_state : std_logic_vector(2 downto 0);

    begin
        --Process for state transitions
        process(clk, reset)
        begin
            --Asynchronous reset
            if(reset = '1') then next_state <= "000";
            --If rising clock edge, move states
            elsif(clk'event and clk = '1') then
                case(current_state) is
                    when "000" =>
                        --If there is a car coming east/west, transition
                        if(carew = '1') then
                            next_state <= "001";
                        --Otherwise, stay
                        else
                            next_state <= "000";
                        end if;
                    when "001" =>
                        next_state <= "010";
                    when "010" =>
                        next_state <= "011";
                    when "011" =>
                        --If there is a car coming east/west, stay green
                        if(carew = '1') then
                            next_state <= "011";
                        --When all the cars have gone, transition back
                        else
                            next_state <= "100";
                        end if;
                    when "100" =>
                        next_state <= "101";
                    when others =>
                        next_state <= "000";
                end case;
            end if;
        end process;
        process(current_state)
    begin
            --Assigns output for each state based on the State Diagram
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
                    east_west <= "001";
            end case;
        end process;
        current_state <= next_state;
end architecture traffic_arch;