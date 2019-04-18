--sll2.vhd
--Generated at Mon Jul 30 09:00:17 2018
--Andrew Miller 7/30/18
--sll2.vhd is a left shifter by 2 bits for 32 bit vectors, this variant takes a 20 bit input ans shits while sign extending

library IEEE;
use IEEE.std_logic_1164.all;


entity sll2_25bit is

  port(
    input : in std_logic_vector(19 downto 0);
    output : out std_logic_vector(31 downto 0)
    );
  
end entity sll2_25bit;

architecture default of sll2_25bit is

  
begin

  shift : process(input)
    variable temp : std_logic_vector(31 downto 0);
  begin
  	for i in 19 downto 0 loop
  	  temp(i + 2) := input(i);
    end loop;
    temp(1) := '0';
    temp(0) := '0';
    if input(19) = '1' then
      temp(31 downto 22) := "1111111111";
    else
      temp(31 downto 22) := "0000000000";
    end if;
    output <= temp;
  end process shift;


  
end architecture default;

