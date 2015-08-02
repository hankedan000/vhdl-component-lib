----------------------------------------------------------------------------
-- Entity:        AdderSubtractor_4bit_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   VHDL test bench for AdderSubtractor_4bit
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   AdderSubtractor_4bit
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity AdderSubtractor_4bit_tb is
end    AdderSubtractor_4bit_tb;
----------------------------------------------------------------------------

architecture Behavioral of AdderSubtractor_4bit_tb is

	-- Unit Under Test (UUT)
	component AdderSubtractor_4bit is
		Port ( A    		: in  STD_LOGIC_VECTOR (3 downto 0);
				 B   			: in  STD_LOGIC_VECTOR (3 downto 0);
				 SUBTRACT	: in  STD_LOGIC;
				 
				 OVERFLOW	: out STD_LOGIC;
				 SUM 			: out STD_LOGIC_VECTOR (3 downto 0));
	end component AdderSubtractor_4bit;

   --Inputs
   signal A    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";
   signal B    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";
   signal SUBTRACT 	: STD_LOGIC								:= '0';

 	--Outputs
   signal OVERFLOW 	: STD_LOGIC;
   signal SUM   		: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   ADDSUB: AdderSubtractor_4bit port map (
          A     		=> A,
          B     		=> B,
          SUBTRACT  	=> SUBTRACT,
			 
          OVERFLOW 	=> OVERFLOW,
          SUM  		=> SUM
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		A <= x"0";   B <= x"0";   SUBTRACT <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0' and SUM = x"0") 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
			
		A <= x"0";   B <= x"F";   SUBTRACT <= '0';
		wait for 100 ns;
		assert (OVERFLOW = '0' and SUM = x"F") 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
			
		A <= x"5";   B <= x"3";   SUBTRACT <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0' and SUM = x"2") 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
			
		A <= x"A";   B <= x"3";   SUBTRACT <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0' and SUM = x"7") 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
		
		A <= x"0";   B <= x"0";   SUBTRACT <= '1';
		wait for 100 ns;
		assert (OVERFLOW = '0' and SUM = "X") 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;

end Behavioral;

