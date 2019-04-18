--Hazard_ctrl.vhd
-- Generated at Thu Aug 02 08:12:37 2018
--Andrew Miller 8/2/18

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Hazard_ctrl_RISC is

  port(
    reg_adr_a : in std_logic_vector(4 downto 0);
    reg_adr_b : in std_logic_vector(4 downto 0);
    writereg_adr : in std_logic_vector(4 downto 0);
    WB_reg_adr : in std_logic_vector(4 downto 0);
    ALUSrc : in std_logic;
    JAL : in std_logic;
    LUI : in std_logic;
    
    forwardAE : out std_logic_vector(1 downto 0);
    forwardBE : out std_logic_vector(1 downto 0);
    
    clk : in std_logic
    );
  
end entity Hazard_ctrl_RISC;

architecture default of Hazard_ctrl_RISC is

  
begin


  forward : process(clk)
  variable bita : std_logic := '0';
  variable bitb : std_logic := '0';
  begin
  	if rising_edge(clk) then
  	
  	bita := '0';
  	bitb := '0';
  	--condition for immediate data hazard in a, forward register at next clock cycle
    if writereg_adr = reg_adr_a and (JAL = '0' and LUI = '0') then
      --wait until rising_edge(clk);
      forwardAE <= "10";
      bita := '1';
    --condition for data hazard in a during wb stage, forward register at next clock cycle
    elsif WB_reg_adr = reg_adr_a and (JAL = '0' and LUI = '0') then
      --wait until rising_edge(clk);
      forwardAE <= "01";
      bita := '1';
    end if;
  
    --in case the same register must be forwarded twice, no elsif between a and b can be used. In its place, bit will track the "else" condition
    --condition for immediate data hazard in b, forward register at next clock cycle
    if  writereg_adr = reg_adr_b and (ALUSrc = '0' and LUI = '0' and JAL = '0') then
      --wait until rising_edge(clk);
      forwardBE <= "10";
      bitb := '1';    
    --condition for data hazard in b during wb stage, forward register at next clock cycle
    elsif WB_reg_adr = reg_adr_b and (ALUSrc = '0' and LUI = '0' and JAL = '0') then
      --wait until rising_edge(clk);
      forwardBE <= "01";
      bitb := '1';
    end if;
    
    if bita = '0' then
      forwardAE <= "00";
    end if;
    
    if bitb = '0' then
      forwardBE <= "00";
    end if;
    
    end if;
  end process forward;
  
end architecture default;

