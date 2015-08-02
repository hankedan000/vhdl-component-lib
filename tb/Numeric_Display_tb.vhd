----------------------------------------------------------------------------
-- Entity:        Numeric_Display_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/18/2014
-- Description:   VHDL test bench for Numeric_Display
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
-- 	Numeric_Display
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Numeric_Display_tb is
end    Numeric_Display_tb;
----------------------------------------------------------------------------

architecture Behavioral of Numeric_Display_tb is

	-- Unit Under Test (UUT)
	component Numeric_Display is
		 Port ( 	NUM		:	in		STD_LOGIC_VECTOR	(31 downto 0);
					MASK		:	in		STD_LOGIC_VECTOR	(7 downto 0);
					EN			:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
				
					SEGMENT	:	out	STD_LOGIC_VECTOR	(6 downto 0);
					AN			:	out	STD_LOGIC_VECTOR	(7 downto 0));
	end component;

   --Inputs
	signal MASK			: STD_LOGIC_VECTOR (7 downto 0)	:= x"F5";
   signal NUM    		: STD_LOGIC_VECTOR (31 downto 0)	:= x"F5FAC0D0";
   signal EN    		: STD_LOGIC	:= '0';
	signal CLK			: STD_LOGIC	:= '0';

 	--Outputs
   signal SEGMENT    : STD_LOGIC_VECTOR (6 downto 0);
	signal AN    		: STD_LOGIC_VECTOR (7 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   DISP: Numeric_Display port map (NUM,MASK,EN,CLK,SEGMENT,AN);

   -- Stimulus process
   stim_proc: process
   begin		
		EN <= '0';
		wait for 50 ns;
		EN <= '1';
		wait for 1000 ns;
		
      wait;
		
   end process;
	
	CLK	<= not CLK after 1 ns;
	MASK	<= x"FF";

end Behavioral;

