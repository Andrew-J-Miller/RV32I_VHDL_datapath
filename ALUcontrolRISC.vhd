--ALUcontrol.vhd
--Generated at Fri Jul 27 10:22:38 2018
--Andrew Miller 7/27/18
--ALUcontrol.vhd is a vhdl implementation of an ALU control unit for a MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;




entity ALUcontrolRISC is

  port(
    instr_14_12 : in std_logic_vector(2 downto 0);
    instr_31_25 : in std_logic_vector(6 downto 0);
    ALUOp : in std_logic_vector(1 downto 0);
    ALUopcode : out std_logic_vector(2 downto 0);
    sign : out std_logic
  );

  
end entity ALUcontrolRISC;

  

architecture default of ALUcontrolRISC is


  
  
begin
 
  
  
  
 ctrl : process(ALUOp)
   --R Type instructions
   constant ADD_SUB : std_logic_vector(2 downto 0) := "000";
   constant cSLL : std_logic_vector(2 downto 0) := "001";
   constant SLT : std_logic_vector(2 downto 0) := "010";
   constant SLTU : std_logic_vector(2 downto 0) := "011";
   constant cXOR : std_logic_vector(2 downto 0) := "100";
   constant SRL_SRA : std_logic_vector(2 downto 0) := "101";
   constant cOR : std_logic_vector(2 downto 0) := "110";
   constant cAND : std_logic_vector(2 downto 0) := "111"; 
 begin
 
    case ALUOp is 
      when "00" =>
         sign <= '1';
         ALUopcode <= "010"; --case for add
      when "01" =>
        if instr_14_12 /= "110" or instr_14_12 /= "111" then
          sign <= '0';
        else
          sign <= '1';
        end if; 
        ALUopcode <= "110"; --case for subtract
      when "10" =>                     --R type isntruction, in this case the operation is dependent on the function field
        case instr_14_12 is
          when ADD_SUB =>
            sign <= '1';
            if instr_31_25(5) = '0' then --case for add
              ALUopcode <= "010";
            else --case for subtract
              ALUopcode <= "110";
            end if;
          
          when SLT =>
            sign <= '1';
            ALUopcode <= "111";
          when SLTU =>
            sign <= '0';
            ALUopcode <= "111";
          when cXOR =>
            ALUopcode <= "011";
            
          when SRL_SRA =>
            if instr_31_25(5) = '0' then --case for SRL
              sign <= '0';
              ALUopcode <= "100";
            else --case for SRA
              sign <= '1';
              ALUopcode <= "100";
            end if;
          when cSLL =>
            sign <= '0';
            ALUopcode <= "101";  
          when cOR =>
            ALUopcode <= "001";
          when cAND=>  
            ALUopcode <= "000";
          when others => ALUopcode <= "000";
        end case;

      when "11" => --used for left shift when perfoming LUI instruction
        ALUopcode <= "101";
      
      when others => ALUopcode <= "000";
   end case;
 end process ctrl;
   	
		

  
end architecture default;

