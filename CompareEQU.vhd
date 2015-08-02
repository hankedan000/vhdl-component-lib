----------------------------------------------------------------------------
-- Entity:        CompareEQU
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   inverts a nbit binary input
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CompareEQU is
generic (n:integer:=4);
    Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				
				EQU		:	out	STD_LOGIC);
end CompareEQU;

architecture dataflow of CompareEQU is
begin
	with (A=B) select
		EQU	<= '1' when true,
					'0' when others;
end dataflow;