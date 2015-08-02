----------------------------------------------------------------------------
-- Entity:        Clock_Divided_Counter
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/18/2014
-- Description:   Creates an nbit Clock_Divided_Counter
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		Counter
--		Pulse_Gen
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Clock_Divided_Counter is
generic (n			:integer	:=8;
			timer_width:integer	:=8);
Port (	CNT	:	in		STD_LOGIC_VECTOR (timer_width-1 downto 0);
			CLR	:	in		STD_LOGIC;
			EN		:	in		STD_LOGIC;
			CLK	:	in		STD_LOGIC;
				
			Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end Clock_Divided_Counter;

architecture dataflow of Clock_Divided_Counter is
-- Component declarations
component Counter is
generic (n:integer:=8);
	 Port ( 	CLR	:	in		STD_LOGIC;
				EN		:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
				
				Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component Pulse_Gen is
generic (n:integer:=16);
	 Port ( 	CNT	:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				CLR	:	in		STD_LOGIC;
				EN		:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
				
				Q		:	out	STD_LOGIC);
end component;

-- Internal signal declarations
signal	int_pulse:	STD_LOGIC;

-- Beginning of architecture
begin
	PULSE:	Pulse_Gen generic map(n => timer_width) port map(CNT,CLR,EN,CLK,int_pulse);
	
	COUNT:	Counter generic map(n => n) port map(CLR,int_pulse,CLK,Q);
end dataflow;