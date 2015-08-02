----------------------------------------------------------------------------
-- Entity:        EdgeDetect
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/24/2014
-- Description:   Rising/Falling edge detector
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity EdgeDetect is
    Port ( 	D		:	in		STD_LOGIC;
				RISE	:	in		STD_LOGIC;
				EN		:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
			
				Q		:	out	STD_LOGIC);
end EdgeDetect;

architecture dataflow of EdgeDetect is
signal	int_q		:	STD_LOGIC;

begin
	process (CLK) is
	begin
		if(CLK'event and CLK='1') then
			int_q <= D;
		end if;
	end process;
	with RISE select
	Q		 <=	EN and (not D and int_q) when '0',
					EN and (D and not int_q) when '1',
					EN and (D and not int_q) when others;
end dataflow;