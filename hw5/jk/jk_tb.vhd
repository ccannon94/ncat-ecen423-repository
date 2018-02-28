library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_tb is
end jk_tb;

architecture jk_tb_arch of jk_tb is
  
  component jk_flip_flop is port(j, k, set, clk : in STD_LOGIC; q, notq : inout STD_LOGIC);
  end component;
  
  signal j : STD_LOGIC;
  signal k : STD_LOGIC;
  signal set : STD_LOGIC;
  signal clk : STD_LOGIC;
  signal q : STD_LOGIC;
  signal notq : STD_LOGIC;
  
  constant clk_period : time := 10ns;

begin
  
  uut : jk_flip_flop port map(j, k, set, clk, q, notq);
  
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
    
  process
  begin
    wait for 50 ns;
    
    j <= '0';
    k <= '0';
    set <= '0';
    wait for 50 ns;
    k <= '1';
    wait for 50 ns;
    k <= '0';
    wait for 50 ns;
    j <= '1';
    wait for 50 ns;
    k <= '1';
    wait for 50 ns;
    j <= '0';
    k <= '0';
    wait for 15 ns;
    set <= '1';
    wait for 5 ns;
    set <= '0';
    wait for 30 ns;
  end process;
end;
    