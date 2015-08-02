----------------------------------------------------------------------------
-- Entity:        BCDAddSubSlice
-- Written By:    Daniel hankewycz & Robby Brague
-- Date Created:  11/07/2014
-- Description:   1 bit full adder with carry in
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

entity BCDAddSubSlice is
    Port ( 	A			:	in		STD_LOGIC_VECTOR (3 downto 0);
				B			:	in		STD_LOGIC_VECTOR (3 downto 0);
				CBI		:	in		STD_LOGIC;
				SUB		:	in		STD_LOGIC;
				
				CBO		:	out	STD_LOGIC;
				SUM		:	out	STD_LOGIC_VECTOR (3 downto 0));
end BCDAddSubSlice;

architecture dataflow of BCDAddSubSlice is
	component RippleCarryAdder is
	generic (n:integer:=4);
		 Port ( A		:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
				  B		:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
				  C_in	:	in  	STD_LOGIC;
				  
				  C_out	: 	out  	STD_LOGIC;
				  SUM		: 	out  	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	signal tempB1		:	STD_LOGIC_VECTOR(3 downto 0);
	signal tempB2		:	STD_LOGIC_VECTOR(3 downto 0);
	signal tempSum1	:	STD_LOGIC_VECTOR(3 downto 0);
	signal tempSum2	:	STD_LOGIC_VECTOR(3 downto 0);
	signal tempCin		:	STD_LOGIC;
	signal tempCbo		:	STD_LOGIC;
	signal tempCout1	:	STD_LOGIC;
	signal tempCmp		:	STD_LOGIC;
	
begin
	
	tempB1	<=	B XOR (Sub & Sub & Sub & Sub);
	tempCin	<=	CBI XOR Sub;
	
	Adder1 : RippleCarryAdder generic map (n=>4) port map(
		A		=>	A,
		B		=>	tempB1,
		C_in	=>	tempCin,
		
		C_out	=>	tempCout1,
		Sum	=>	tempSum1
	);
	
	
	tempB2	<=	"1010"	when (SUB = '1') else
					"0110";
	
	Adder2 : RippleCarryAdder generic map (n=>4) port map(
		A		=>	tempSum1,
		B		=>	tempB2,
		C_in	=>	'0',
		
		C_out	=>	open,
		Sum	=>	tempSum2
	);

	tempCmp	<=	'1'	when (to_integer(unsigned(tempCout1&tempSum1)) > 9) else
					'0';
	
	tempCbo	<=	not tempCout1	when (SUB = '1') else
					tempCmp;
	
	SUM		<=	tempSum2		when	(tempCbo = '1') else
					tempSum1;
	
	CBO	<= tempCbo;
end dataflow;
