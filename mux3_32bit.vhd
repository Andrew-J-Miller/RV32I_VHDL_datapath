--mux2.vhd
--Generated at Fri Jul 27 14:40:00 2018
--Andrew Miller 7/27/18
--mux3_32bit.vhd is a vhdl implementation of a 3 way 32 bit mux

library IEEE;
use IEEE.std_logic_1164.all;



entity mux3_32bit is

  port(
    in0, in1, in2 : in std_logic_vector(31 downto 0);
    output : out std_logic_vector(31 downto 0);
    sel : in std_logic_vector(1 downto 0)
    );

  
end entity mux3_32bit;

architecture default of mux3_32bit is

  
begin



  output <= in0 when sel = "00" else
            in1 when sel = "01" else
            in2 when sel = "10" else
            (others => 'X');
      


  
end architecture default;

