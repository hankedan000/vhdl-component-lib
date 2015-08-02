----------------------------------------------------------------------------
-- Entity:        RAM_SxW
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  10/9/2014
-- Description:   Generic RAM with size of S addresses and word length of W bits
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

entity RAM_SxW is
	generic (S:integer:=256; aw:integer:=8; dw:integer:=8);
	Port ( 	ADDRESS		:	in		STD_LOGIC_VECTOR	(aw-1 downto 0);
				DATA_IN		:	in		STD_LOGIC_VECTOR	(dw-1 downto 0);
				WE				:	in		STD_LOGIC;
				CLK			:	in		STD_LOGIC;
				
				DATA_OUT		:	out	STD_LOGIC_VECTOR	(dw-1 downto 0));
end RAM_SxW;

architecture behavioral of RAM_SxW is
type RAM_type is ARRAY (0 to S-1)
	of STD_LOGIC_VECTOR (dw-1 downto 0);
signal RAM	: RAM_type := (others=>(others=>'0'));

begin
	
	process(CLK) is
	begin
		if(CLK'event and CLK='1') then
			if(WE='1') then
					RAM(to_integer(unsigned(ADDRESS))) 	<= DATA_IN;
			end if;
			DATA_OUT <= RAM(to_integer(unsigned(ADDRESS)));
		end if;
	end process;
end behavioral;