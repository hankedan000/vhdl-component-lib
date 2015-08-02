----------------------------------------------------------------------------
-- Entity:        Decoder3to8_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/11/2014
-- Description:   VHDL test bench for Decoder3to8
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   Mux4to1_4bit
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

----------------------------------------------------------------------------
entity Decoder3to8_tb is
end    Decoder3to8_tb;
----------------------------------------------------------------------------

architecture Behavioral of Decoder3to8_tb is

	-- Unit Under Test (UUT)

   --Inputs
   signal X 	: STD_LOGIC_VECTOR (2 downto 0)	:=	"000";
	signal EN 	: STD_LOGIC								:= '1';

 	--Outputs
   signal Y   	: STD_LOGIC_VECTOR (7 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   DEC: Decoder3to8 port map (X,EN,Y);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		EN <= '0';	X <= "010";
		wait for 100 ns;
		assert (Y = "00000000") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "000";
		wait for 100 ns;
		assert (Y = "00000001") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "001";
		wait for 100 ns;
		assert (Y = "00000010") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "010";
		wait for 100 ns;
		assert (Y = "00000100") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "011";
		wait for 100 ns;
		assert (Y = "00001000") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "100";
		wait for 100 ns;
		assert (Y = "00010000") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "101";
		wait for 100 ns;
		assert (Y = "00100000") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "110";
		wait for 100 ns;
		assert (Y = "01000000")
			report "FAILURE: Y does not equal expected value." 
			severity failure;
			
		EN <= '1';	X <= "111";
		wait for 100 ns;
		assert (Y = "10000000") 
			report "FAILURE: Y does not equal expected value." 
			severity failure;
		
   end process;

end Behavioral;

