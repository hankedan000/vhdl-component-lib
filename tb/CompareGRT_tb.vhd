----------------------------------------------------------------------------
-- Entity:        CompareGRT_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/11/2014
-- Description:   VHDL test bench for CompareGRT
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   CompareGRT
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity CompareGRT_tb is
end    CompareGRT_tb;
----------------------------------------------------------------------------

architecture Behavioral of CompareGRT_tb is

	-- Unit Under Test (UUT)
	component CompareGRT is
	generic (n:integer:=4);
		 Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					
					GRT		:	out	STD_LOGIC);
	end component;

   --Inputs
   signal A    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"A";
   signal B    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"A";

 	--Outputs
   signal GRT  		: STD_LOGIC;
	
begin

	-- Instantiate the Unit Under Test (UUT)
   CMPGRT: CompareGRT generic map(n => 4) port map (A,B,GRT);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		A <= x"A";	B <= x"A";
		wait for 100 ns;
		assert (GRT = '0') 
			report "FAILURE: GRT does not equal expected value." 
			severity failure;
			
		A <= x"A";	B <= x"F";
		wait for 100 ns;
		assert (GRT = '0') 
			report "FAILURE: GRT does not equal expected value." 
			severity failure;
			
		A <= x"C";	B <= x"2";
		wait for 100 ns;
		assert (GRT = '1') 
			report "FAILURE: GRT does not equal expected value." 
			severity failure;
			
		A <= x"3";	B <= x"C";
		wait for 100 ns;
		assert (GRT = '0') 
			report "FAILURE: GRT does not equal expected value." 
			severity failure;
			
		A <= x"a";	B <= x"5";
		wait for 100 ns;
		assert (GRT = '1') 
			report "FAILURE: GRT does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;

end Behavioral;

