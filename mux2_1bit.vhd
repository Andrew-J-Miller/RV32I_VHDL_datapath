--mux2.vhd
--Generated at Fri Jul 27 14:40:00 2018
--Andrew Miller 7/27/18
--mux2.vhd is a vhdl implementation of a 2 way 5 bit mux

library IEEE;
use IEEE.std_logic_1164.all;



entity mux2_1bit is

  port(
    in0, in1 : in std_logic;
    output : out std_logic;
    sel : in std_logic
    );

  
end entity mux2_1bit;

architecture default of mux2_1bit is

  
begin



  output <= in0 when sel = '0' else
            in1 when sel = '1' else
            'X';
      


  
end architecture default;

