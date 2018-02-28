library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is port(d, clk : in STD_LOGIC; q, notq : out STD_LOGIC);
end entity dff;

architecture d_arch of dff is
  begin
    process(clk, d)
      begin
        if(clk'event and (clk='1') and (d='0')) then
          q <= '0';
          notq <= '1';
        elsif(clk'event and (clk='1') and (d='1')) then
          q <= '1';
          notq <= '0';
        end if;
    end process;
end;  