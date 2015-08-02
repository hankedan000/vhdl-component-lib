----------------------------------------------------------------------------
-- Entity:        Shifter
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/24/2014
-- Description:   Parallel load shifter with parallel out
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

entity Shifter is
generic (n:integer:=8);
    Port ( 	D			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				LOAD		:	in		STD_LOGIC;
				SHIFT		:	in		STD_LOGIC;
				ROTATE	:	in		STD_LOGIC;
				LEFT		:	in		STD_LOGIC;
				CLR		:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end Shifter;

architecture dataflow of Shifter is
	
	signal q_int		:	STD_LOGIC_VECTOR	(n-1 downto 0);
	signal q_shift		:	STD_LOGIC_VECTOR	(n-1 downto 0);
	signal new_d_int	:	STD_LOGIC_VECTOR	(n-1 downto 0);
	signal d_int		:	STD_LOGIC_VECTOR	(n-1 downto 0);

	begin
		REG1: Reg generic map(n => n) port map (
			D		=> d_int,
			LOAD	=>	'1',
			CLK	=>	CLK,
			CLR	=>	CLR,
			
			Q		=>	q_int
		);
		
		Q		<=	q_int;
		
		with LEFT select
			q_shift 	<= (ROTATE and q_int(0)) & q_int(n-1 downto 1)		when '0',
							q_int(n-2 downto 0) & (ROTATE and q_int(n-1)) 	when '1',
							q_int(n-2 downto 0) & (ROTATE and q_int(n-1)) 	when others;
							
		with LOAD select
			d_int		<= new_d_int 	when '0',
							D				when '1',
							new_d_int	when others;
		
		with SHIFT select
			new_d_int<=	q_shift 	when '1',
							q_int		when '0',
							q_int		when others;
							
end dataflow;