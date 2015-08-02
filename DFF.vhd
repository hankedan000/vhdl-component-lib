----------------------------------------------------------------------------
-- Entity:        DFF
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   N bit DFFister
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DFF is
generic (n:integer:=8);
    Port ( 	D			:	in		STD_LOGIC;
				EN			:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC);
end DFF;

architecture dataflow of DFF is
begin
	process (CLK) is
	begin
		if(CLK'event and CLK='1') then
			if(EN='1') then
				Q <= D;
			end if;
		end if;
	end process;
end dataflow;