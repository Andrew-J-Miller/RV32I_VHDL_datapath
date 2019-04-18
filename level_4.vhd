--level_4.vhd
--Generated at Mon Jul 30 08:45:50 2018
--Andrew Miller 7/30/18
--level_4.vhd is a 32 bit constant 4 generator

library IEEE;
use IEEE.std_logic_1164.all;


entity level_4 is

  port(output : out std_logic_vector(31 downto 0));

  
end entity level_4;



architecture default of level_4 is

  
begin


 output <= "00000000000000000000000000000100";

  
end architecture default;

