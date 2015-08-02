----------------------------------------------------------------------------
-- Entity:        Tri_Buffer
-- Written By:    Daniel Hankewycz
-- Date Created:  5/13/2015
-- Description:   N bit Tristate Buffer
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Tri_Buffer is
generic (n:integer:=8);
    Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				OE_n		:	in		STD_LOGIC;
				
				Y			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end Tri_Buffer;

architecture dataflow of Tri_Buffer is
begin
		Y <= A when OE_n='0' else (others => 'Z');
end dataflow;