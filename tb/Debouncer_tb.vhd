----------------------------------------------------------------------------
-- Entity:        Debouncer_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/20/2014
-- Description:   VHDL test bench for Debouncer
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
-- 	Debouncer
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Debouncer_tb is
end    Debouncer_tb;
----------------------------------------------------------------------------

architecture Behavioral of Debouncer_tb is

	-- Unit Under Test (UUT)
	component Debouncer is
	generic (n				:integer	:=8;
				delay_width	:integer	:=8);
	Port (	D		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				CNT	:	in		STD_LOGIC_VECTOR (delay_width-1 downto 0);
				CLK	:	in		STD_LOGIC;
					
				Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

   --Inputs
	signal D				: STD_LOGIC_VECTOR (7 downto 0)	:= x"00";
   signal CNT    		: STD_LOGIC_VECTOR (3 downto 0)	:= x"4";
   signal CLK    		: STD_LOGIC	:= '0';

 	--Outputs
   signal Q		 		: STD_LOGIC_VECTOR (7 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   DEBOUNCE: Debouncer generic map(n => 8, delay_width => 4) port map (D,CNT,CLK,Q);

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 ns;
		D <= x"FF";
		wait for 10  ns;
		D <= x"55";
		wait for 10	 ns;
		D <= x"FF";
		wait for 25	 ns;
		wait for 500 ns;
		
      wait;
		
   end process;
	
	CLK	<= not CLK after 5 ns;

end Behavioral;

