----------------------------------------------------------------------------
-- Entity:        RippleCarryAdder
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   adds 2 nbit binary numbers with a carry in
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		FullAdder
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RippleCarryAdder is
generic (n:integer:=4);
    Port ( A		:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  B		:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
			  C_in	:	in  	STD_LOGIC;
			  
           C_out	: 	out  	STD_LOGIC;
           SUM		: 	out  	STD_LOGIC_VECTOR (n-1 downto 0));
end RippleCarryAdder;

architecture dataflow of RippleCarryAdder is
signal carry	:	STD_LOGIC_VECTOR (n downto 0);

component FullAdder is
    Port ( A		:	in  	STD_LOGIC;
			  B		:	in  	STD_LOGIC;
			  C_in	:	in  	STD_LOGIC;
			  
           C_out	: 	out  	STD_LOGIC;
           SUM		: 	out  	STD_LOGIC);
end component;

begin
	genFullAdder: for i in 0 to n-1 generate
		FAx: FullAdder port map (A(i),B(i),carry(i),carry(i+1),sum(i));
	end generate genFullAdder;
		
	carry(0)	<= C_in;
	C_out		<= carry(n);
end dataflow;