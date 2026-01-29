--main prog J.S.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;
	
entity PWM_TL is
	port(
		iClk					: in std_logic; 
		Reset  				: in std_logic;
		iData             : in std_logic_vector (7 downto 0);
		oPWM              : out std_logic
	);
end PWM_TL;

architecture Structural of PWM_TL is

--Component Declarations 
component univ_bin_counter is
   generic(N: integer := 8; N2: integer := 255; N1: integer := 0);
   port(
			clk, reset				   : in std_logic;
			syn_clr, load, en, up	: in std_logic;
			clk_en 					   : in std_logic := '1';			
			d						      : in std_logic_vector(N-1 downto 0);
			max_tick, min_tick		: out std_logic;
			q						      : out std_logic_vector(N-1 downto 0)		
   );
end component;

component PWM_reg is
	port(
		iClk					: in std_logic;
		X                 : in std_logic_vector(7 downto 0);
		Load  				: in std_logic;
		num               : out std_logic_vector(7 downto 0) --num is y from Fig.11
	);
end component;

component PWM_Comparator is
	port(
		iClk					: in std_logic; 
		A                 : in std_logic_vector(7 downto 0);
		B                 : in std_logic_vector(7 downto 0);
		C                 : out std_logic
	);
end component;

component RS_latch is
	port(
		iClk					: in std_logic; 
		R      				: in std_logic;
		S                 : in std_logic;
		q                 : out std_logic
	);
end component;
-- End of Component Declarations

--Signals
	signal Cnt_En   :std_logic:= '1';
	signal Load     :std_logic;
	signal R        :std_logic;
	signal Cnt      :std_logic_vector(7 downto 0);
	signal A        :std_logic_vector(7 downto 0);
--end of Signals
begin
	
	-- start instanceations
	inst_PWM_cnt : univ_bin_counter
   port map(
			clk                     => iCLK, 
			reset				         => Reset,
			syn_clr                 => Reset, 
			load                    => '0', 
			en                      => Cnt_En, 
			up	                     => '1',
			clk_en 					   => open,			
			d						      =>(others => '0'),
			max_tick                => open, 
			min_tick		            => open,
			q						      => Cnt		
   );
	
	inst_PWM_reg : PWM_reg
   port map(
			iClk					=> iClk,
			X                 => Cnt,
			Load  				=> Load,
			num               => A
   );
	
inst_PWM_comp : PWM_Comparator
   port map(
			iClk					=> iClk, 
			A                 => A,
			B                 => Cnt,
			C                 => R
   );

inst_PWM_RS_latch : RS_latch
   port map(
			iClk					=> iClk, 
			R      				=> R,
			S                 => Load,
			q                 => oPWM
   );
	
-- end of instanceations 

process(iClk)

	begin 
	
	end process;	

end Structural;