----------------------------------------------------------------------------
-- Entity:        Mux4to1
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/3/2014
-- Description:   Implements a 4to1 4bit mux
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux4to1 is
generic (n:integer:=4);
    Port ( 	X0			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				X1			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				X2			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				X3			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				SEL		:	in		STD_LOGIC_VECTOR (1 downto 0);
			  
				Y			: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
end Mux4to1;

architecture dataflow of Mux4to1 is
begin
	with SEL select
		Y <=	X0 when "00",
				X1 when "01",
				X2 when "10",
				X3 when "11",
				X0 when others;
	
end dataflow;