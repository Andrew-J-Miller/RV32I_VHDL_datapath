--bitdrop.vhd
-- Generated at Wed Aug 08 14:43:11 2018
--Andrew Miller 8/8/18
--bitdrop.vhd takes a 33 bit input and outputs only the 32 lsb

library IEEE;
use IEEE.std_logic_1164.all;


entity bitdrop is

  port(inp : in std_logic_vector(32 downto 0);
       outp : out std_logic_vector(31 downto 0));
  
end entity bitdrop;

architecture default of bitdrop is

  
begin

  outp <= inp(31 downto 0);

  
end architecture default;

