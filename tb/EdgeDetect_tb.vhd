----------------------------------------------------------------------------
-- Entity:        EdgeDetect_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   VHDL test bench for EdgeDetect
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
-- 	EdgeDetect
--		Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity EdgeDetect_tb is
end    EdgeDetect_tb;
----------------------------------------------------------------------------

architecture Behavioral of EdgeDetect_tb is

	-- Unit Under Test (UUT)
	component EdgeDetect is
		 Port ( 	D		:	in		STD_LOGIC;
					RISE	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
				
					Q		:	out	STD_LOGIC);
	end component;
   --Inputs
   signal D    		: STD_LOGIC	:= '0';
	signal RISE   		: STD_LOGIC	:= '0';
	signal EN    		: STD_LOGIC	:= '1';
   signal CLK    		: STD_LOGIC	:= '0';

 	--Outputs
   signal Q		 		: STD_LOGIC;
	
begin

	-- Instantiate the Unit Under Test (UUT)
   SHOT: EdgeDetect port map (D,RISE,EN,CLK,Q);

   -- Stimulus process
   stim_proc: process
   begin		
		RISE <= '1';
		D	<=	'0';
		wait for 100 ns;
		D	<= '1';
		wait for 100 ns;
		D	<= '0';
		wait for 109 ns;
		D	<= '1';
		wait for 100 ns;
		D	<= '0';
		
		RISE <= '0';
		D	<=	'0';
		wait for 100 ns;
		D	<= '1';
		wait for 100 ns;
		D	<= '0';
		wait for 109 ns;
		D	<= '1';
		wait for 100 ns;
		D	<= '0';
		
      wait;
		
   end process;
	
	CLK	<= not CLK after 10 ns;

end Behavioral;

