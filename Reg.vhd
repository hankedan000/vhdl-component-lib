----------------------------------------------------------------------------
-- Entity:        REG
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   N bit register
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Reg is
generic (n:integer:=8);
    Port ( 	D			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				LOAD		:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				CLR		:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end REG;

architecture dataflow of REG is
begin
	process (CLK) is
	begin
		if(CLK'event and CLK='1') then
			if(CLR='1') then
				Q <= (others => '0');
			elsif(LOAD='1') then
				Q <= D;
			end if;
		end if;
	end process;
end dataflow;