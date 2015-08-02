----------------------------------------------------------------------------
-- Entity:        FullAdder
-- Written By:    Daniel hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   1 bit full adder with carry in
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( A		:	in  STD_LOGIC;
			  B		:	in  STD_LOGIC;
			  C_in	:	in  STD_LOGIC;
			  
           C_out	: 	out  STD_LOGIC;
           SUM		: 	out  STD_LOGIC);
end FullAdder;

architecture dataflow of FullAdder is
	signal wire1, wire2, wire3	: STD_LOGIC;
begin
	wire1 <= A and B;
	wire2 <= B xor A;
	wire3 <= wire2 and C_in;
	
	C_out <= wire1 or wire3;
	SUM 	<= wire2 xor C_in;
end dataflow;
