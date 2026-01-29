--main prog J.S. 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;
	
entity PWM_Cnt is
	port(
		iClk					: in std_logic;
		Enable				: in std_logic;
		Reset 				: in std_logic;
		Load              : in std_logic;
		Cnt               : out std_logic_vector(7 downto 0)
	);
end PWM_Cnt;

architecture Structural of PWM_Cnt is

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

-- End of Component Declarations

	signal Cnt_En   :std_logic;

begin

	
-- start instanceations
	inst_PWM_cnt : univ_bin_counter
   port map(
			clk                     => iCLK, 
			reset				         => Reset,
			syn_clr                 => Reset, 
			load                    => '0', 
			en                      => Enable, 
			up	                     => '1',
			clk_en 					   => open,			
			d						      =>(others => '0'),
			max_tick                => open, 
			min_tick		            => open,
			q						      => Cnt		
   );
	
-- end of instanceations 
	process(iClk)

	begin 
	
	end process;	

end Structural;