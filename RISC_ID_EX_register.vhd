--ID_EX_register.vhd
-- Generated at Tue Aug 14 07:54:47 2018
--Andrew Miller 8/14/18
--ID_EX register is a register for between the intruction decode and execution stages of a RISC V pipelined processor

library IEEE;
use IEEE.std_logic_1164.all;

entity ID_EX_register is

  port(
       --inputs
       Jmp_ofst_in : in std_logic_vector(31 downto 0);
       PC_in : in std_logic_vector(31 downto 0);
       AUIPC_in : in std_logic;
       PC_4_in : in std_logic_vector(31 downto 0);
       i31_12_se_in : in std_logic_vector(31 downto 0);
       LUI_in : in std_logic;
       JAL_in : in std_logic;
       ALUSrcB_in : in std_logic;
       ALUOp_in : in std_logic_vector(1 downto 0);
       Branch_in : in std_logic;
       BranchC_in : in std_logic_vector(1 downto 0);
       memWB_in : in std_logic;
       memOp_in : in std_logic_vector(2 downto 0);
       rs1_in : in std_logic_vector(31 downto 0);
       rs2_in : in std_logic_vector(31 downto 0);
       imm_in : in std_logic_vector(11 downto 0);
       i31_25_in : in std_logic_vector(6 downto 0);
       i14_12_in : in std_logic_vector(2 downto 0);
       i24_20_in : in std_logic_vector(4 downto 0);
       i11_7_in : in std_logic_vector(4 downto 0);
       regW_in : in std_logic;
       
       
       --outputs
       Jmp_ofst_out : out std_logic_vector(31 downto 0);
       PC_out : out std_logic_vector(31 downto 0);
       AUIPC_out : out std_logic;
       PC_4_out : out std_logic_vector(31 downto 0);
       i31_12_se_out : out std_logic_vector(31 downto 0);
       LUI_out : out std_logic;
       JAL_out : out std_logic;
       ALUSrcB_out : out std_logic;
       ALUOp_out : out std_logic_vector(1 downto 0);
       Branch_out : out std_logic;
       BranchC_out : out std_logic_vector(1 downto 0);
       memWB_out : out std_logic;
       memOp_out : out std_logic_vector(2 downto 0);
       rs1_out : out std_logic_vector(31 downto 0);
       rs2_out : out std_logic_vector(31 downto 0);
       imm_out : out std_logic_vector(11 downto 0);
       i31_25_out : out std_logic_vector(6 downto 0);
       i14_12_out : out std_logic_vector(2 downto 0);
       i24_20_out : out std_logic_vector(4 downto 0);
       i11_7_out : out std_logic_vector(4 downto 0);
       regW_out : out std_logic;
       
       
       --control
       clk : in std_logic;
       rst_n : in std_logic
       );
             
       
  
end entity ID_EX_register;

architecture default of ID_EX_register is

  
begin


pipe : process(clk, rst_n) is
begin
	if rst_n = '1' then
	  Jmp_ofst_out <= (others => '0');
	  PC_out <= (others => '0');
	  AUIPC_out <= '0';
	  PC_4_out <= (others => '0');
	  i31_12_se_out <= (others => '0');
	  LUI_out <= '0';
	  JAL_out <= '0';
	  ALUSrcB_out <= '0';
	  ALUOp_out <= (others => '0');
	  Branch_out <= '0';
	  BranchC_out <= (others => '0');
	  memWB_out <= '0';
	  memOp_out <= (others => '0');
	  rs1_out <= (others => '0');
	  rs2_out <= (others => '0');
	  imm_out <= (others => '0');
	  i31_25_out <= (others => '0');
	  i14_12_out <= (others => '0');
	  i24_20_out <= (others => '0');
	  i11_7_out <= (others => '0');
	  regW_out <= '0';
	 
	elsif rising_edge(clk) then
	  Jmp_ofst_out <= Jmp_ofst_in;
	  PC_out <= PC_in;
	  AUIPC_out <= AUIPC_in;
	  PC_4_out <= PC_4_in;
	  i31_12_se_out <= i31_12_se_in;
	  LUI_out <= LUI_in;
	  JAL_out <= JAL_in;
	  ALUSrcB_out <= ALUSrcB_in;
	  ALUOp_out <= ALUOp_in;
	  Branch_out <= Branch_in;
	  BranchC_out <= BranchC_in;
	  memWB_out <= memWB_in;
	  memOp_out <= memOp_in;
	  rs1_out <= rs1_in;
	  rs2_out <= rs2_in;
	  imm_out <= imm_in;
	  i31_25_out <= i31_25_in;
	  i14_12_out <= i14_12_in;
	  i24_20_out <= i24_20_in;
	  i11_7_out <= i11_7_in;
	  regW_out <= regW_in;
    end if;
  end process pipe;



end architecture default;

