--RISC_EX_MEM_reg.vhd
-- Generated at Tue Aug 14 09:33:55 2018
--Andrew Miller 8/14/18
--RISC_EX_MEM_reg.vhd is a register to separate the EX and mem stages of a RISC V pipeline

library IEEE;
use IEEE.std_logic_1164.all;


entity RISC_EX_MEM_reg is

  port(
       jump_adr_in : in std_logic_vector(31 downto 0);
       AUIPC_in : in std_logic;  
       PC_in : in std_logic_vector(31 downto 0);
       PC_4_in : in std_logic_vector(31 downto 0);
       branch_adr_in : in std_logic_vector(31 downto 0);
       JAL_in : in std_logic;
       RegW_in : in std_logic;
       Branch_in : in std_logic;
       Branch_ctrl : in std_logic_vector(1 downto 0);
       memOP_in : in std_logic_vector(2 downto 0);
       ALUmsb_in : in std_logic;
       zero_in : in std_logic;
       ALU_in : in std_logic_vector(31 downto 0);
       rs2_in : in std_logic_vector(31 downto 0);
       memWB_in : in std_logic;
       i11_7_in : in std_logic_vector(4 downto 0);
       
       jump_adr_out : out std_logic_vector(31 downto 0);
       AUIPC_out : out std_logic;
       PC_out : out std_logic_vector(31 downto 0);
       PC_4_out : out std_logic_vector(31 downto 0);
       branch_adr_out : out std_logic_vector(31 downto 0);
       JAL_out : out std_logic;
       RegW_out : out std_logic;
       Branch_out : out std_logic;
       Branch_ctrl_out : out std_logic_vector(1 downto 0);
       memOP_out : out std_logic_vector(2 downto 0);
       ALUmsb_out : out std_logic;
       zero_out : out std_logic;
       ALU_out : out std_logic_vector(31 downto 0);
       rs2_out : out std_logic_vector(31 downto 0);
       memWB_out : out std_logic;
       i11_7_out : out std_logic_vector(4 downto 0);
       
       clk : in std_logic;
       rst_n : in std_logic
       );
       
  
end entity RISC_EX_MEM_reg;

architecture default of RISC_EX_MEM_reg is

  
begin

pipe : process(clk, rst_n) is 
begin
	if rst_n = '1' then
	  jump_adr_out <= (others => '0');
	  AUIPC_out <= '0';
	  PC_out <= (others => '0');
	  PC_4_out <= (others => '0');
	  branch_adr_out <= (others => '0');
	  JAL_out <= '0';
	  RegW_out <= '0';
	  Branch_out <= '0';
	  Branch_ctrl_out <= (others => '0'); 
	  memOP_out <= (others => '0');
	  ALUmsb_out <= '0';
	  zero_out <= '0';
	  ALU_out <= (others => '0');
	  rs2_out <= (others => '0');
	  memWB_out <= '0';
	  i11_7_out <= (others => '0');
	elsif rising_edge(clk) then
      jump_adr_out <= jump_adr_in;
	  AUIPC_out <= AUIPC_in;
	  PC_out <= PC_in;
	  PC_4_out <= PC_4_in;
	  branch_adr_out <= branch_adr_in;
	  JAL_out <= JAL_in;
	  RegW_out <= RegW_in;
	  Branch_out <= Branch_in;
	  Branch_ctrl_out <= Branch_ctrl;
	  memOP_out <= memOP_in;
	  ALUmsb_out <= ALUmsb_in;
	  zero_out <= zero_in;
	  ALU_out <= ALU_in;
	  rs2_out <= rs2_in;
	  memWB_out <= memWB_in;
	  i11_7_out <= i11_7_in;
    end if;
  end process pipe;



  
end architecture default;

