--flush_ctrl.vhd
-- Generated at Thu Aug 02 09:42:56 2018
--Andrew Miller 8/2/18
--flush_ctrl.vhd is a control unit for pipeline flushes. On any jump or branch that is taken, the pipeline must be flushed

library IEEE;
use IEEE.std_logic_1164.all;

entity flush_ctrl_RISC is

  port(
    --a logic '1' on either branch or jump indicates a jump or branch is about to be taken. Either way, the pipeline must be flushed
    jump : in std_logic;
    branch : in std_logic;
    AUIPC : in std_logic;
    
    rst_n_driver : out std_logic;
    clk : in std_logic
    );
  
end entity flush_ctrl_RISC;

architecture default of flush_ctrl_RISC is

  
begin


  flush : process(clk)
  begin
  	if rising_edge(clk) then
  	  if jump = '1' or branch = '1' or AUIPC = '1' then
  	    rst_n_driver <= '1';
  	  else
  	    rst_n_driver <= '0';
      end if;
    end if;
  end process flush;

  
end architecture default;

