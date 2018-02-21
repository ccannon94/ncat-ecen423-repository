library ieee;
use ieee.std_logic_1164.all;

entity alu_noncom is port(g, h : in STD_LOGIC_VECTOR(3 downto 0); sel : in STD_LOGIC_VECTOR(1 downto 0); z : out STD_LOGIC_VECTOR(3 downto 0));
end entity alu_noncom;

architecture alu_noncom_arch of alu_noncom is
  begin
    process(g, h, sel)
      begin
        case sel is
        when "00" =>
          z <= g and h;
        when "01" =>
          z <= g or h;
        when "10" =>
          z <= g nand h;
        when others =>
          z <= "0000";
        end case;
      end process;
end architecture alu_noncom_arch;