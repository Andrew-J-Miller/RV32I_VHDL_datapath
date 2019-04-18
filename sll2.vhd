--sll2.vhd
--Generated at Mon Jul 30 09:00:17 2018
--Andrew Miller 7/30/18
--sll2.vhd is a left shifter by 2 bits for 32 bit vectors

library IEEE;
use IEEE.std_logic_1164.all;


entity sll2 is

  port(
    input : in std_logic_vector(31 downto 0);
    output : out std_logic_vector(31 downto 0)
    );
  
end entity sll2;

architecture default of sll2 is

  
begin

  shift : process(input)
    variable temp : std_logic_vector(31 downto 0);
  begin
  	for i in 29 downto 0 loop
  	  temp(i + 2) := input(i);
    end loop;
    temp(1) := '0';
    temp(0) := '0';
    output <= temp;
  end process shift;


  
end architecture default;

