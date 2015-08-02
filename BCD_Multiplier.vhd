----------------------------------------------------------------------------
-- Entity:        BCD_Multiplier
-- Written By:    Daniel hankewycz & Robby Brague
-- Date Created:  11/11/2014
-- Description:   BCD Multiplier
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		BCD_AddSub
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.ALL;
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;

entity BCD_Multiplier is
	generic (n:integer:=4);
	Port(	A		:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
			B		:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
			EXE	:	in		STD_LOGIC;
			CLK	: 	in 	STD_LOGIC;
			
			MUL	:	out	STD_LOGIC_VECTOR ((8*n)-1 downto 0));
end BCD_Multiplier;

architecture dataflow of BCD_Multiplier is
	
	signal a_init, b_mult, int_b, zero_chain		:	STD_LOGIC_VECTOR((4*n)-1 downto 0);
	signal pre_out, int_add, dec_shift		:	STD_LOGIC_VECTOR((8*n)-1 downto 0);
	signal int_cnt_end	:	STD_LOGIC_VECTOR(integer(ceil(log2(real(n))))-1 downto 0);
	signal int_cnt	:	STD_LOGIC_VECTOR(3 downto 0);
	signal cnt_cmp, done_cmp, end_cmp, fin, CLR			:	STD_LOGIC;
	
begin
	EXE_SHOT:	OneShot port map(
		X		=> EXE,
		CLK	=> CLK,
		
		Y		=> CLR);

	A_REG: Reg generic map (n=>n*4) port map(
		D		=> A,
		LOAD	=> CLR,
		CLR	=> '0',
		CLK	=> CLK,
		
		Q		=> a_init);
		
	zero_chain <= (others=>'0');
	
	ADDER: BCD_AddSub generic map(n=>2*n) port map(
		A		=> zero_chain&a_init,
		B		=> pre_out,
		CBI	=> '0',
		SUB	=> '0',
		
		CBO	=> open,
		SUM	=> int_add);
		
	dec_shift <=	pre_out((8*n)-5 downto 0)&x"0" when cnt_cmp='1' else
						int_add;
		
	b_mult <= 	int_b((4*n)-5 downto 0)&x"0" when CLR='0' else
					B;
					
	B_REG: Reg generic map (n=>n*4) port map(
		D		=> b_mult,
		LOAD	=> cnt_cmp or CLR,
		CLR	=> '0',
		CLK	=> CLK,
		
		Q		=> int_b);
		
	B_COUNT: Counter generic map (n=>4) port map(
		CLR	=> CLR or cnt_cmp,
		EN		=> '1',
		CLK	=> CLK,
		
		Q		=> int_cnt);
	
	End_COUNT: Counter generic map (n=>integer(ceil(log2(real(n))))) port map(
		CLR	=> CLR,
		EN		=> (CLR or cnt_cmp) and not end_cmp,
		CLK	=> CLK,
		
		Q		=> int_cnt_end);
		
	cnt_cmp <= 	'1' when unsigned(int_cnt)=unsigned(int_b((4*n)-1 downto (4*n)-4)) else
					'0';
	
	end_cmp <= 	'1' when to_integer(unsigned(int_cnt_end))=n-1 else
					'0';
					
	done_cmp <=	'1' when to_integer(unsigned(b_mult))=0 else
					'0';
					
	fin	<= not(end_cmp and cnt_cmp and done_cmp);
					
	RES_REG: Reg generic map(n=>(n*8)) port map(
		D		=> dec_shift,
		LOAD	=> CLR or fin,
		CLR	=> CLR,
		CLK	=> CLK,
		
		Q		=> pre_out);
		
	MUL <=	(others=>'0') when fin='1' else
				pre_out;
end dataflow;
