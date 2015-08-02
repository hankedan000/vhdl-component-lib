----------------------------------------------------------------------------
-- Entity:        Average4to1_4bit
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/11/2014
-- Description:   Finds the average of 4 4bit numbers
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		RippleCarryAdder
--
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Average4to1_4bit is
    Port ( A			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  B			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  C			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  D			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  
			  AVG			: 	out	STD_LOGIC_VECTOR (3 downto 0));
end Average4to1_4bit;

architecture dataflow of Average4to1_4bit is
	component RippleCarryAdder is
	generic (n:integer:=4);
		 Port ( A		:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
				  B		:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
				  C_in	:	in  	STD_LOGIC;
				  
				  C_out	: 	out  	STD_LOGIC;
				  SUM		: 	out  	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

signal catA		:	STD_LOGIC_VECTOR (5 downto 0);
signal catB		:	STD_LOGIC_VECTOR (5 downto 0);
signal catC		:	STD_LOGIC_VECTOR (5 downto 0);
signal catD		:	STD_LOGIC_VECTOR (5 downto 0);
signal sumA		:	STD_LOGIC_VECTOR (5 downto 0);
signal sumB		:	STD_LOGIC_VECTOR (5 downto 0);
signal sumC		:	STD_LOGIC_VECTOR (5 downto 0);

begin
	catA <= A(3) & A(3) & A;
	catB <= B(3) & B(3) & B;
	catC <= C(3) & C(3) & C;
	catD <= D(3) & D(3) & D;

	ADD_0: RippleCarryAdder generic map(n => 6) port map (
		A			=>	catA,
		B			=>	catB,
		C_in		=> '0',
		
		C_out		=>	open,
		SUM		=>	sumA
	);
	
	ADD_1: RippleCarryAdder generic map(n => 6) port map (
		A			=>	catC,
		B			=>	catD,
		C_in		=> '0',
		
		C_out		=>	open,
		SUM		=>	sumB
	);
	
	ADD_2: RippleCarryAdder generic map(n => 6) port map (
		A			=>	sumA,
		B			=>	sumB,
		C_in		=> '0',
		
		C_out		=>	open,
		SUM		=>	sumC
	);
	
	ADD_3: RippleCarryAdder generic map(n => 4) port map (
		A			=>	sumC(5 downto 2),
		B			=>	x"0",
		C_in		=> sumC(1),
		
		C_out		=>	open,
		SUM		=>	AVG
	);
end dataflow;