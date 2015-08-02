----------------------------------------------------------------------------
-- Entity:        TFF
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/24/2014
-- Description:   Toggle Flip Flop
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TFF is
    Port ( 	TOG		:	in		STD_LOGIC;
				CLR		:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC);
end TFF;

architecture dataflow of TFF is
signal	q_int	:	STD_LOGIC;

begin
	process (CLK) is
	begin
		if(CLK'event and CLK='1') then
			if(CLR='1') then
				q_int <= '0';
			elsif(TOG='1') then
				q_int <= not q_int;
			end if;
		end if;
	end process;
	
	Q <= q_int;
end dataflow;