----------------------------------------------------------------------------
-- Entity:        OneShot
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   Create a one system wide pulse on the rising edge of X
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OneShot is
    Port ( 	X		:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
				
				Y		:	out	STD_LOGIC);
end OneShot;

architecture dataflow of OneShot is
signal	int_q		:	STD_LOGIC;

begin
	process (CLK) is
	begin
		if(CLK'event and CLK='1') then
			int_q <= X;
		end if;
	end process;
	Y		<= X and not int_q;
end dataflow;