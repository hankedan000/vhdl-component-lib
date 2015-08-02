----------------------------------------------------------------------------
-- Entity:        CMOS_74hc181
-- Written By:    Daniel Hankewycz
-- Date Created:  5/6/2015
-- Description:   A direct implementation of the 74hc181 4bit ALU
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CMOS_74hc181 is
    Port ( 	A_n		:	in		STD_LOGIC_VECTOR(3 downto 0);
				B_n		:	in		STD_LOGIC_VECTOR(3 downto 0);
				Op			:	in		STD_LOGIC_VECTOR(3 downto 0);
				Cin		:	in		STD_LOGIC;
				M			:	in		STD_LOGIC;
				
				F_n		:	out	STD_LOGIC_VECTOR(3 downto 0);
				G_n		:	out	STD_LOGIC;
				P_n		:	out	STD_LOGIC;
				EQU		:	out	STD_LOGIC;
				Cout		:	out	STD_LOGIC);
end CMOS_74hc181;

architecture behavioral of CMOS_74hc181 is
-- intermediate signals
signal D,E,H,I,J,K,L,N,O,Q,R,S,T,U,V,W,X,F3,F2,F1,F0	:	STD_LOGIC;

begin
		D <= (B_n(3) and Op(3) and A_n(3)) nor (A_n(3) and Op(2) and not B_n(3));
		E <= not ((not B_n(3) and Op(1)) or (Op(0) and B_n(3)) or A_n(3));
		H <= (B_n(2) and Op(3) and A_n(2)) nor (A_n(2) and Op(2) and not B_n(2));
		I <= not ((not B_n(2) and Op(1)) or (Op(0) and B_n(2)) or A_n(2));
		J <= (B_n(1) and Op(3) and A_n(1)) nor (A_n(1) and Op(2) and not B_n(1));
		K <= not ((not B_n(1) and Op(1)) or (Op(0) and B_n(1)) or A_n(1));
		L <= (B_n(0) and Op(3) and A_n(0)) nor (A_n(0) and Op(2) and not B_n(0));
		N <= not ((not B_n(0) and Op(1)) or (Op(0) and B_n(0)) or A_n(0));
		X <= Cin nand not M;
		W <= not N and L;
		U <= not K and J;
		S <= not I and H;
		Q <= not E and D;
		V <= (Cin and L and not M) nor (N and not M);
		T <= not ((J and L and Cin and not M) or (J and N and not M) or (K and not M));
		R <= not ((H and J and L and Cin and not M) or (H and J and N and not M) or (H and K and not M) or (I and not M));
		O <= not (E or (D and I) or (D and H and K) or (D and H and J and N));
		G_n <= not O;
		Cout <= not O nor (D and H and J and L and Cin);
		P_n <= not (D and H and J and L);
		F3 <= Q xor R;
		F2 <= S xor T;
		F1 <= U xor V;
		F0 <= W xor X;
		EQU <= F3 and F2 and F1 and F0;
		F_n(3) <= F3;
		F_n(2) <= F2;
		F_n(1) <= F1;
		F_n(0) <= F0;
end behavioral;