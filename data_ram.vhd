--ram.vhd
--Generated at Mon Jul 30 10:09:39 2018
--Andrew Miller 7/30/18
--ram.vhd is a vhdl implementation of ram for a RISC V processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;



entity data_ram is

  generic (
    adrwidth : integer := ram_adrwidth;
    datwidth : integer := ram_datwidth--;
    --ramfile : string --will be used for initial ram content
    );
  
  port(
    address : in std_logic_vector(ram_adrwidth - 1 downto 0);
    data : in std_logic_vector(ram_adrwidth - 1 downto 0);
    wren : in std_logic;
    q : out std_logic_vector(ram_datwidth - 1 downto 0)
    );
  
  
end entity data_ram;

architecture default of data_ram is

  type mem is array(0 to (2**ram_adrwidth) - 1) of std_logic_vector(ram_datwidth-1 downto 0);
  signal ram_block : mem := (others => "10101010");
  signal read_address_reg : std_logic_vector(ram_adrwidth-1 downto 0);
  
begin
	
  ram_access : process(wren)
  begin
  	  if wren = '1' then
  	    ram_block(to_integer(unsigned(address))) <= data;   
    end if;
  end process ram_access;
	
	
  q <= ram_block(to_integer(unsigned(address)));
  
end architecture default;

