----------------------------------------------------------------------------
-- Entity:        Pulse_Gen_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/18/2014
-- Description:   VHDL test bench for Pulse_Gen
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
-- 	Pulse_Gen
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Pulse_Gen_tb is
end    Pulse_Gen_tb;
----------------------------------------------------------------------------

architecture Behavioral of Pulse_Gen_tb is

	-- Unit Under Test (UUT)
	component Pulse_Gen is
	generic (n:integer:=8);
		 Port ( 	CNT	:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					CLR	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					
					Q		:	out	STD_LOGIC);
	end component;

   --Inputs
   signal CNT    		: STD_LOGIC_VECTOR (7 downto 0)	:= x"08";
	signal CLR			: STD_LOGIC := '0';
   signal EN    		: STD_LOGIC	:= '0';
	signal CLK			: STD_LOGIC	:= '0';

 	--Outputs
   signal Q		 		: STD_LOGIC;
	
begin

	-- Instantiate the Unit Under Test (UUT)
   PULSE: Pulse_Gen generic map(n => 8) port map (CNT,CLR,EN,CLK,Q);

   -- Stimulus process
   stim_proc: process
   begin		
		CLR <= '0';
		wait for 50 ns;
		CLR <= '0';		EN <= '1';
		wait for 150 ns;
		CLR <= '0';
		wait for 500 ns;
		
      wait;
		
   end process;
	
	CLK	<= not CLK after 5 ns;

end Behavioral;

