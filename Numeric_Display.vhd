----------------------------------------------------------------------------
-- Entity:        Numeric_Display
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/18/2014
-- Description:   Display a 32 bit number
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		Decoder3to8
--		Counter
--		CompareEQU
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Numeric_Display is
    Port ( 	NUM		:	in		STD_LOGIC_VECTOR	(31 downto 0);
				MASK		:	in		STD_LOGIC_VECTOR	(7 downto 0);
				EN			:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
			
				SEGMENT	:	out	STD_LOGIC_VECTOR	(6 downto 0);
				AN			:	out	STD_LOGIC_VECTOR	(7 downto 0));
end Numeric_Display;

architecture dataflow of Numeric_Display is
	
	component Counter is
	generic (n:integer:=3);
		 Port (	CLR		:	in		STD_LOGIC;
					EN			:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
				
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Decoder3to8 is
		 Port ( 	X			:	in		STD_LOGIC_VECTOR (2 downto 0);
					EN			:	in		STD_LOGIC;
				
					Y			: 	out	STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component HexToSevenSeg is
		 Port ( 	HEX		:	in		STD_LOGIC_VECTOR (3 downto 0);
				  
					SEGMENT	: 	out	STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	component OneShot is
		 Port ( 	X			:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
				
					Y			:	out	STD_LOGIC);
	end component;
	
	component Pulse_Gen is
	generic (n:integer:=8);
		 Port (	CNT		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					CLR		:	in		STD_LOGIC;
					EN			:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
				
					Q			:	out	STD_LOGIC);
	end component;
	
	signal int_an		:	STD_LOGIC_VECTOR (7 downto 0);
	signal int_clr		:	STD_LOGIC;
	signal int_hex		:	STD_LOGIC_VECTOR (3 downto 0);
	signal int_pulse	:	STD_LOGIC;
	signal an_cnt		:	STD_LOGIC_VECTOR (2 downto 0);
	
	begin
		
		COUNT		: Counter generic map(n => 3) port map(
				CLR		=>	int_clr,
				EN			=>	int_pulse,
				CLK		=>	CLK,
				
				Q			=>	an_cnt
		);
		
		DECODE	: Decoder3to8 port map(
				X			=>	an_cnt,
				EN			=>	'1',
				
				Y			=>	int_an
		);
		
		SEG		: HexToSevenSeg port map(
				HEX		=>	int_hex,
				
				SEGMENT	=>	SEGMENT
		);
		
		SHOT		: OneShot port map(
				X			=>	EN,
				CLK		=>	CLK,
				
				Y			=>	int_clr
		);
		
		PULSE		: Pulse_Gen generic map(n => 16) port map(
				CNT		=>	x"FFFF", -- ~1.6ms per digit
				CLR		=>	int_clr,
				EN			=>	EN,
				CLK		=>	CLK,
				
				Q			=>	int_pulse
		);
		
		AN		<=	NOT (int_an and MASK);
		
		with an_cnt select
			int_hex <=	NUM(3  downto  0) when "000",
							NUM(7  downto  4) when "001",
							NUM(11 downto  8) when "010",
							NUM(15 downto 12) when "011",
							NUM(19 downto 16) when "100",
							NUM(23 downto 20) when "101",
							NUM(27 downto 24) when "110",
							NUM(31 downto 28) when "111",
							NUM(3  downto  0) when others;
		
		
end dataflow;