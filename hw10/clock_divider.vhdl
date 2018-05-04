library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
  port(clk : in std_logic;
  slow_clock : out std_logic);
end clock_divider;

architecture clock_divider_arch of clock_divider is
  begin
    process
    variable cnt :	std_logic_vector(26 downto 0):= "000000000000000000000000000";
    begin
      wait until ((clk'EVENT) AND (clk = '1'));
      cnt := STD_LOGIC_VECTOR(unsigned(cnt) + 1);
 	    slow_clock <= cnt(26);
    end process;
end clock_divider_arch;
