library ieee;
use ieee.std_logic_1164.all;

entity prime is
    port(input : in STD_LOGIC_VECTOR(3 downto 0);
      isprime : out STD_LOGIC);
end entity prime;

architecture mcase_impl of prime is
  begin
    process(input) begin
      case input is
      when "0--1" => isprime <= '1';
      when "0010" => isprime <= '1';
      when "1011" => isprime <= '1';
      when "1101" => isprime <= '1';
      when others => isprime <= '0';
      end case;
  end process;
end mcase_impl;
