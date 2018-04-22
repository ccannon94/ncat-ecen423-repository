library IEEE;
use IEEE.std_logic_1164.all;

entity vending_machine_one is
  port(clk, reset, nickel, dime, quarter : in std_logic;
  vend, change : out std_logic);
end entity vending_machine_one

architecture vending_arch_one of vending_machine_one is

  type state_type is (zero_cents, five_cents, ten_cents, fifteen_cents, twenty_cents, twentyfive_cents, thirty_cents, thirtyfive_cents, forty_cents, fortyfive_cents, fifty_cents, fiftyfive_cents, sixty_cents);
  signal state : state_type;

  begin
    process(clk, reset)
    begin
      if(reset = '1') then state <= zero_cents;
      elsif(clk'event and clk = '1') then
        case state is
          when zero_cents =>
            if(nickel = '1') then
              state <= five_cents;
            elsif(dime = '1') then
              state <= ten_cents;
            elsif(quarter = '1') then
              state <= twentyfive_cents;
            end if;
          when five_cents =>
            if(nickel = '1') then
              state <= ten_cents;
            elsif(dime = '1') then
              state <= fifteen_cents;
            elsif(quarter = '1') then
              state <= thirty_cents;
            end if;
          when ten_cents =>
            if(nickel = '1') then
              state <= fifteen_cents;
            elsif(dime = '1') then
              state <= twenty_cents;
            elsif(quarter = '1') then
              state <= thirtyfive_cents;
            end if;
          when fifteen_cents =>
            if(nickel = '1') then
              state <= twenty_cents;
            elsif(dime = '1') then
              state <= twentyfive_cents;
            elsif(quarter = '1') then
              state <= forty_cents;
            end if;
          when twenty_cents =>
            if(nickel = '1') then
              state <= twentyfive_cents;
            elsif(dime = '1') then
              state <= thirty_cents;
            elsif(quarter = '1') then
              state <= fortyfive_cents;
            end if;
          when twentyfive_cents =>
            if(nickel = '1') then
              state <= thirty_cents;
            elsif(dime = '1') then
              state <= thirtyfive_cents;
            elsif(quarter = '1') then
              state <= fifty_cents;
            end if;
          when thirty_cents =>
            if(nickel = '1') then
              state <= thirtyfive_cents;
            elsif(dime = '1') then
              state <= forty_cents;
            elsif(quarter = '1') then
              state <= fiftyfive_cents;
            end if;
          when thirtyfive_cents =>
            if(nickel = '1') then
              state <= forty_cents;
            elsif(dime = '1') then
              state <= fortyfive_cents;
            elsif(quarter = '1') then
              state <= sixty_cents;
            end if;
          when fifty_cents =>
            state <= fortyfive_cents;
          when fiftyfive_cents =>
            state <= fifty_cents;
          when sixty_cents =>
            state <= fiftyfive_cents;
          when others =>
            state <= zero_cents;
        end case;
      end if;
    end process;

    process(state)
    begin
      case state is
        when zero_cents =>
          vend <= '0';
          change <= '0';
        when five_cents =>
          vend <= '0';
          change <= '0';
        when ten_cents =>
          vend <= '0';
          change <= '0';
        when fifteen_cents =>
          vend <= '0';
          change <= '0';
        when twenty_cents =>
          vend <= '0';
          change <= '0';
        when twentyfive_cents =>
          vend <= '0';
          change <= '0';
        when thirty_cents =>
          vend <= '0';
          change <= '0';
        when thirtyfive_cents =>
          vend <= '0';
          change <= '0';
        when forty_cents =>
          vend <= '1';
          change <= '0';
        when fortyfive_cents =>
          vend <= '1';
          change <= '1'';
        when others =>
          vend <= '0';
          change <= '1';
      end case;
    end process;
  end architecture vending_arch_one;
