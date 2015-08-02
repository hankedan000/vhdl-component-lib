----------------------------------------------------------------------------
-- Entity:        InvertOrPass
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

entity InvertOrPass is
generic (n:integer:=4);
    Port ( B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
			  SUBTRACT	:	in		STD_LOGIC;
			  
           BXOR		: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
end InvertOrPass;

architecture dataflow of InvertOrPass is
begin
	genBxor: for i in 0 to n-1 generate
		BXOR(i) 	<= B(i) xor SUBTRACT;
	end generate genBxor;
end dataflow;