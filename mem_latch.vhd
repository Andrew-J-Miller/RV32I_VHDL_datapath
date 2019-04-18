--mem_latch.vhd
-- Generated at Thu Aug 09 09:56:36 2018
--Andrew Miller 8/9/18
--mem_latch.vhd is a simple latch for the data to memory to prevent data clobbering in memory

library IEEE;
use IEEE.std_logic_1164.all;

entity mem_latch is

  port(input : in std_logic_vector(31 downto 0);
       memOP : in std_logic_vector(2 downto 0);
       output : out std_logic_vector(31 downto 0));
  
end entity mem_latch;

architecture default of mem_latch is

  
begin


  latch : process(memOP, input)
  begin
  	if memOP = "101" or memOP = "110" or memOP = "111" then
  	  output <= input;
    end if;
  end process latch;

  
end architecture default;

