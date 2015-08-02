----------------------------------------------------------------------------
-- Entity:        BCD_AddSub
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  11/07/2014
-- Description:   Creates an n-dec BCD_AddSub
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		BCDAddSubSlice
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

entity BCD_AddSub is
generic (n:integer:=4);
    Port ( 	A			:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
				B			:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
				CBI		:	in		STD_LOGIC;
				SUB		:	in		STD_LOGIC;
				
				CBO		:	out	STD_LOGIC;
				SUM		:	out	STD_LOGIC_VECTOR ((4*n)-1 downto 0));
end BCD_AddSub;

architecture dataflow of BCD_AddSub is	

component BCDAddSubSlice is
    Port ( 	A			:	in		STD_LOGIC_VECTOR (3 downto 0);
				B			:	in		STD_LOGIC_VECTOR (3 downto 0);
				CBI		:	in		STD_LOGIC;
				SUB		:	in		STD_LOGIC;
				
				CBO		:	out	STD_LOGIC;
				SUM		:	out	STD_LOGIC_VECTOR (3 downto 0));
end component;

signal	cb	:	STD_LOGIC_VECTOR (n downto 0);
signal	int_clr	:	STD_LOGIC;

begin
	cb(0)	<=	CBI;
	
	genFullBCD: for i in 0 to n-1 generate
		bcdSliceX : BCDAddSubSlice port map(
			A		=>	A(4*i+3 downto 4*i),
			B		=>	B(4*i+3 downto 4*i),
			CBI	=>	cb(i),
			SUB	=>	SUB,
			CBO	=>	cb(i+1),
			SUM	=>	SUM(4*i+3 downto 4*i)
		);
	end generate genFullBCD;
	
	CBO	<=	cb(n);
end dataflow;