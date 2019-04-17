--memory.vhd
--Generated at Mon Jul 30 13:02:21 2018
--Andrew Miller 7/30/18
--memory.vhd is a vhdl implementation of a 4 block RAM instantiation for a RISC V processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;


entity data_memory_RISC is

  port(
    rst_n : in std_logic;
    memOP : in std_logic_vector(2 downto 0);
    mem_address : in std_logic_vector(31 downto 0);
    data_in : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0)
    );
  
end entity data_memory_RISC;

architecture default of data_memory_RISC is

  component data_ram is 
    generic (
      adrwidth : integer := 8;
      datwidth : integer := 8
      );
    port ( 
      address : in std_logic_vector(adrwidth-1 downto 0);
      data : in std_logic_vector(datwidth-1 downto 0);
      wren : in std_logic;
      q : out std_logic_vector(datwidth-1 downto 0)
      );
    end component data_ram;
  
  --internal signals
  --the ram is separated into 4 blocks. Each block has has input data, an input address, and output data
  signal wren : std_logic;
  signal data_in_0 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_in_1 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_in_2 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_in_3 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_0 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_1 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_2 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_3 : std_logic_vector(ram_datwidth-1 downto 0);
  signal address_0 : std_logic_vector(ram_adrwidth-1 downto 0);
  signal address_1 : std_logic_vector(ram_adrwidth-1 downto 0);
  signal address_2 : std_logic_vector(ram_adrwidth-1 downto 0);
  signal address_3 : std_logic_vector(ram_adrwidth-1 downto 0);
 
  
begin


  

  --the 4 ram blocks must now be instantited
  mem_block0 : data_ram
    generic map (
      adrwidth => ram_adrwidth,
      datwidth => ram_datwidth
      )
      
    port map (
      address => address_0,
      data => data_in_0,
      wren => wren,
      q => data_out_0
      );
      
      
    mem_block1 : data_ram
      generic map (
        adrwidth => ram_adrwidth,
        datwidth => ram_datwidth
        )
        
      port map (
        address => address_1,
        data => data_in_1,
        wren => wren,
        q => data_out_1
        );
        
    mem_block2 : data_ram
    generic map (
      adrwidth => ram_adrwidth,
      datwidth => ram_datwidth
      )
      
    port map ( 
      address => address_2,
      data => data_in_2,
      wren => wren,
      q => data_out_2
      );
      
      
    mem_block3 : data_ram
      generic map (
       adrwidth => ram_adrwidth,
       datwidth => ram_datwidth
       )
       
      port map (
        address => address_3,
        data => data_in_3,
        wren => wren,
        q => data_out_3
        );
    
    
    
    
    
    
      --wren needs the correct internal logic for this memory instantiaion because read and write enable are being condensed into one signal
      wren <= '1' when memOP = "101" or memOP = "110" or memOP = "111" else
              '0' when memOP = "000" or memOP = "001" or memOP = "010" or memOP = "011" or memOP = "100" else
              'X';
              
      
      
              
      --assert address to ram blocks
      addr_assert : process(mem_address)
        variable temp_ram_address : std_logic_vector(ram_adrwidth-1 downto 0);
      begin
      	temp_ram_address := mem_address(ram_adrwidth-1+2 downto 2);
      	
      	address_0 <= temp_ram_address;
      	address_1 <= temp_ram_address;
      	address_2 <= temp_ram_address;
      	address_3 <= temp_ram_address;
      end process addr_assert;
      
      
      mem : process(memOP, data_in, mem_address)
      begin
      	
      
        if memOP = "111" then --SW, use full data width
          --assert data into ram blocks
          data_in_3 <= data_in(4*ram_datwidth-1 downto 3*ram_datwidth);
          data_in_2 <= data_in(3*ram_datwidth-1 downto 2*ram_datwidth);
          data_in_1 <= data_in(2*ram_datwidth-1 downto ram_datwidth);
          data_in_0 <= data_in(ram_datwidth-1 downto 0);
        elsif memOP = "110" then --SH, use half data width
          data_in_1(ram_datwidth - 1 downto 0) <= data_in(2*ram_datwidth - 1 downto ram_datwidth);     --15 downto 8
          data_in_0(ram_datwidth - 1 downto 0) <= data_in(ram_datwidth-1 downto 0);                    --7 downto 0
        elsif memOP = "101" then --SB, use quarter data width
          data_in_0(ram_datwidth - 1 downto 0) <= data_in(ram_datwidth -1 downto 0);             --7 downto 0
        elsif memOP = "000" then --LB, assert data_out then sign extend
          data_out(7 downto 0) <= data_out_0;
          if data_out_0(7) = '1' then
            data_out(31 downto 8) <= (others => '1');
          else
            data_out(31 downto 8) <= (others => '0');
          end if;
        elsif memOP = "001" then --LH, assert data_out then sign_extend
          data_out(15 downto 8) <= data_out_1;
          data_out(7 downto 0) <= data_out_0;
          if data_out_1(7) = '1' then
            data_out(31 downto 16) <= (others => '1');
          else
            data_out(31 downto 16) <= (others => '0');
          end if;
        elsif memOP = "011" then --LBU, assert data_out then zero extend
          data_out(7 downto 0) <= data_out_0;
          data_out(31 downto 8) <= (others => '0');
        elsif memOP = "100" then --LHU, assert data_out then zero extend
          data_out(15 downto 8) <= data_out_1;
          data_out(7 downto 0) <= data_out_0;
          data_out(31 downto 16) <= (others => '0');
        else --memOP 010 LW, just load the word from all blocks     
          data_out <= (data_out_3 & data_out_2 & data_out_1 & data_out_0);
        end if;
      end process mem;
      
  
  
end architecture default;

