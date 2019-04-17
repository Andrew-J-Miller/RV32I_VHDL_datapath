--bus_slice.vhd
-- Generated at Tue Aug 07 07:03:00 2018
--Andrew Miller 8/7/18
--bus_slice.vhd takes a 32 bit input and slices it down to a 20 bit input

library IEEE;
use IEEE.std_logic_1164.all;

entity bus_slice is

  port(input : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(19 downto 0)
       );
  
end entity bus_slice;

architecture default of bus_slice is

  
begin

  output <= input(31 downto 12);
  
end architecture default;

