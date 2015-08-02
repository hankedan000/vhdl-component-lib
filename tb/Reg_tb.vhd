----------------------------------------------------------------------------
-- Entity:        Reg_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/17/2014
-- Description:   VHDL test bench for Reg
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   Reg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Reg_tb is
end    Reg_tb;
----------------------------------------------------------------------------

architecture Behavioral of Reg_tb is

	-- Unit Under Test (UUT)
	component Reg is
	generic (n:integer:=8);
		 Port ( 	D			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					LOAD		:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

   --Inputs
   signal D    		: STD_LOGIC_VECTOR (7 downto 0) 	:= x"F0";
	signal LOAD    	: STD_LOGIC								:= '0';
	signal CLK   	 	: STD_LOGIC								:= '0';
	signal CLR	    	: STD_LOGIC								:= '0';

 	--Outputs
   signal Q    		: STD_LOGIC_VECTOR (7 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   REGTB: Reg generic map(n => 8) port map (D,LOAD,CLK,CLR,Q);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		CLR <= '1';
		wait for 100 ns;
		assert (Q = x"00") 
			report "FAILURE: Q does not equal expected value." 
			severity failure;
			
		CLR <= '0';		LOAD <= '1';	D <= x"55";
		wait for 100 ns;
		assert (Q = x"55") 
			report "FAILURE: Q does not equal expected value." 
			severity failure;
			
		CLR <= '0';		LOAD <= '0';	D <= x"FF";
		wait for 100 ns;
		assert (Q = x"55") 
			report "FAILURE: Q does not equal expected value." 
			severity failure;
			
		CLR <= '0';		LOAD <= '1';	D <= x"AA";
		wait for 100 ns;
		assert (Q = x"AA") 
			report "FAILURE: Q does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;
	
	-- Clock
	CLK <= not CLK after 10 ns;

end Behavioral;

