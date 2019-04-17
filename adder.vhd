--adder.vhd
--Generated at Wed Aug 01 07:27:21 2018
--Andrew Miller 8/1/18
--adder.vhd is a vhdl 32 bit adder 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder is


  port(
    in0, in1 : in std_logic_vector(31 downto 0);
    result : out std_logic_vector(31 downto 0)
    );
  
end entity adder;

architecture default of adder is

  
begin



  add : process(in0, in1)
    variable res : unsigned(31 downto 0);
  begin
  	 res := unsigned(in0) + unsigned(in1);
  	 result <= std_logic_vector(res);
  end process add;


  
end architecture default;

