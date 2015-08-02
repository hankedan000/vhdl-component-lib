----------------------------------------------------------------------------
-- Entity:        MaxMin4to1_4bit
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/11/2014
-- Description:   Finds the max and min 4 bit number from a list of 
--						4 numbers
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		CompareGRT
--		Mux4to1
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MaxMin4to1_4bit is
    Port ( A			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  B			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  C			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  D			:	in  	STD_LOGIC_VECTOR (3 downto 0);
			  
			  MAX			: 	out	STD_LOGIC_VECTOR (3 downto 0);
			  MIN			: 	out	STD_LOGIC_VECTOR (3 downto 0));
end MaxMin4to1_4bit;

architecture dataflow of MaxMin4to1_4bit is
	component CompareGRT is
	generic (n:integer:=4);
		 Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					
					GRT		:	out	STD_LOGIC);
	end component;
	
	component Mux4to1 is
	generic (n:integer:=4);
		 Port ( 	X0			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					X1			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					X2			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					X3			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					SEL		:	in		STD_LOGIC_VECTOR (1 downto 0);
				  
					Y			: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

signal comp		:	STD_LOGIC_VECTOR (3 downto 0);
signal minA		:	STD_LOGIC_VECTOR (3 downto 0);
signal minB		:	STD_LOGIC_VECTOR (3 downto 0);
signal maxA		:	STD_LOGIC_VECTOR (3 downto 0);
signal maxB		:	STD_LOGIC_VECTOR (3 downto 0);

begin
	compGRT_0: CompareGRT generic map(n => 4) port map (
		A			=>	A,
		B			=>	B,
		
		GRT		=>	comp(0)
	);
	
	compGRT_1: CompareGRT generic map(n => 4) port map (
		A			=>	C,
		B			=>	D,
		
		GRT		=>	comp(1)
	);
	
	MuxMin_0:  Mux4to1	generic map(n => 4) port map (
		X0			=>	A,
		X1			=>	B,
		X2			=>	"0000",
		X3			=>	"0000",
		SEL		=>	'0' & comp(0),
		
		Y			=>	minA
	);
	
	MuxMax_0:  Mux4to1	generic map(n => 4) port map (
		X0			=>	B,
		X1			=>	A,
		X2			=>	"0000",
		X3			=>	"0000",
		SEL		=>	'0' & comp(0),
		
		Y			=>	maxA
	);
	
	MuxMin_1:  Mux4to1	generic map(n => 4) port map (
		X0			=>	C,
		X1			=>	D,
		X2			=>	"0000",
		X3			=>	"0000",
		SEL		=>	'0' & comp(1),
		
		Y			=>	minB
	);
	
	MuxMax_1:  Mux4to1	generic map(n => 4) port map (
		X0			=>	D,
		X1			=>	C,
		X2			=>	"0000",
		X3			=>	"0000",
		SEL		=>	'0' & comp(1),
		
		Y			=>	maxB
	);
	
	compGRT_2: CompareGRT generic map(n => 4) port map (
		A			=>	maxA,
		B			=>	maxB,
		
		GRT		=>	comp(2)
	);
	
	MuxMax_2:  Mux4to1	generic map(n => 4) port map (
		X0			=>	maxB,
		X1			=>	maxA,
		X2			=>	"0000",
		X3			=>	"0000",
		SEL		=>	'0' & comp(2),
		
		Y			=>	MAX
	);
	
	compGRT_3: CompareGRT generic map(n => 4) port map (
		A			=>	minA,
		B			=>	minB,
		
		GRT		=>	comp(3)
	);
	
	MuxMin_2:  Mux4to1	generic map(n => 4) port map (
		X0			=>	minA,
		X1			=>	minB,
		X2			=>	"0000",
		X3			=>	"0000",
		SEL		=>	'0' & comp(3),
		
		Y			=>	MIN
	);
	
end dataflow;