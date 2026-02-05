--Main Prog KKS

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_tb is
-- Port ();
end top_level_tb;

architecture Behavorial of top_level_tb is

	component top_level is
		port (
			clk_in     : in std_logic; -- 50 mhz clock
			KEY0       : in std_logic; -- key 0
			KEY1       : in std_logic; -- key 1
			KEY2       : in std_logic; -- key 2
			KEY3       : in std_logic; -- key 3
			LCD_Data   : out std_logic_vector(7 downto 0); -- lcd data out, sent from top level state machine? 
			LCD_EN     : out std_logic; -- lcd data is writing or not (enable writing) 
			LCD_RS     : out std_logic; -- lcd either command ('0') or data ('1')
			SRAM_DQ    : inout std_logic_vector(15 downto 0); -- SRAM data in/out bus
			SRAM_addr  : out std_logic_vector(19 downto 0); -- SRAM addy
			SRAM_WR_EN : out std_logic; --  sram write enable, only used on INIT
			SRAM_OE_N  : out std_logic; -- SRAM output enable, used everywhere else( reading)
			SRAM_CE_N  : out std_logic;
			SRAM_UB_N  : out std_logic;
			SRAM_LB_N  : out std_logic;	
			PWM_out    : out std_logic
		);
	end component;

	signal clock 	: std_logic := '0';
	signal reset_n : std_logic;
	signal Key1    : std_logic;
	signal Key2    : std_logic;
	signal Key3    : std_logic;
	signal cnt_en  : std_logic;
	signal input 	: std_logic_vector(3 downto 0);
	signal output 	: std_logic;
	
begin

	DUT: Top_Level
		port map(
			clk_in     => clock,
			KEY0       => reset_n,
			KEY1       => Key1,
			KEY2       => Key2,
			KEY3       => Key3,
--			LCD_Data   : out std_logic_vector(7 downto 0); -- lcd data out, sent from top level state machine? 
--			LCD_EN     : out std_logic; -- lcd data is writing or not (enable writing) 
--			LCD_RS     : out std_logic; -- lcd either command ('0') or data ('1')
--			SRAM_DQ    : inout std_logic_vector(15 downto 0); -- SRAM data in/out bus
--			SRAM_addr  : out std_logic_vector(19 downto 0); -- SRAM addy
--			SRAM_WR_EN : out std_logic; --  sram write enable, only used on INIT
--			SRAM_OE_N  : out std_logic; -- SRAM output enable, used everywhere else( reading)
--			SRAM_CE_N  : out std_logic;
--			SRAM_UB_N  : out std_logic;
--			SRAM_LB_N  : out std_logic;	
			PWM_out    => output
		);
		
	clock <= not clock after 10 ns;
	
	process
		begin
		reset_n <= '1';
		wait for 180 ns;
		--
		
		wait for 100 ns;
		
		
		wait;
		
	end process;
	
end Behavorial;