library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_tb is
end dff_tb;

architecture dff_tb_arch of dff_tb is

  -- Component declaration of Unit Under Test
  component dff is port(d, clk, enable, reset : in STD_LOGIC; q, notq : out STD_LOGIC);
  end component;

  -- Simulation Inputs
  signal d : STD_LOGIC;
  signal clk : STD_LOGIC := '0';
  signal enable : STD_LOGIC;
  signal reset : STD_LOGIC;
  constant clk_period : time := 10 ns;

  -- Simulation Outputs
  signal q : STD_LOGIC;
  signal notq : STD_LOGIC;
  
  begin
    -- Instantiate Unit Under Test
    uut : dff PORT MAP(d, clk, enable, reset, q, notq);
      
    -- Clock process
    clk_process : process
      begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    -- Input Process
    input_process : process
      begin
        wait for 50 ns;
        
        d <= '0';
        wait for 50 ns;
        d <= '1';
        wait for 25 ns;
        d <= '0';
        wait for 70 ns;
        d <= '1';
        wait for 50 ns;
        d <= '0';
        wait for 150 ns;
        d <= '1';
        wait for 15 ns;
        d <= '0';
        wait for 40 ns;
        d <= '1';
        wait for 65 ns;
        d <= '0';
    end process;
    
    enable_process : process
      begin
        wait for 50 ns;
        enable <= '1';
        wait for 300 ns;
        enable <= '0';
    end process;
    
    reset_process : process
      begin
        wait for 50 ns;
        
        reset <= '0';
        wait for 170 ns;
        reset <= '1';
        wait for 5 ns;
        reset <= '0';
    end process;
end;