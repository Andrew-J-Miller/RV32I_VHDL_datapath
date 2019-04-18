--se_4_bit
-- Generated at Tue Aug 07 11:36:00 2018
--Andrew Miller 8/7/18

library IEEE;
use IEEE.std_logic_1164.all;


entity se_4_bit is

  port(input : in std_logic_vector(4 downto 0);
       output : out std_logic_vector(31 downto 0)
       );
  
end entity se_4_bit;

architecture default of se_4_bit is

  
begin

  extend : process(input)
    variable temp : std_logic_vector(31 downto 0);
  begin
  	temp(4 downto 0) := input;
  	temp(31 downto 5) := "000000000000000000000000000";
  	output <= temp;
  end process extend;

  
end architecture default;

