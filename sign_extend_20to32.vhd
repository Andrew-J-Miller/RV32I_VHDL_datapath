--sign_extend_16to32.vhd
--Generated at Mon Jul 30 08:28:14 2018
--Andrew Miller 7/30/18
--sign_extend_16to32.vhd is a 16 bit to 32 bit sign extender

library IEEE;
use IEEE.std_logic_1164.all;


entity sign_extend_20to32 is

port(
  input : in std_logic_vector(19 downto 0);
  output : out std_logic_vector(31 downto 0)
  );
  
end entity sign_extend_20to32;

architecture default of sign_extend_20to32 is

  
begin

  extend : process(input)
    variable temp_out : std_logic_vector(31 downto 0);
  begin
  	temp_out(19 downto 0) := input;
  	temp_out(31 downto 20) := "000000000000";
  output <= temp_out;
  end process extend;



  
end architecture default;

