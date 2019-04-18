--RISC_IF_ID_reg.vhd
-- Generated at Tue Aug 14 11:00:34 2018
--Andrew Miller 8/14/18
--RISC_IF_ID_reg is a VHDL implementation of a register between the IF and ID stages of a RISC V pipeline

library IEEE;
use IEEE.std_logic_1164.all;


entity RISC_IF_ID_reg is

  port(
       PC_in : in std_logic_vector(31 downto 0);
       PC_4_in : in std_logic_vector(31 downto 0);
       instr_in : in std_logic_vector(31 downto 0);
       
       PC_out : out std_logic_vector(31 downto 0);
       PC_4_out : out std_logic_vector(31 downto 0);
       instr_out : out std_logic_vector(31 downto 0);
       
       clk : in std_logic;
       rst_n : in std_logic
       );
       
  
end entity RISC_IF_ID_reg;

architecture default of RISC_IF_ID_reg is

  
begin

  pipe : process(clk, rst_n) is
  begin
  	if rst_n = '1' then
  	  PC_out <= (others => '0');
  	  PC_4_out <= (others => '0');
  	  instr_out <= (others => '0');
  	elsif rising_edge(clk) then
  	  PC_out <= PC_in;
  	  PC_4_out <= PC_4_in;
  	  instr_out <= instr_in;
    end if;
  end process pipe;


  
end architecture default;

