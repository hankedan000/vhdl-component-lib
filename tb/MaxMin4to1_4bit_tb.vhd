----------------------------------------------------------------------------
-- Entity:        MaxMin4to1_4bit_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/4/2014
-- Description:   VHDL test bench for MaxMin4to1_4bit
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   MaxMin4to1_4bit
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity MaxMin4to1_4bit_tb is
end    MaxMin4to1_4bit_tb;
----------------------------------------------------------------------------

architecture Behavioral of MaxMin4to1_4bit_tb is

	-- Unit Under Test (UUT)
	component MaxMin4to1_4bit is
		 Port ( A			:	in  	STD_LOGIC_VECTOR (3 downto 0);
				  B			:	in  	STD_LOGIC_VECTOR (3 downto 0);
				  C			:	in  	STD_LOGIC_VECTOR (3 downto 0);
				  D			:	in  	STD_LOGIC_VECTOR (3 downto 0);
				  
				  MAX			: 	out	STD_LOGIC_VECTOR (3 downto 0);
				  MIN			: 	out	STD_LOGIC_VECTOR (3 downto 0));
	end component MaxMin4to1_4bit;

   --Inputs
   signal A    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"3";
   signal B    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"5";
   signal C    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"A";
   signal D    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"F";

 	--Outputs
   signal MIN   		: STD_LOGIC_VECTOR (3 downto 0);
   signal MAX   		: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   MaxMin4to1: MaxMin4to1_4bit port map (
          A     		=> A,
          B     		=> B,
          C     		=> C,
          D     		=> D,
			 
          MIN  		=> MIN,
          MAX  		=> MAX
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		A <= x"3"; B <= x"5"; C <= x"A"; D <= x"F";
		wait for 100 ns;
		assert (MIN = x"3" and MAX = x"F" ) 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
		
		A <= x"7"; B <= x"2"; C <= x"E"; D <= x"A";
		wait for 100 ns;
		assert (MIN = x"2" and MAX = x"E" ) 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
		
		A <= x"7"; B <= x"D"; C <= x"6"; D <= x"C";
		wait for 100 ns;
		assert (MIN = x"6" and MAX = x"D" ) 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
		
		A <= x"C"; B <= x"B"; C <= x"B"; D <= x"A";
		wait for 100 ns;
		assert (MIN = x"A" and MAX = x"C" ) 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;

end Behavioral;

