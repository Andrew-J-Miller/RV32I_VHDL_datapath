--RISC_ctrl.vhd
-- Generated at Mon Aug 06 13:54:14 2018
--Andrew Miller 8/6/18
--RISC_ctrl is a RISC V control module for a RISC V processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity RISC_ctrl is

  port(instr_6_0 : in std_logic_vector(6 downto 0);
       instr_14_12 : in std_logic_vector(2 downto 0);
       
       LUI : out std_logic;
       Reg_write : out std_logic;
       imm_sel : out std_logic;
       ALUSrcB : out std_logic;
       ALUOp : out std_logic_vector(1 downto 0);
       Branch : out std_logic;
       BranchT : out std_logic_vector(1 downto 0);
       memOP : out std_logic_vector(2 downto 0);
       memWB : out std_logic;
       JAL : out std_logic;
       AUIPC : out std_logic
       );
  
end entity RISC_ctrl;

architecture default of RISC_ctrl is

  CONSTANT RTYPE : std_logic_vector(6 downto 0) := "0110011";
  CONSTANT cJAL : std_logic_vector(6 downto 0) := "1101111";
  CONSTANT cBRANCH : std_logic_vector(6 downto 0) := "1100011";
  CONSTANT LOAD : std_logic_vector(6 downto 0) := "0000011";
  CONSTANT STORE : std_logic_vector(6 downto 0) := "0100011";
  CONSTANT ITYPE : std_logic_vector(6 downto 0) := "0010011";
  CONSTANT cLUI : std_logic_vector(6 downto 0) := "0110111";
  CONSTANT cAUIPC : std_logic_vector(6 downto 0) := "0010111";
  CONSTANT cJALR : std_logic_vector(6 downto 0) := "1100111";

  
begin


  control : process(instr_6_0, instr_14_12)
    variable control_sig : std_logic_vector(14 downto 0);
  begin
  	case instr_6_0 is
  	  when RTYPE =>
  	    control_sig := "000100100000000";
  	  when cJAL =>
  	    control_sig := "001100000000000";
  	  when cBRANCH =>
  	    if instr_14_12 = "000" then --case for BEQ
  	      control_sig := "000010011000000";
  	    elsif instr_14_12 = "001" then --case for BNE
  	      control_sig := "000010011100000";
  	    elsif instr_14_12 = "100" or instr_14_12 = "110" then --case for BLT or BLTU (sign is determined by ALU control)
  	      control_sig := "000010011010000";
  	    elsif instr_14_12 = "101" or instr_14_12 = "111" then --case for BGE or BGEU (sign is determined by ALU control)
  	      control_sig := "000010011110000";
  	      	    
        end if;
      when LOAD =>
        if instr_14_12 = "000" then --LB
          control_sig := "000101000000001";
        elsif instr_14_12 = "001" then --LH
          control_sig := "000101000000011";
        elsif instr_14_12 = "010" then --LW
          control_sig := "000101000000101";
        elsif instr_14_12 = "100" then --LBU
          control_sig := "000101000000111";
        elsif instr_14_12 = "101" then --LHU
          control_sig := "000101000001001";
        end if;

      when STORE =>
        
        if instr_14_12 = "000" then --SB
          control_sig := "000011000001010";
        elsif instr_14_12 = "001" then --SH
          control_sig := "000011000001100";
        elsif instr_14_12 = "010" then --SW
          control_sig := "000011000001110";
        end if;
       
      when ITYPE =>
        control_sig := "000101100000000";
        
      when cLUI =>
        control_sig := "010100110000000";
        
      when cAUIPC =>
        control_sig := "110100110000000";
        
      when cJALR =>
        control_sig := "101101000000000";    
        
      when others =>
        control_sig := "000000000000000";
    end case;
    
    AUIPC <= control_sig(14);
    LUI <= control_sig(13);
    JAL <= control_sig(12);
    Reg_write <= control_sig(11);
    imm_sel <= control_sig(10);
    ALUSrcB <= control_sig(9);
    ALUOp <= control_sig(8 downto 7);
    Branch <= control_sig(6);
    BranchT <= control_sig(5 downto 4);
    memOP <= control_sig(3 downto 1);
    memWB <= control_sig(0);
    
    end process control;
  
end architecture default;

