library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tff_tb is
end tff_tb;

architecture t_tb_arch of t_tb is
  
  component t_flip_flop is port(clk, T, reset : in STD_LOGIC; q, notq : inout STD_LOGIC);
  end component;
  
  signal clk : STD_LOGIC;
  signal T : STD_LOGIC;
  signal q : STD_LOGIC;
  signal reset : STD_LOGIC;
  signal notq : STD_LOGIC;
  
  constant clk_period : time := 10ns;
  constant t_period : time := 15 ns;
  
begin
  
  uut : t_flip_flop port map(clk, T, reset, q, notq);
  
  process
  begin
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    wait for 220 ns;
  end process;
    
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
  
  t_process : process
    begin
      T <= '0';
      wait for t_period/2;
      T <= '1';
      wait for t_period/2;
  end process;
end;