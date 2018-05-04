library ieee;
use iee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity timer is
  port(clk, reset, enable : in std_logic;
  time_done : out std_logic);
end entity timer;

architecture time_arch of timer is
  signal count_clock : std_logic;
  signal current_count : std_logic_vector(3 downto 0) := "0000";

  component clock_divider is
    port(clk : in std_logic;
    slow_clock : out std_logic);
  end component clock_divider;

  begin
    cd : clock_divider port map(clk, count_clock);
    process(count_clock)
    begin
      if(reset = '1') then
        current_count <= "0000";
      elsif(count_clock'event and count_clock = '1' and enable = '1') then
        if(current_count = "1001") then
          time_done <= '1';
        else
          current_count <= std_logic_vector(to_unsigned(to_integer(unsigned(current_count) + 1)));
          time_done <= '0';
        end if;
      end if;
    end process;
end architecture time_arch;
