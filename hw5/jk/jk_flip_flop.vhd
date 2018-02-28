library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_flip_flop is port(j, k, set, clk : in STD_LOGIC; q, notq : inout STD_LOGIC);
end entity jk_flip_flop;

architecture jk_arch of jk_flip_flop is 
begin
  process(j, k, set, clk)
    begin
      if(set = '1') then
        q <= '1';
        notq <= '0';
      elsif(clk'event and (clk = '1') and (j = '0') and (k = '1')) then
        q <= '0';
        notq <= '1';
      elsif(clk'event and (clk = '1') and (j = '1') and (k='0')) then
        q <= '1';
        notq <= '0';
      elsif(clk'event and (clk = '1') and (j = '1') and (k='1')) then
        q <= notq;
        notq <= q;
      end if;
  end process;
end architecture jk_arch;