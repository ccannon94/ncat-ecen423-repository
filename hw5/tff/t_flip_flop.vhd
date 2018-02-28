library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_flip_flop is port(clk, T, reset : in STD_LOGIC; q, notq : inout STD_LOGIC);
end entity t_flip_flop;

architecture t_arch of t_flip_flop is
  signal temp : STD_LOGIC;
begin
  process(clk, reset)
    begin
      if(reset = '1') then
        temp <= '0';
      elsif(clk'event and clk='1') then
        temp <= T xor temp;
      end if;
  end process;
  
  q <= temp;
  notq <= not temp;
end architecture t_arch;
