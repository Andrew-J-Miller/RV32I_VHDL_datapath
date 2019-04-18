--regfile.vhd
--Generated at Fri Jul 27 09:17:23 2018
--Andrew Miller 7/27/18
--regfile.vhd is a vhdl implementation of a RISC V processor register

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;



entity regfile is


  port(
    clk, rst_n : in std_logic;
    wen : in std_logic;                           --write control
    writeport : in std_logic_vector(31 downto 0); --register input
    adrwport : in std_logic_vector(4 downto 0);   --address write
    adrport0 : in std_logic_vector(4 downto 0);   --address port 0
    adrport1 : in std_logic_vector(4 downto 0);   --address port 1
    readport0 : out std_logic_vector(31 downto 0);--output port 0
    readport1 : out std_logic_vector(31 downto 0) --output port 1
  );

  
end entity regfile;

architecture default of regfile is

  --these lines of code define the internal register itself
  subtype WordT is std_logic_vector(width - 1 downto 0); --reg word type
  type StorageT is array(0 to regfile_depth - 1) of WordT;  --reg array type
  signal registerfile : StorageT  := ( others => "00000000000000000000000000000000");  --the register itself. It starts set to all zeros
  
  
begin
  
  --perform register write
  write : process(rst_n, clk)
    begin
    	if rst_n = '0' then
    	  for i in 0 to regfile_depth-1 loop
    	    registerfile(i) <= (others => '0');
          end loop;
        elsif rising_edge(clk) then
          if wen = '1' then
            registerfile(to_integer(unsigned(adrwport))) <= writeport;
          end if;
        end if;
  end process;
  
  
  	
  --read ports
  readport0 <= registerfile(to_integer(unsigned(adrport0)));
  readport1 <= registerfile(to_integer(unsigned(adrport1)));
	

  
end architecture default;

