----------------------------------------------------------------------------
-- Entity:        OneShot_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   VHDL test bench for OneShot
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
-- 	OneShot
--		Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity OneShot_tb is
end    OneShot_tb;
----------------------------------------------------------------------------

architecture Behavioral of OneShot_tb is

	-- Unit Under Test (UUT)
	component OneShot is
		 Port ( 	X		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					
					Y		:	out	STD_LOGIC);
	end component;

   --Inputs
   signal X    		: STD_LOGIC	:= '0';
   signal CLK    		: STD_LOGIC	:= '0';

 	--Outputs
   signal Y		 		: STD_LOGIC;
	
begin

	-- Instantiate the Unit Under Test (UUT)
   SHOT: OneShot port map (X,CLK,Y);

   -- Stimulus process
   stim_proc: process
   begin		
		X	<=	'0';
		wait for 100 ns;
		X	<= '1';
		wait for 100 ns;
		X	<= '0';
		wait for 109 ns;
		X	<= '1';
		wait for 100 ns;
		X	<= '0';
		
      wait;
		
   end process;
	
	CLK	<= not CLK after 10 ns;

end Behavioral;

