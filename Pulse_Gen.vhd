----------------------------------------------------------------------------
-- Entity:        Pulse_Gen
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/18/2014
-- Description:   Creates an nbit Pulse_Gen
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		Counter
--		CompareEQU
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pulse_Gen is
generic (n:integer:=8);
    Port ( 	CNT	:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				CLR	:	in		STD_LOGIC;
				EN		:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
				
				Q		:	out	STD_LOGIC);
end Pulse_Gen;

architecture dataflow of Pulse_Gen is
Component Counter is
generic (n:integer:=8);
    Port ( 	CLR	:	in		STD_LOGIC;
				EN		:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
				
				Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end Component;

component CompareEQU is
	generic (n:integer:=4);
		 Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					
					EQU		:	out	STD_LOGIC);
	end component;
	
signal	int_cnt	:	STD_LOGIC_VECTOR (n-1 downto 0):=(others=>'0');
signal	int_clr	:	STD_LOGIC;
signal	int_equ	:	STD_LOGIC;

begin
	COUNT:	Counter generic map(n => n) port map(
		CLR		=> int_clr,
		EN			=>	EN,
		CLK		=> CLK,
		
		Q			=> int_cnt);
	
	EQU:	CompareEQU generic map (n=>n) port map(
		A			=> CNT,
		B			=> int_cnt,
		
		EQU		=> int_equ);
	
	Q			<= int_equ;
	int_clr	<= CLR or int_equ;
end dataflow;