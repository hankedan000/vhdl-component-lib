----------------------------------------------------------------------------
-- Entity:        SIPO_Reg_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   VHDL test bench for SIPO_Reg
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   SIPO_Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity SIPO_Reg_tb is
end    SIPO_Reg_tb;
----------------------------------------------------------------------------

architecture Behavioral of SIPO_Reg_tb is

	-- Unit Under Test (UUT)
	component SIPO_Reg is
	generic (n:integer:=8);
		 Port ( 	D			:	in		STD_LOGIC;
					LOAD		:	in		STD_LOGIC;
					LSB_FIRST:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

   --Inputs
   signal D    		: STD_LOGIC			 	:= '0';
	signal LOAD    	: STD_LOGIC				:= '0';
	signal LSB_FIRST	: STD_LOGIC				:= '1';
	signal CLK   	 	: STD_LOGIC				:= '0';
	signal CLR	    	: STD_LOGIC				:= '0';

 	--Outputs
   signal Q    		: STD_LOGIC_VECTOR (15 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   SIPO_TB: SIPO_Reg generic map(n => 16) port map (D,LOAD,LSB_FIRST,CLK,CLR,Q);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 150 ns;
		
		CLR <= '1';
		wait for 20 ns;
		CLR <= '0'; D <= '1';	LOAD <= '1';
		wait for 10 ns;
		D <= '0';
		wait for 120 ns;
		LSB_FIRST <= '0';
		wait for 120 ns;
		
      wait;
		
   end process;
	
	-- Clock
	CLK <= not CLK after 5 ns;

end Behavioral;

