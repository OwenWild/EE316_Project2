--main prog J.S.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;
	--This file is the brain of the operation all you need to do is instance this and let it run.
entity PWM_TL is
   generic(DataS: integer := 8; Cnt2: integer := 255; en_time: integer := 49999999);
	-- DataS  : controls the vector size of the data being let in to the PWM.
	-- Cnt2   : is the number the counter will count to.
	-- en_time: is the number the count enabler will count to. 
	port(
		iClk					: in std_logic; 
		Reset  				: in std_logic;
		iClk_en				: in std_logic;
		iData             : in std_logic_vector (DataS-1 downto 0);
		Scream_Pain       : out std_logic;
		oPWM              : out std_logic
	);
end PWM_TL;

architecture Structural of PWM_TL is

--Component Declarations 
component clk_enable is
	generic(lenght: integer := en_time);
	port(
		iClk					: in std_logic;
		Enable				: in std_logic;
		clk_en            : out std_logic
	);
end component;

component univ_bin_counter is
   generic(N: integer := DataS; N2: integer := Cnt2; N1: integer := 0);
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
	generic(N: integer := DataS); 
	port(
		iClk					: in std_logic; 
		X                 : in std_logic_vector(N-1 downto 0);
		Load  				: in std_logic;
		num               : out std_logic_vector(N-1 downto 0) --num is y from Fig.11
	);
end component;

component PWM_Comparator is
	generic(N: integer := DataS);
	port(
		iClk					: in std_logic; 
		MODE              : in std_logic_vector(1 downto 0);
		A                 : in std_logic_vector(N-1 downto 0);
		B                 : in std_logic_vector(N-1 downto 0);
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
	signal Max_Load :std_logic;
	signal en_clk   :std_logic:= '0';
	signal clk_en   :std_logic;
	signal R        :std_logic;
	signal Cnt      :std_logic_vector(DataS-1 downto 0);
	signal A        :std_logic_vector(DataS-1 downto 0);
--end of Signals
begin
	en_clk      <= iClk_en;
	Scream_Pain <= Max_Load;
	
	-- start instanceations
	inst_PWM_clken : clk_enable
	generic map(lenght => en_time)
	port map(
		iClk					=> iClk,
		Enable				=> en_clk,
		clk_en            => clk_en
	);
	
	inst_PWM_cnt : univ_bin_counter
	generic map(N => DataS, N2 => Cnt2)
   port map(
			clk                     => iCLK, 
			reset				         => Reset,
			syn_clr                 => Reset, 
			load                    => '0', 
			en                      => Cnt_En, 
			up	                     => '1',
			clk_en 					   => clk_en,			
			d						      =>(others => '0'),
			max_tick                => Max_Load, 
			min_tick		            => open,
			q						      => Cnt		
   );
	
	inst_PWM_reg : PWM_reg
	generic map(N => DataS)
   port map(
			iClk					=> iClk,
			X                 => iData,
			Load  				=> Max_Load,
			num               => A
   );
	
inst_PWM_comp : PWM_Comparator
	generic map(N => DataS)
   port map(
			iClk					=> iClk,
			MODE              => "01",
			A                 => A,
			B                 => Cnt,
			C                 => R
   );

inst_PWM_RS_latch : RS_latch
   port map(
			iClk					=> iClk, 
			R      				=> Reset,
			S                 => R,
			q                 => oPWM
   );
	
-- end of instanceations 

process(iClk)

	begin 
	
	end process;	

end Structural;