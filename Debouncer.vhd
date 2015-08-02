----------------------------------------------------------------------------
-- Entity:        Debouncer
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/18/2014
-- Description:   Creates an nbit Debouncer
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

entity Debouncer is
generic (n				:integer	:=8;
			delay_width	:integer	:=8);
Port (	D		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
			CNT	:	in		STD_LOGIC_VECTOR (delay_width-1 downto 0);
			CLK	:	in		STD_LOGIC;
				
			Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end Debouncer;

architecture dataflow of Debouncer is
-- Component declarations
component Counter is
generic (n:integer:=8);
	 Port ( 	CLR	:	in		STD_LOGIC;
				EN		:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
				
				Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component CompareEQU is
generic (n:integer:=4);
	Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				
				EQU		:	out	STD_LOGIC);
end component;

component Reg is
generic (n:integer:=8);
	 Port ( 	D		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				CLR	:	in		STD_LOGIC;
				LOAD	:	in		STD_LOGIC;
				CLK	:	in		STD_LOGIC;
				
				Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component DFF is
generic (n:integer:=8);
	 Port ( 	D			:	in		STD_LOGIC;
				EN			:	in		STD_LOGIC;
				CLK		:	in		STD_LOGIC;
				
				Q			:	out	STD_LOGIC);
end component;

-- Internal signal declarations
signal	int_q1,int_q2,int_cnt_clr,int_equ	:	STD_LOGIC_VECTOR (n-1 downto 0);
subtype elements is std_logic_vector(delay_width-1 downto 0);
type cnt_array is array (0 to n-1) of elements;
signal int_cnt : cnt_array;

-- Beginning of architecture
begin
	-- Component instantiation
	REG1:	Reg generic map(n => n) port map (D, 		'0', '1', CLK, int_q1);
	
	REG2:	Reg generic map(n => n) port map (int_q1, '0', '1', CLK, int_q2);
	
	genDebouncer: for i in 0 to n-1 generate
		COUNTx: Counter generic map(n => delay_width) port map (int_cnt_clr(i), '1', CLK, int_cnt(i));
		CMPx:	CompareEQU generic map(n => delay_width) port map (CNT, int_cnt(i), int_equ(i));
		REG3x:	DFF port map (int_q1(i), int_equ(i), CLK, Q(i));
	end generate genDebouncer;
	
	int_cnt_clr <= int_q1 xor int_q2;
end dataflow;