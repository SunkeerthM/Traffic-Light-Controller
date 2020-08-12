----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:20 08/01/2020 
-- Design Name: 
-- Module Name:    traffic_light - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic_light is
    Port ( clk : in  STD_LOGIC;
           Sa : in  STD_LOGIC;
           Sb : in  STD_LOGIC;
           Ra : inout  STD_LOGIC;
           Ya : inout  STD_LOGIC;
           Ga : inout  STD_LOGIC;
           Rb : inout  STD_LOGIC;
           Yb : inout  STD_LOGIC;
           Gb : inout  STD_LOGIC);
end traffic_light;

architecture Behavioral of traffic_light is
signal state, nextstate: integer range 0 to 12;
--type light is (R, Y, G);
--signal lightA, lightB: light;

begin
	process(state, Sa, Sb)
	begin
	Ra <= '0'; Ya <= '0'; Ga <= '0'; Rb <= '0'; Yb <= '0'; Gb <= '0';
	nextstate <= 0;
		case state is
			when 0 to 4 =>
				Ga <= '1'; Rb <= '1'; 
				nextstate <= state + 1;
			when 5 =>
				Ga <= '1'; Rb <= '1';
				if(Sb = '1') then nextstate <= 6; 
				else nextstate <= state; end if;
			when 6 =>
				Ya <= '1'; Rb <= '0';
				nextstate <= 7;
			when 7 to 10 =>
				Ra <= '1'; Gb <= '1'; nextstate <= state + 1;			
			when 11 =>
				Ra <= '1'; Gb <= '1'; 
				if (Sa = '1' or Sb = '0') then nextstate <= 12; 
				elsif (Sa = '0' and Sb = '1') then nextstate <= state; end if;
			when 12 =>
				Ra <= '1'; Yb <= '1';
		end case;
	end process;
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			state <= nextstate;
		end if;
	end process;
--	lightA <= R when Ra = '1' else
--				 Y when Ya = '1' else
--				 G when Ga = '1';
				 
--	lightB <= R when Rb = '1' else
	--			 Y when Yb = '1' else
		--		 G when Gb = '1';	
	
end Behavioral;

