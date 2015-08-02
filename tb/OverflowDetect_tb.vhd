----------------------------------------------------------------------------
-- Entity:        OverflowDetect_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   VHDL test bench for OverflowDetect
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   OverflowDetect
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity OverflowDetect_tb is
end    OverflowDetect_tb;
----------------------------------------------------------------------------

architecture Behavioral of OverflowDetect_tb is

	-- Unit Under Test (UUT)
	component OverflowDetect is
		Port ( 	SUBTRACT	:	in		STD_LOGIC;
					A_MSB		:	in		STD_LOGIC;
					B_MSB		:	in		STD_LOGIC;
					SUM_MSB	:	in		STD_LOGIC;
			  
					OVERFLOW	: 	out	STD_LOGIC);
	end component OverflowDetect;

   --Inputs
   signal SUBTRACT 		: STD_LOGIC		:= '0';
	signal A_MSB 			: STD_LOGIC		:= '0';
	signal B_MSB 			: STD_LOGIC		:= '0';
	signal SUM_MSB 		: STD_LOGIC		:= '0';

 	--Outputs
   signal OVERFLOW 		: STD_LOGIC;
	
begin

	-- Instantiate the Unit Under Test (UUT)
   OVRFLW: OverflowDetect port map (
          SUBTRACT  	=> SUBTRACT,
			 A_MSB     	=> A_MSB,
          B_MSB     	=> B_MSB,
			 SUM_MSB		=> SUM_MSB,
			 
          OVERFLOW 	=> OVERFLOW
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		SUBTRACT <= '0';	A_MSB <= '0';   B_MSB <= '0';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '0';	A_MSB <= '0';   B_MSB <= '0';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '1') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '0';	A_MSB <= '0';   B_MSB <= '1';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '0';	A_MSB <= '0';   B_MSB <= '1';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '0';	A_MSB <= '1';   B_MSB <= '0';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '0';	A_MSB <= '1';   B_MSB <= '0';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '0';	A_MSB <= '1';   B_MSB <= '1';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '1') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '0';	A_MSB <= '1';   B_MSB <= '1';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '0';   B_MSB <= '0';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '0';   B_MSB <= '0';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '0';   B_MSB <= '1';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '0';   B_MSB <= '1';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '1') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '1';   B_MSB <= '0';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '1') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '1';   B_MSB <= '0';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '1';   B_MSB <= '1';		SUM_MSB <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		SUBTRACT <= '1';	A_MSB <= '1';   B_MSB <= '1';		SUM_MSB <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0') 
			report "FAILURE: OVERFLOW does not equal expected value." 
			severity failure;
		
		
      wait;
		
   end process;

end Behavioral;

