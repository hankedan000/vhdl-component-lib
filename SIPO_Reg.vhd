----------------------------------------------------------------------------
-- Entity:        SIPO_Reg
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   Single in parallel N bit shift register
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

entity SIPO_Reg is
generic (n:integer:=8);
    Port ( 	D			:	in		STD_LOGIC;
				LOAD		:	in		STD_LOGIC;
				LSB_FIRST:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				CLR		:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end SIPO_Reg;

architecture dataflow of SIPO_Reg is
	
	signal q_int	:	STD_LOGIC_VECTOR	(n-1 downto 0);
	signal d_int	:	STD_LOGIC_VECTOR	(n-1 downto 0);

	begin
		REG1: Reg generic map(n => n) port map (
			D		=> d_int,
			LOAD	=>	LOAD,
			CLK	=>	CLK,
			CLR	=>	CLR,
			
			Q		=>	q_int);
		
		Q		<=	q_int;
		with LSB_FIRST select
			d_int <= D & q_int(n-1 downto 1)	when '1',
						q_int(n-2 downto 0) & D when '0',
						(others => '0') when others;
		
end dataflow;