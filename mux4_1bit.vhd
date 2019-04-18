--mux2.vhd
--Generated at Fri Jul 27 14:40:00 2018
--Andrew Miller 7/27/18
--mux2.vhd is a vhdl implementation of a 2 way 5 bit mux

library IEEE;
use IEEE.std_logic_1164.all;



entity mux4_1bit is

  port(
    in0, in1, in2, in3 : in std_logic;
    output : out std_logic;
    sel : in std_logic_vector(1 downto 0)
    );

  
end entity mux4_1bit;

architecture default of mux4_1bit is

  
begin



  output <= in0 when sel = "00" else
            in1 when sel = "01" else
            in2 when sel = "10" else
            in3 when sel = "11" else
            'X';
      


  
end architecture default;

