----------------------------------------------------------------------------
-- Entity:        TFF_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/20/2014
-- Description:   VHDL test bench for TFF
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   TFF
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity TFF_tb is
end    TFF_tb;
----------------------------------------------------------------------------

architecture Behavioral of TFF_tb is

	-- Unit Under Test (UUT)
	component TFF is
		 Port ( 	TOG		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC);
	end component;

   --Inputs
	signal TOG    		: STD_LOGIC								:= '0';
	signal CLR   	 	: STD_LOGIC								:= '0';
	signal CLK	    	: STD_LOGIC								:= '0';

 	--Outputs
   signal Q    		: STD_LOGIC;
	
begin

	-- Instantiate the Unit Under Test (UUT)
   FLIPFLOP: TFF port map (TOG,CLR,CLK,Q);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		CLR <= '1';
		wait for 50 ns;
		CLR <= '0';
      wait;
		
   end process;
	
	-- Clock
	TOG <= not TOG after 50 ns;
	CLK <= not CLK after 10 ns;

end Behavioral;

