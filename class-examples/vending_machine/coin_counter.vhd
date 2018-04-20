library ieee;
use ieee.std_logic_1164.all;

entity coin_counter is
  port(reset, clk, nickel, dime, quarter : in bit;
  total_amount : std_logic_vector(6 downto 0);
  can_afford : std_logic_vector(2 downto 0));
end entity coin_counter;

architecture coin_count_arch of coin_counter is

signal current_amount : std_logic_vector(6 downto 0);

begin
  process(clk)
  begin
    case current_amount is
    end case;
  end process;
  total_amount <= current_amount;
end architecture coin_count_arch;
