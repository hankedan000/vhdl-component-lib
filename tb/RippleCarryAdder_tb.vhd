----------------------------------------------------------------------------
-- Entity:        RippleCarryAdder_4bit_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  8/27/2014
-- Description:   VHDL test bench for RippleCarryAdder_4bit
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   RippleCarryAdder_4bit
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity RippleCarryAdder_4bit_tb is
end    RippleCarryAdder_4bit_tb;
----------------------------------------------------------------------------

architecture Behavioral of RippleCarryAdder_4bit_tb is

	-- Unit Under Test (UUT)
	component RippleCarryAdder_4bit is
		Port ( 	A		:	in  STD_LOGIC_VECTOR (3 downto 0);
					B		:	in  STD_LOGIC_VECTOR (3 downto 0);
					C_in	:	in  STD_LOGIC;
			  
					C_out	: 	out  STD_LOGIC;
					SUM	: 	out  STD_LOGIC_VECTOR (3 downto 0));
	end component RippleCarryAdder_4bit;

   --Inputs
   signal A    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";
   signal B    		: STD_LOGIC_VECTOR (3 downto 0) 	:= x"0";
   signal C_in		 	: STD_LOGIC								:= '0';

 	--Outputs
   signal C_out	 	: STD_LOGIC;
   signal SUM   		: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   RIPPL: RippleCarryAdder_4bit port map (
          A     		=> A,
          B     		=> B,
          C_in  	=> C_in,
			 
          C_out 	=> C_out,
          SUM  		=> SUM
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		A <= x"F";   B <= x"0";   C_in <= '0';
		wait for 100 ns;
		assert (C_out = '0' and SUM = x"F") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
		A <= x"F";   B <= x"0";   C_in <= '1';
		wait for 100 ns;
		assert (C_out = '1' and SUM = x"0") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
		A <= x"0";   B <= x"F";   C_in <= '0';
		wait for 100 ns;
		assert (C_out = '0' and SUM = x"F") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
		A <= x"0";   B <= x"F";   C_in <= '1';
		wait for 100 ns;
		assert (C_out = '1' and SUM = x"0") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
		A <= x"A";   B <= x"F";   C_in <= '0';
		wait for 100 ns;
		assert (C_out = '1' and SUM = x"9") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
		
		A <= x"A";   B <= x"5";   C_in <= '1';
		wait for 100 ns;
		assert (C_out = '1' and SUM = x"0") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;

end Behavioral;

