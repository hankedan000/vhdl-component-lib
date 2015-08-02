----------------------------------------------------------------------------
-- Entity:        OverflowDetect
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   determine if overflow has occured in binary adition
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OverflowDetect is
    Port ( SUBTRACT	:	in		STD_LOGIC;
			  A_MSB		:	in		STD_LOGIC;
			  B_MSB		:	in		STD_LOGIC;
			  SUM_MSB	:	in		STD_LOGIC;
			  
           OVERFLOW	: 	out	STD_LOGIC);
end OverflowDetect;

architecture dataflow of OverflowDetect is
begin
	OVERFLOW	<= (not SUBTRACT and not A_MSB and not B_MSB and SUM_MSB)
				or	(not SUBTRACT and A_MSB and B_MSB and not SUM_MSB)
				or	(SUBTRACT and not A_MSB and B_MSB and SUM_MSB)
				or	(SUBTRACT and A_MSB and not B_MSB and not SUM_MSB);
end dataflow;