----------------------------------------------------------------------------
-- Entity:        Clock_Divided_Counter_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/18/2014
-- Description:   VHDL test bench for Clock_Divided_Counter
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
-- 	Clock_Divided_Counter
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Clock_Divided_Counter_tb is
end    Clock_Divided_Counter_tb;
----------------------------------------------------------------------------

architecture Behavioral of Clock_Divided_Counter_tb is

	-- Unit Under Test (UUT)
	component Clock_Divided_Counter is
	generic (n			:integer	:=8;
				timer_width:integer	:=8);
		 Port (	CNT	:	in		STD_LOGIC_VECTOR (timer_width-1 downto 0);
					CLR	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
						
					Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

   --Inputs
	signal CNT			: STD_LOGIC_VECTOR (7 downto 0);
   signal CLR    		: STD_LOGIC	:= '0';
	signal EN			: STD_LOGIC := '0';
   signal CLK    		: STD_LOGIC	:= '0';

 	--Outputs
   signal Q		 		: STD_LOGIC_VECTOR (7 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   COUNT: Clock_Divided_Counter generic map(n => 8, timer_width => 8) port map (CNT,CLR,EN,CLK,Q);

   -- Stimulus process
   stim_proc: process
   begin		
		CNT <= x"0F";
		CLR <= '1';
		wait for 100 ns;
		CLR <= '1';		EN	<=	'1';
		wait for 100 ns;
		CLR <= '0';
		wait for 1000 ns;
		EN	<=	'0';
		wait for 100 ns;
		
      wait;
		
   end process;
	
	CLK	<= not CLK after 5 ns;

end Behavioral;

