library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;  
entity test_prime is
end test_prime; 
architecture test of test_prime is 
signal input: std_logic_vector(3 downto 0); 
signal isprime: std_logic; 
signal exp_res: std_logic; 
component prime is 
port( input : in std_logic_vector(3 downto 0);        
isprime : out std_logic );
end component;
begin  -- instantiate module to test 
DUT: entity work.prime(mcase_impl) port map(input, isprime); 
DUT1: prime  port map(input, isprime);  
process
begin   
for i in 0 to 15 loop     
input <= std_logic_vector(to_unsigned(i,4));     
wait for 10 ns;     
if(i = 2) then         
exp_res <= '1';     
else 
exp_res <= '0';
end if;     
report "input = " & std_logic'image(input(2))   & std_logic'image(input(1))  & std_logic'image(input(0))  & " isprime = " & std_logic'image(isprime);     
assert exp_res /= isprime;   
end loop;   
std.env.stop(0);  
end process;end test;