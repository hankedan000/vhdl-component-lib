----------------------------------------------------------------------------
-- Entity:        CompareGRT
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/11/2014
-- Description:   compares 2 n vectors to see if A is greater than B
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CompareGRT is
generic (n:integer:=4);
    Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				
				GRT		:	out	STD_LOGIC);
end CompareGRT;

architecture dataflow of CompareGRT is
begin
	with (A>B) select
		GRT	<= '1' when true,
					'0' when others;
end dataflow;