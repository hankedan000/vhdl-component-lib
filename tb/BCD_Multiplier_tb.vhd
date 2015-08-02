--------------------------------------------------------------------------------
-- Written By: E. George Walters
-- Date Created: 23 Sep 12
-- Last Revision: 23 Sep 12
-- 
-- Entity: BCD_Multiplier_tb
-- Description: VHDL test bench for BCD_Multiplier.
--
-- Dependencies:
--    BCD_Multiplier
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL; 
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

--------------------------------------------------------------------------------
entity BCD_Multiplier_tb is
end BCD_Multiplier_tb;
--------------------------------------------------------------------------------
 
architecture testbench of BCD_Multiplier_tb is 
	component BCD_Multiplier is
		generic (n:integer:=4);
		Port(	A		:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
				B		:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
				EXE	:	in		STD_LOGIC;
				CLK	: 	in 	STD_LOGIC;
				
				MUL	:	out	STD_LOGIC_VECTOR ((8*n)-1 downto 0));
	end component;
    
   signal A : std_logic_vector(15 downto 0) := x"0022";
   signal B : std_logic_vector(15 downto 0) := x"0006";
   signal EXE : std_logic := '1';
   signal CLK : std_logic := '0';

   signal MUL : std_logic_vector(31 downto 0);
   
   
 
begin

   uut: BCD_Multiplier generic map(n=>4) port map (A, B, EXE, CLK, MUL);

   process
   begin
      wait for 10ns;
		
		EXE	<= '0';
		
      wait;
   end process;
	
	CLK	<= not CLK after 5 ns;
end testbench;
