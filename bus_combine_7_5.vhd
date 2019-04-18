--bus_combine_7_5
-- Generated at Mon Aug 06 12:09:36 2018
--Andrew Miller 8/6/18
--bus_combine_7_5 is a vhdl 7 and 5 bit bus combine part

library IEEE;
use IEEE.std_logic_1164.all;

entity bus_combine_7_5 is

  port(in5 : in std_logic_vector(4 downto 0);
       in7 : in std_logic_vector(6 downto 0);
       out12 : out std_logic_vector(11 downto 0)
       );
  
end entity bus_combine_7_5;

architecture default of bus_combine_7_5 is

  
begin

  out12 <= in7 & in5;

  
end architecture default;

