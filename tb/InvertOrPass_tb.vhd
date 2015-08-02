----------------------------------------------------------------------------
-- Entity:        InvertOrPass_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   VHDL test bench for InvertOrPass
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   InvertOrPass
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity InvertOrPass_tb is
end    InvertOrPass_tb;
----------------------------------------------------------------------------

architecture Behavioral of InvertOrPass_tb is

	-- Unit Under Test (UUT)
	component InvertOrPass is
		Port ( 	B			:	in		STD_LOGIC_VECTOR (3 downto 0);
					SUBTRACT	:	in		STD_LOGIC;
			  
					BXOR		: 	out	STD_LOGIC_VECTOR (3 downto 0));
	end component InvertOrPass;

   --Inputs
   signal B    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"A";
   signal SUBTRACT 	: STD_LOGIC								:= '0';

 	--Outputs
   signal BXOR  		: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   INVRT: InvertOrPass port map (
          B     		=> B,
          SUBTRACT  	=> SUBTRACT,
			 
          BXOR  		=> BXOR
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		B <= x"A";   SUBTRACT <= '0';
		wait for 100 ns;
		assert (BXOR = x"A") 
			report "FAILURE: BXOR does not equal expected value." 
			severity failure;
			
		B <= x"A";   SUBTRACT <= '1';
		wait for 100 ns;
		assert (BXOR = x"5") 
			report "FAILURE: BXOR does not equal expected value." 
			severity failure;
			
		B <= x"5";   SUBTRACT <= '0';
		wait for 100 ns;
		assert (BXOR = x"5") 
			report "FAILURE: BXOR does not equal expected value." 
			severity failure;
			
		B <= x"5";   SUBTRACT <= '1';
		wait for 100 ns;
		assert (BXOR = x"A") 
			report "FAILURE: BXOR does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;

end Behavioral;

