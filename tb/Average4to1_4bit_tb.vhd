----------------------------------------------------------------------------
-- Entity:        Average4to1_4bit
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/11/2014
-- Description:   VHDL test bench for Average4to1_4bit
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   Average4to1_4bit
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Average4to1_4bit_tb is
end    Average4to1_4bit_tb;
----------------------------------------------------------------------------

architecture Behavioral of Average4to1_4bit_tb is

   --Inputs
   signal A    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";
   signal B    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";
   signal C    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";
   signal D    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";

 	--Outputs
   signal AVG   		: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   Average: Average4to1_4bit port map (
          A     		=> A,
          B     		=> B,
          C     		=> C,
          D     		=> D,
			 
          AVG  		=> AVG);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		A <= x"3"; B <= x"5"; C <= x"7"; D <= x"9";
		wait for 100 ns;
		assert (AVG = x"6") 
			report "FAILURE: AVG does not equal expected value." 
			severity failure;
		
		A <= x"3"; B <= x"4"; C <= x"5"; D <= x"6";
		wait for 100 ns;
		assert (AVG = x"5") 
			report "FAILURE: AVG does not equal expected value." 
			severity failure;
		
		A <= x"2"; B <= x"F"; C <= x"6"; D <= x"C";
		wait for 100 ns;
		assert (AVG = x"9") 
			report "FAILURE: AVG does not equal expected value." 
			severity failure;
		
		A <= x"0"; B <= x"0"; C <= x"0"; D <= x"1";
		wait for 100 ns;
		assert (AVG = x"0") 
			report "FAILURE: AVG does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;

end Behavioral;

