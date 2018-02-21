library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_and is port(a, b : in STD_LOGIC_VECTOR(3 downto 0); v: out STD_LOGIC_VECTOR(3 downto 0));
end entity bitwise_and;

architecture and_arch of bitwise_and is
begin
  process(a, b)
    begin
      if((a(0) = '1') and (b(0) = '1')) then v(0) <= '1';
    else v(0) <= '0';
    end if;
      if((a(1) = '1') and (b(1) = '1')) then v(1) <= '1';
    else v(1) <= '0';
    end if;
      if((a(2) = '1') and (b(2) = '1')) then v(2) <= '1';
    else v(2) <= '0';
    end if;
      if((a(3) = '1') and (b(3) = '1')) then v(3) <= '1';
    else v(3) <= '0';
    end if;
  end process;
end architecture and_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_or is port(c, d : in STD_LOGIC_VECTOR(3 downto 0); x: out STD_LOGIC_VECTOR(3 downto 0));
end entity bitwise_or;

architecture or_arch of bitwise_or is
begin
  process(c, d)
    begin
      if((c(0) = '1') or (d(0) = '1')) then x(0) <= '1';
      else x(0) <= '0';
      end if;
      if((c(1) = '1') or (d(1) = '1')) then x(1) <= '1';
      else x(1) <= '0';
      end if;
      if((c(2) = '1') or (d(2) = '1')) then x(2) <= '1';
      else x(2) <= '0';
      end if;
      if((c(3) = '1') or (d(3) = '1')) then x(3) <= '1';
      else x(3) <= '0';
      end if;
  end process;
end architecture or_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_nand is port(e, f : in STD_LOGIC_VECTOR(3 downto 0); y : out STD_LOGIC_VECTOR(3 downto 0));
end entity bitwise_nand;

architecture nand_arch of bitwise_nand is
begin
  process(e, f)
    begin
      if((e(0) = '0') and (f(0) = '1')) then y(0) <= '1';
      elsif((e(0) = '1') and (f(0) = '0')) then y(0) <= '1';
      else y(0) <= '0';
      end if;
      if((e(1) = '0') and (f(1) = '1')) then y(1) <= '1';
      elsif((e(1) = '1') and (f(1) = '0')) then y(1) <= '1';
      else y(1) <= '0';
      end if;
      if((e(2) = '0') and (f(2) = '1')) then y(2) <= '1';
      elsif((e(2) = '1') and (f(2) = '0')) then y(2) <= '1';
      else y(2) <= '0';
      end if;
      if((e(3) = '0') and (f(3) = '1')) then y(3) <= '1';
      elsif((e(3) = '1') and (f(3) = '0')) then y(3) <= '1';
      else y(3) <= '0';
      end if;
  end process;
end architecture nand_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is port(g, h : in STD_LOGIC_VECTOR(3 downto 0); sel : in STD_LOGIC_VECTOR(1 downto 0); z : out STD_LOGIC_VECTOR(3 downto 0));
end entity alu;

architecture alu_arch of alu is

component bitwise_and is port(a, b : in STD_LOGIC_VECTOR(3 downto 0); v : out STD_LOGIC_VECTOR(3 downto 0));
end component bitwise_and;

component bitwise_or is port(c, d : in STD_LOGIC_VECTOR(3 downto 0); x : out STD_LOGIC_VECTOR(3 downto 0));
end component bitwise_or;

component bitwise_nand is port(e, f : in STD_LOGIC_VECTOR(3 downto 0); y : out STD_LOGIC_VECTOR(3 downto 0));
end component bitwise_nand;

signal and_output : STD_LOGIC_VECTOR(3 downto 0);
signal or_output : STD_LOGIC_VECTOR(3 downto 0);
signal nand_output : STD_LOGIC_VECTOR(3 downto 0);

begin
  ander : bitwise_and  port map(g, h, and_output);
  orer : bitwise_or port map(g, h, or_output);
  nander : bitwise_nand port map(g, h, nand_output);
  process(sel)
  begin
    case sel is
    when "00" =>
      z <= and_output;
    when "01" =>
      z <= or_output;
    when "10" =>
      z <= nand_output;
    when others =>
      z <= "0000";
    end case;
  end process;
end architecture alu_arch;      
            