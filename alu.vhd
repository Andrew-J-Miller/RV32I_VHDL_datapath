--alu.vhd
--Generated at Fri Jul 27 09:32:01 2018
--Andrew Miller
--alu.vhd is a vhdl implementation of an alu

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;



use work.procmem_definitions.all;

entity alu is


  port(
    a, b : in std_logic_vector(31 downto 0);
    opcode : in std_logic_vector(2 downto 0);
    shift_amnt : in std_logic_vector(4 downto 0);
    sign : in std_logic;
    
    result : out std_logic_vector(31 downto 0);
    zero : out std_logic
    );
  
  
end entity alu;

architecture default of alu is

begin

  execute : process(a, b, opcode)
    variable r_uns : std_logic_vector(width-1 downto 0);
    variable a_uns : std_logic_vector(width-1 downto 0);
    variable b_uns : std_logic_vector(width-1 downto 0);
    variable z_uns : std_logic;
    begin
    	
    	a_uns := a;
    	b_uns := b;
        
      --select operation based on opcode
      case opcode is 
        --add operation
        when "010" =>
          if sign = '1' then
            r_uns := std_logic_vector(signed(a_uns) + signed(b_uns));
          else
            r_uns := std_logic_vector(unsigned(a_uns) + unsigned(b_uns));
          end if;
    
        --sub operation
        when "110" =>
          
          if sign = '1' then
            r_uns := std_logic_vector(signed(a_uns) - signed(b_uns));
          else
            r_uns := std_logic_vector(unsigned(a_uns) - unsigned(b_uns));
          end if;
          
        --xor operation
        when "011" =>
          r_uns := a_uns xor b_uns;
        --and operation
        when "000" =>
          r_uns := a_uns and b_uns;
        --or operation
        when "001" =>
          r_uns := a_uns or b_uns;
        --slt operation
        when "111" =>
          if sign = '1' then
            r_uns := std_logic_vector(signed(a_uns) - signed(b_uns));
          else
            r_uns := std_logic_vector(unsigned(a_uns) - unsigned(b_uns));
          end if;
          if signed(r_uns) < 0 then
            r_uns := (0 => '1',
                      others => '0');
          else
            r_uns := (others => '0');
          end if;
          
        --sll operation  
        when "101" =>
          r_uns := std_logic_vector(shift_left(unsigned(a_uns), to_integer(unsigned(shift_amnt))));
        
        --srl operation
        when "100" => 
          r_uns :=  std_logic_vector(shift_right(unsigned(a_uns), to_integer(unsigned(shift_amnt))));
          if sign = '1' and a(31) = '1' then
          for i in to_integer(unsigned(shift_amnt)) downto 0 loop
            r_uns(i) := '1';
          end loop;
          end if;
          
          
        --unsed bits (others)
        --set result to don't care
        when others => r_uns := (others => 'X');
      end case;

      --the zero bit must be set if the result is zero
      if to_integer(unsigned(r_uns)) = 0 then
        z_uns := '1';
      else
        z_uns := '0';
      end if;
      
      --assign outputs
      result <= r_uns;
      zero <= z_uns;
      
    end process execute;

  
end architecture default;

