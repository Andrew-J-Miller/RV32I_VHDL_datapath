--RISC_MEM_WB_reg.vhd
--Generated at Tue Aug 14 10:21:41 2018
--Andrew Miller
--RISC_MEM_WB_reg is a VHDL register between the MEM and WB stages of a RISC V pipeline

library IEEE;
use IEEE.std_logic_1164.all;

entity RISC_MEM_WB_reg is

  port(
       AUIPC_in : in std_logic;
       AUIPC_res_in : in std_logic_vector(31 downto 0);
       PC_4_in : in std_logic_vector(31 downto 0);
       JAL_in : in std_logic;
       RegW_in : in std_logic;
       mem_in : in std_logic_vector(31 downto 0);
       ALU_in : in std_logic_vector(31 downto 0);
       memWB_in : in std_logic;
       i11_7_in : in std_logic_vector(4 downto 0);
       
       AUIPC_out : out std_logic;
       AUIPC_res_out : out std_logic_vector(31 downto 0);
       PC_4_out : out std_logic_vector(31 downto 0);
       JAL_out : out std_logic;
       RegW_out : out std_logic;
       mem_out : out std_logic_vector(31 downto 0);
       ALU_out : out std_logic_vector(31 downto 0);
       memWB_out : out std_logic;
       i11_7_out : out std_logic_vector(4 downto 0);
       
       clk : in std_logic;
       rst_n : in std_logic
       );
       
  
end entity RISC_MEM_WB_reg;

architecture default of RISC_MEM_WB_reg is

  
begin

  
  pipe : process(clk, rst_n) is
  begin
  	if rst_n = '1' then
  	  AUIPC_out <= '0';
  	  AUIPC_res_out <= (others => '0');
  	  PC_4_out <= (others => '0');
  	  JAL_out <= '0';
  	  RegW_out <= '0';
  	  mem_out <= (others => '0');
  	  ALU_out <= (others => '0');
  	  memWB_out <= '0';
  	  i11_7_out <= (others => '0');
  	elsif rising_edge(clk) then
  	  AUIPC_out <= AUIPC_in;
  	  AUIPC_res_out <= AUIPC_res_in;
  	  PC_4_out <= PC_4_in;
  	  JAL_out <= JAL_in;
  	  RegW_out <= RegW_in;
  	  mem_out <= mem_in;
  	  ALU_out <= ALU_in;
  	  memWB_out <= memWB_in;
  	  i11_7_out <= i11_7_in;
    end if;
  end process pipe;

  
  
  
  
  
end architecture default;

