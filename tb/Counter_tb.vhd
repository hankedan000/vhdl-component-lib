----------------------------------------------------------------------------
-- Entity:        Counter_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   VHDL test bench for Counter
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
-- 	Counter
--		Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Counter_tb is
end    Counter_tb;
----------------------------------------------------------------------------

architecture Behavioral of Counter_tb is

	-- Unit Under Test (UUT)
	component Counter is
	generic (n:integer:=8);
		 Port ( 	CLR	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					
					Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

   --Inputs
   signal CLR    		: STD_LOGIC	:= '0';
	signal EN			: STD_LOGIC := '0';
   signal CLK    		: STD_LOGIC	:= '0';

 	--Outputs
   signal Q		 		: STD_LOGIC_VECTOR (7 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   COUNT: Counter generic map(n => 8) port map (CLR,EN,CLK,Q);

   -- Stimulus process
   stim_proc: process
   begin		
		CLR <= '1';
		wait for 100 ns;
		CLR <= '1';		EN	<=	'1';
		wait for 100 ns;
		CLR <= '0';
		wait for 500 ns;
		EN	<=	'0';
		wait for 100 ns;
		
      wait;
		
   end process;
	
	CLK	<= not CLK after 10 ns;

end Behavioral;

