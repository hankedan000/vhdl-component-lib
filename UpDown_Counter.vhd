----------------------------------------------------------------------------
-- Entity:        UpDown_Counter
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  10/7/2014
-- Description:   Creates an nbit UpDown_Counter
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		Reg
--		AdderSubtractor
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UpDown_Counter is
generic (n:integer:=8);
    Port ( 	CNT		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				SUBTRACT	:	in		STD_LOGIC;
				CLR		:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				EN			:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end UpDown_Counter;

architecture dataflow of UpDown_Counter is
component Reg is
generic (n:integer:=8);
    Port ( 	D			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				LOAD		:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				CLR		:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component AdderSubtractor is
generic (n:integer:=8);
    Port ( A			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  B			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  SUBTRACT	:	in  	STD_LOGIC;
			  
           OVERFLOW	: 	out	STD_LOGIC;
           SUM			: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
end component;


signal	int_sum	:	STD_LOGIC_VECTOR (n-1 downto 0);
signal	int_q		:	STD_LOGIC_VECTOR (n-1 downto 0);

begin
	REG1:	Reg generic map(n => n) port map(
		D 		=>	int_sum,
		LOAD 	=> EN,
		CLK 	=> CLK,
		CLR 	=> CLR,
		Q 		=> int_q);
	
	ADD:	AdderSubtractor generic map (n=>n) port map(
		A			=> int_q,
		B			=> CNT,
		SUBTRACT	=> SUBTRACT,
		
		OVERFLOW	=> open,
		SUM		=> int_sum);
	
	Q			<= int_q;
end dataflow;