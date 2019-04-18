--RISC_inst_split
-- Generated at Mon Aug 06 11:53:47 2018
--Andrew Miller 8/6/18
--RISC_inst_split is an instruction splitter for a RISC V processor

library IEEE;
use IEEE.std_logic_1164.all;

entity RISC_inst_split is

  port(instr_31_0 : in std_logic_vector(31 downto 0);
       instr_31_25 : out std_logic_vector(6 downto 0); --rd or immediate data
       instr_24_20 : out std_logic_vector(4 downto 0); --rs1
       instr_19_15 : out std_logic_vector(4 downto 0); --rs1
       instr_14_12 : out std_logic_vector(2 downto 0); --function code
       instr_11_7 : out std_logic_vector(4 downto 0); --rd or immediate data
       instr_6_0 : out std_logic_vector(6 downto 0) --opcode
       );
  
end entity RISC_inst_split;

architecture default of RISC_inst_split is

  
begin



  instr_31_25 <= instr_31_0(31 downto 25); --
  instr_24_20 <= instr_31_0(24 downto 20); --
  instr_19_15 <= instr_31_0(19 downto 15);
  instr_14_12 <= instr_31_0(14 downto 12); --
  instr_11_7 <= instr_31_0(11 downto 7);
  instr_6_0 <= instr_31_0(6 downto 0);


  
end architecture default;

