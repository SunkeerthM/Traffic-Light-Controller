LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY tb_traffic_light_controller IS
END tb_traffic_light_controller;
 
ARCHITECTURE behavior OF tb_traffic_light_controller IS 

   --Inputs
   signal tb_clk : std_logic := '0';
   signal tb_Sa : std_logic := '0';
   signal tb_Sb : std_logic := '0';

	--BiDirs
   signal tb_Ra : std_logic;
   signal tb_Ya : std_logic;
   signal tb_Ga : std_logic;
   signal tb_Rb : std_logic;
   signal tb_Yb : std_logic;
   signal tb_Gb : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U1Test: entity work.traffic_light(Behavioral)
	PORT MAP (
          clk => tb_clk,
          Sa => tb_Sa,
          Sb => tb_Sb,
          Ra => tb_Ra,
          Ya => tb_Ya,
          Ga => tb_Ga,
          Rb => tb_Rb,
          Yb => tb_Yb,
          Gb => tb_Gb
        );

   -- Clock process definitions
   clk_process :process
   begin
		tb_clk <= '0';
		wait for clk_period/2;
		tb_clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		tb_Sa <= '0';
		tb_Sb <= '1';
      wait for clk_period*2;
		tb_Sb <= '0';
      wait for clk_period*2;
		tb_Sb <= '1';
      wait for clk_period*2;		
   
		wait for clk_period*4;
		
		tb_Sa <= '0';
		tb_Sb <= '1';
		wait for clk_period*2;		

		tb_Sa <= '1';
		wait for clk_period*2;
		
		assert false
			report "End"
			severity failure;
   end process;
END;
