----------------------------------------------------------------------------
-- Entity:        AdderSubtractor
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   adds 2 nbit binary numbers with a carry in
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		InvertOrPass
--		OverflowOrPass
--		RippleCarryAdder_nbit
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AdderSubtractor is
generic (n:integer:=4);
    Port ( A			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  B			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  SUBTRACT	:	in  	STD_LOGIC;
			  
           OVERFLOW	: 	out	STD_LOGIC;
           SUM			: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
end AdderSubtractor;

architecture dataflow of AdderSubtractor is
signal Sum_int,BXOR	:	STD_LOGIC_VECTOR (n-1 downto 0);

component RippleCarryAdder
generic (n:integer:=4);
    Port ( A			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  B			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  C_in		:	in  	STD_LOGIC;
			  
           C_out		: 	out  	STD_LOGIC;
           SUM			: 	out  	STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component InvertOrPass
generic (n:integer:=4);
    Port ( B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
			  SUBTRACT	:	in		STD_LOGIC;
			  
           BXOR		: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component OverflowDetect is
    Port ( SUBTRACT	:	in		STD_LOGIC;
			  A_MSB		:	in		STD_LOGIC;
			  B_MSB		:	in		STD_LOGIC;
			  SUM_MSB	:	in		STD_LOGIC;
			  
           OVERFLOW	: 	out	STD_LOGIC);
end component;

begin
	INVT: InvertOrPass generic map(n => n) port map (
		B			=>	B,
		SUBTRACT	=> SUBTRACT,
		
		BXOR		=>	BXOR
	);
	
	ADD: RippleCarryAdder generic map(n => n) port map (
		A			=> A,
		B			=> BXOR,
		C_in		=> SUBTRACT,

		C_out		=> open,
		SUM		=> Sum_int
	);
	
	OVRFL: OverflowDetect port map (
		SUBTRACT => SUBTRACT,
		A_MSB		=> A(n-1),
		B_MSB		=>	B(n-1),
		SUM_MSB	=> Sum_int(n-1),
		
		OVERFLOW => OVERFLOW
	);
		
	SUM <= Sum_int;
end dataflow;