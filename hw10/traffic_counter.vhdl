library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity counter is
  port(sensors : in std_logic_vector(3 downto 0);
  north_turn_count, south_turn_count, east_count, west_count : out std_logic_vector(3 downto 0));
end entity counter;

architecture count_arch of counter is
  signal nt_count, st_count, e_count, w_count : std_logic_vector(3 downto 0) := "0000";
  begin
    process(signal[0])
    begin
      if(signal[0] = '1') then nt_count <= std_logic_vector(to_unsigned(to_integer(unsigned(nt_count) + 1)));
      end if;
    end process;
    process(signal[1])
    begin
      if(signal[1] = '1') then st_count <= std_logic_vector(to_unsigned(to_integer(unsigned(st_count) + 1)));
      end if;
    end process;
    process(signal[2])
    begin
      if(signal[2] = '1') then e_count <= std_logic_vector(to_unsigned(to_integer(unsigned(e_count) + 1)));
      end if;
    end process;
    process(signal[3])
    begin
      if(signal[3] = '1') then w_count <= std_logic_vector(to_unsigned(to_integer(unsigned(w_count) + 1)));
      end if;
    end process;
    north_turn_count <= nt_count;
    south_turn_count <= st_count;
    east_count <= e_count;
    west_count <= w_count;
end architecture count_arch;
