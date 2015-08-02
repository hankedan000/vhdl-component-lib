----------------------------------------------------------------------------
-- Entity:        djh5533_reb5427_Components
-- Written By:    Daniel Hankewycz and Robby Brague
-- Date Created:  11 Sep 14
-- Description:   Package definition for common components
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--  All components declared in this definition
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------
package djh5533_reb5427_Components is
	component CMOS_74hc181 is
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
	end component;

	component AdderSubtractor is
	generic (n:integer:=4);
		Port ( 	A			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
					B			:	in  	STD_LOGIC_VECTOR (n-1 downto 0);
					SUBTRACT	:	in  	STD_LOGIC;
				  
					OVERFLOW	: 	out	STD_LOGIC;
					SUM			: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Average4to1_4bit is
		Port ( 	A			:	in  	STD_LOGIC_VECTOR (3 downto 0);
					B			:	in  	STD_LOGIC_VECTOR (3 downto 0);
					C			:	in  	STD_LOGIC_VECTOR (3 downto 0);
					D			:	in  	STD_LOGIC_VECTOR (3 downto 0);
				  
					AVG			: 	out	STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component BCDAddSubSlice is
		 Port ( 	A			:	in		STD_LOGIC_VECTOR (3 downto 0);
					B			:	in		STD_LOGIC_VECTOR (3 downto 0);
					CBI		:	in		STD_LOGIC;
					SUB		:	in		STD_LOGIC;
					
					CBO		:	out	STD_LOGIC;
					SUM		:	out	STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component BCD_AddSub is
	generic (n:integer:=4);
		 Port ( 	A			:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
					B			:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
					CBI		:	in		STD_LOGIC;
					SUB		:	in		STD_LOGIC;
					
					CBO		:	out	STD_LOGIC;
					SUM		:	out	STD_LOGIC_VECTOR ((4*n)-1 downto 0));
	end component;
	
	component BCD_Multiplier is
	generic (n:integer:=4);
		Port(	A		:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
				B		:	in		STD_LOGIC_VECTOR ((4*n)-1 downto 0);
				EXE	:	in		STD_LOGIC;
				CLK	: 	in 	STD_LOGIC;
				
				MUL	:	out	STD_LOGIC_VECTOR ((8*n)-1 downto 0));
	end component;
	
	component Tri_Buffer is
	generic (n:integer:=8);
		 Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					OE_n		:	in		STD_LOGIC;
					
					Y			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Clock_Divided_Counter is
	generic (n				:integer	:=8;
				timer_width	:integer	:=8);
		Port (	CNT	:	in		STD_LOGIC_VECTOR (timer_width-1 downto 0);
					CLR	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					
					Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component CompareEQU is
	generic (n:integer:=4);
		Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					
					EQU		:	out	STD_LOGIC);
	end component;
	
	component CompareGRT is
	generic (n:integer:=4);
		Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					
					GRT		:	out	STD_LOGIC);
	end component;
	
	component CompareLES is
	generic (n:integer:=4);
		Port ( 	A			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					
					LES		:	out	STD_LOGIC);
	end component;
	
	component Counter is
	generic (n:integer:=8);
		Port ( 	CLR	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					
					Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Debouncer is
	generic (n				:integer	:=8;
				delay_width	:integer	:=8);
	Port (	D		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
				CNT	:	in		STD_LOGIC_VECTOR (delay_width-1 downto 0);
				CLK	:	in		STD_LOGIC;
					
				Q		:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Decoder3to8 is
		Port ( 	X			:	in		STD_LOGIC_VECTOR (2 downto 0);
					EN			:	in		STD_LOGIC;
				  
					Y			: 	out	STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component DFF is
	generic (n:integer:=8);
		 Port ( 	D			:	in		STD_LOGIC;
					EN			:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC);
	end component;
	
	component EdgeDetect is
		 Port ( 	D		:	in		STD_LOGIC;
					RISE	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
				
					Q		:	out	STD_LOGIC);
	end component;

	component FullAdder is
		port (	A     : in  STD_LOGIC;
					B     : in  STD_LOGIC;
					C_in  : in  STD_LOGIC;
					C_out : out STD_LOGIC;
					SUM   : out STD_LOGIC);
	end component;
	
	component HexToSevenSeg is
		Port ( 	HEX			:	in		STD_LOGIC_VECTOR (3 downto 0);
				  
					SEGMENT	: 	out	STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	component InvertOrPass is
	generic (n:integer:=4);
		Port ( 	B			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					SUBTRACT	:	in		STD_LOGIC;
				  
					BXOR		: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Numeric_Display is
		 Port ( 	NUM		:	in		STD_LOGIC_VECTOR	(31 downto 0);
					MASK		:	in		STD_LOGIC_VECTOR	(7 downto 0);
					EN			:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
				
					SEGMENT	:	out	STD_LOGIC_VECTOR	(6 downto 0);
					AN			:	out	STD_LOGIC_VECTOR	(7 downto 0));
	end component;
	
	component MaxMin4to1_4bit is
		Port ( 	A			:	in  	STD_LOGIC_VECTOR (3 downto 0);
					B			:	in  	STD_LOGIC_VECTOR (3 downto 0);
					C			:	in  	STD_LOGIC_VECTOR (3 downto 0);
					D			:	in  	STD_LOGIC_VECTOR (3 downto 0);
				  
					MAX			: 	out	STD_LOGIC_VECTOR (3 downto 0);
					MIN			: 	out	STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component Mux4to1 is
	generic (n:integer:=4);
		Port ( 	X0			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					X1			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					X2			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					X3			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					SEL		:	in		STD_LOGIC_VECTOR (1 downto 0);
				  
					Y			: 	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component OneShot is
		Port ( 	X		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					
					Y		:	out	STD_LOGIC);
	end component;
	
	component OverflowDetect is
		Port ( 	SUBTRACT	:	in		STD_LOGIC;
					A_MSB		:	in		STD_LOGIC;
					B_MSB		:	in		STD_LOGIC;
					SUM_MSB	:	in		STD_LOGIC;
				  
					OVERFLOW	: 	out	STD_LOGIC);
	end component;
	
	component Pulse_Gen is
	generic (n:integer:=8);
		Port ( 	CNT	:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					CLR	:	in		STD_LOGIC;
					EN		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					
					Q		:	out	STD_LOGIC);
	end component;
	
	component Pulse_Gen_Cnt_Out is
	generic (n:integer:=8);
		 Port ( 	CNT		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					CLR		:	in		STD_LOGIC;
					EN			:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC;
					CNT_OUT	:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component RAM_SxW is
		generic (S:integer:=256; W:integer:=8);
		Port ( 	ADDRESS		:	in		STD_LOGIC_VECTOR	(W-1 downto 0);
					DATA_IN		:	in		STD_LOGIC_VECTOR	(W-1 downto 0);
					WE				:	in		STD_LOGIC;
					CLK			:	in		STD_LOGIC;
					
					DATA_OUT		:	out	STD_LOGIC_VECTOR	(W-1 downto 0));
	end component;
	
	component Reg is
	generic (n:integer:=8);
		Port ( 	D			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					LOAD		:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

	component RippleCarryAdder is
	generic (n:integer:=4);
		port (	A     : in  STD_LOGIC_VECTOR (3 downto 0);
					B     : in  STD_LOGIC_VECTOR (3 downto 0);
					C_in  : in  STD_LOGIC;
					C_out : out STD_LOGIC;
					SUM   : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component Shifter is
	generic (n:integer:=8);
		 Port ( 	D			:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					LOAD		:	in		STD_LOGIC;
					SHIFT		:	in		STD_LOGIC;
					ROTATE	:	in		STD_LOGIC;
					LEFT		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component SIPO_Reg is
	generic (n:integer:=8);
		 Port ( 	D			:	in		STD_LOGIC;
					LOAD		:	in		STD_LOGIC;
					LSB_FIRST: 	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component TFF is
		 Port ( 	TOG		:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC);
	end component;
	
	component true_dpram_sclk is
		generic (S:integer:=256; aw:integer:=8; dw:integer:=8);
		port(	data_a	: in std_logic_vector(dw-1 downto 0);
				data_b	: in std_logic_vector(dw-1 downto 0);
				addr_a	: in std_logic_vector(aw-1 downto 0);
				addr_b	: in std_logic_vector(aw-1 downto 0);
				we_a		: in std_logic := '1';
				we_b		: in std_logic := '1';
				clk		: in std_logic;
				
				q_a		: out std_logic_vector(dw-1 downto 0);
				q_b		: out std_logic_vector(dw-1 downto 0));
	end component;
	
	component UpDown_Counter is
	generic (n:integer:=8);
		 Port ( 	CNT		:	in		STD_LOGIC_VECTOR (n-1 downto 0);
					SUBTRACT	:	in		STD_LOGIC;
					CLR		:	in		STD_LOGIC;
					CLK		:	in		STD_LOGIC;
					EN			:	in		STD_LOGIC;
					
					Q			:	out	STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

end djh5533_reb5427_Components;
----------------------------------------------------------------------------



----------------------------------------------------------------------------
package body djh5533_reb5427_Components is

end djh5533_reb5427_Components;
----------------------------------------------------------------------------
