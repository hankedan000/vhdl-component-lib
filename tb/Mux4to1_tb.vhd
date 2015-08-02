----------------------------------------------------------------------------
-- Entity:        Mux4to1_4bit_tb
-- Written By:    Daniel Hankewycz & Robby Brague
-- Date Created:  9/4/2014
-- Description:   VHDL test bench for Mux4to1_4bit
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--   Mux4to1_4bit
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity Mux4to1_4bit_tb is
end    Mux4to1_4bit_tb;
----------------------------------------------------------------------------

architecture Behavioral of Mux4to1_4bit_tb is

	-- Unit Under Test (UUT)
	component Mux4to1_4bit is
		Port ( 	X0		: in  STD_LOGIC_VECTOR (3 downto 0);
					X1		: in  STD_LOGIC_VECTOR (3 downto 0);
					X2		: in  STD_LOGIC_VECTOR (3 downto 0);
					X3		: in  STD_LOGIC_VECTOR (3 downto 0);
					SEL	: in  STD_LOGIC_VECTOR (1 downto 0);
				 
					Y		: out STD_LOGIC_VECTOR (3 downto 0));
	end component Mux4to1_4bit;

   --Inputs
   signal X0 	: STD_LOGIC_VECTOR (3 downto 0)		:= x"0";
	signal X1 	: STD_LOGIC_VECTOR (3 downto 0)		:= x"1";
   signal X2 	: STD_LOGIC_VECTOR (3 downto 0)		:= x"2";
	signal X3 	: STD_LOGIC_VECTOR (3 downto 0)		:= x"3";
	signal SEL 	: STD_LOGIC_VECTOR (1 downto 0)		:= "00";

 	--Outputs
   signal Y   	: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Instantiate the Unit Under Test (UUT)
   MUX: Mux4to1_4bit port map (
          X0     	=> X0,
			 X1     	=> X1,
          X2     	=> X2,
			 X3     	=> X3,
          SEL     => SEL,
			 
          Y			=> Y
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		SEL <= "00";
		wait for 100 ns;
		assert (Y = X0) 
			report "FAILURE: SEL does not equal expected value." 
			severity failure;
		
		SEL <= "01";
		wait for 100 ns;
		assert (Y = X1) 
			report "FAILURE: SEL does not equal expected value." 
			severity failure;
		
		SEL <= "10";
		wait for 100 ns;
		assert (Y = X2) 
			report "FAILURE: SEL does not equal expected value." 
			severity failure;
		
		SEL <= "11";
		wait for 100 ns;
		assert (Y = X3) 
			report "FAILURE: SEL does not equal expected value." 
			severity failure;
		
      wait;
		
   end process;

end Behavioral;

