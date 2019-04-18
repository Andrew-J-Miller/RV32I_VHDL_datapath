--
-- Generated at Fri Jul 27 07:33:22 2018
--

Package ProcMem_definitions is
  --gloabals
  CONSTANT width : integer := 32;
  
  --definitions for regfile
  CONSTANT regfile_depth : integer := 32; --register file depth = 2**address size
  CONSTANT regfile_adrsize : integer := 5; --address vector size = log2(depth)
  
  --memory definitions
  CONSTANT ram_adrwidth : integer := 8;  -- M x N ram block
  CONSTANT ram_datwidth : integer := 8;
  

  
  
  
END ProcMem_definitions;

