library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port(clk, reset, timer_done : in std_logic;
  sensors : in std_logic_vector(3 downto 0);
  north_light, south_light : out std_logic_vector(4 downto 0);
  east_west_lights : out std_logic_vector(2 downto 0);
  reset_timer, enable_timer : out std_logic);
end entity fsm;

architecture fsm_arch of fsm is
  signal current_state std_logic_vector(4 downto 0) := "00000";
  signal next_state std_logic_vector(4 downto 0) := "00000";

  process(clk, reset)
  begin
    if(reset = '1') then
      next_state <= "00000";
    elsif(clk'event and clk = '1') then
      case current_state is
        when "00000" =>
          if(sensor > "0000" and sensor < "0100") then
            next_state <= "00100";
          elsif(sensor > "1100") then
            next_state <= "00011";
          elsif(sensor >= "1000" and sensor < "1100") then
            next_state <= "00010";
          elsif(sensor >= "0100" and sensor < "1000") then
            next_state <= "00001";
          end if;
        when "00001" =>
          next_state <= "01001";
        when "00010" =>
          next_state <= "01110";
        when "00011" =>
          next_state <= "10011";
        when "00100" =>
          next_state <= "00101";
        when "00101" =>
          next_state <= "00110";
        when "00110" =>
          if(timer_done = '0') then
            next_state <= "00110";
          else
            next_state <= "00111";
          end if;
        when "00111" =>
          next_state <= "01000";
        when "01000" =>
          next_state <= "00000";
        when "01001" =>
          next_state <= "01010";
        when "01010" =>
          if(timer_done = '0') then
            next_state <= "01010";
          elsif(timer_done = '1' and (sensor[0] = '1' or sensor[1] = '1')) then
            next_state <= "01011";
          elsif(timer_done = '1' and sensor[0] = '0' and sensor[1] = '0') then
            next_state <= "01100";
          end if;
        when "01011" =>
          next_state <= "00101";
        when "01100" =>
          next_state <= "01101";
        when "01101" =>
          next_state <= "00000";
        when "01110" =>
          next_state <= "01111";
        when "01111" =>
          if(timer_done = '0') then
            next_state <= "01111";
          elsif(timer_done = '1' and (sensor[0] = '1' or sensor[1] = '1')) then
            next_state <= "10000";
          elsif(timer_done = '1' and sensor[0] = '0' and sensor[1] = '0') then
            next_state <= "10001";
          end if;
        when "10000" =>
          next_state <= "00101";
        when "10001" =>
          next_state <= "10010";
        when "10010" =>
          next_state <= "00000";
        when "10011" =>
          next_state <= "10100";
        when "10100" =>
          if(timer_done = '0') then
            next_state <= "10100";
          elsif(timer_done = '1' and (sensor[0] = '1' or sensor[1] = '1')) then
            next_state <= "10101";
          elsif(timer_done = '1' and sensor[0] = '0' and sensor[1] = '0') then
            next_state <= "10110";
          end if;
        when "10101" =>
          next_state <= "00101";
        when "10110" =>
          next_state <= "10111";
        when "10111" =>
          next_state <= "00000";
      end case;
    end if;
  end process;
  process(current_state)
  begin
    when "00000" =>
      north_light <= "00001";
      south_light <= "00001";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "00001" =>
      north_light <= "00100";
      south_light <= "00001";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "00010" =>
      north_light <= "00001";
      south_light <= "00100";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "00011" =>
      north_light <= "00100";
      south_light <= "00100";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "00100" =>
      north_light <= "00100";
      south_light <= "00100";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "00101" =>
      north_light <= "10000";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '1';
      enable_timer <= '1';
    when "00110" =>
      north_light <= "10000";
      south_light <= "10000";
      east_west_lights <= "001";
      reset_timer <= '0';
      enable_timer <= '1';
    when "00111" =>
      north_light <= "10000";
      south_light <= "10000";
      east_west_lights <= "010";
      reset_timer <= '0';
      enable_timer <= '0';
    when "01000" =>
      north_light <= "10000";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "01001" =>
      north_light <= "10000";
      south_light <= "00001";
      east_west_lights <= "100";
      reset_timer <= '1';
      enable_timer <= '1';
    when "01010" =>
      north_light <= "10000";
      south_light <= "00011";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '1';
    when "01011" =>
      north_light <= "10000";
      south_light <= "01100";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "01100" =>
      north_light <= "10000";
      south_light <= "01001";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "01101" =>
      north_light <= "10000";
      south_light <= "00001";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "01110" =>
      north_light <= "00001";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '1';
      enable_timer <= '1';
    when "01111" =>
      north_light <= "00011";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '1';
    when "10000" =>
      north_light <= "01100";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "10001" =>
      north_light <= "01001";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "10010" =>
      north_light <= "00001";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "10011" =>
      north_light <= "10000";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '1';
      enable_timer <= '1';
    when "10100" =>
      north_light <= "10010";
      south_light <= "10010";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '1';
    when "10101" =>
      north_light <= "11000";
      south_light <= "11000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "10110" =>
      north_light <= "11000";
      south_light <= "11000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
    when "10111" =>
      north_light <= "10000";
      south_light <= "10000";
      east_west_lights <= "100";
      reset_timer <= '0';
      enable_timer <= '0';
  end process;
  current_state <= next_state;
end architecture fsm_arch;
