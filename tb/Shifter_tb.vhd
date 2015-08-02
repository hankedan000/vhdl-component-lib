----------------------------------------------------------------------------
-- Entity:        Shifter_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/24/2014
-- Description:   VHDL test bench for Shifter
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   Shifter
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Shifter_tb is
end    Shifter_tb;
----------------------------------------------------------------------------

architecture Behavioral of Shifter_tb is

	-- Unit Under Test (UUT)
	component Shifter is
	generic (n:integer:=8);
		 Port ( 	D			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					LOAD		:	in		STD_LOGIC;
					SHIFT		:	in		STD_LOGIC;
					ROTATE	:	in 	STD_LOGIC;
					LEFT		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

   --Inputs
   signal D    		: STD_LOGIC_VECTOR (7 downto 0) := "01000000";
	signal LOAD    	: STD_LOGIC				:= '0';
	signal SHIFT		: STD_LOGIC				:= '0';
	signal ROTATE		: STD_LOGIC				:= '0';
	signal LEFT			: STD_LOGIC				:= '0';
	signal CLR	    	: STD_LOGIC				:= '0';
	signal CLK   	 	: STD_LOGIC				:= '0';

 	--Outputs
   signal Q    		: STD_LOGIC_VECTOR (7 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   SHIFTER0: Shifter generic map(n => 8) port map (D,LOAD,SHIFT,ROTATE,LEFT,CLR,CLK,Q);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 150 ns;
		
		CLR <= '1';
		wait for 20 ns;
		CLR <= '0';	LOAD <= '1';
		wait for 10 ns;
		LOAD <= '0';
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		
		-- Shift Left
		LEFT <= '1';
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		
		ROTATE <= '1';
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		
		-- Shift Left
		LEFT <= '1';
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		shift <= '1';
		wait for 10 ns;
		shift <= '0';
		wait for 20 ns;
		
      wait;
		
   end process;
	
	-- Clock
	CLK <= not CLK after 5 ns;

end Behavioral;

