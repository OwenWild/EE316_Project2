LIBRARY ieee;
   USE ieee.std_logic_1164.all;

	
ENTITY top_level is 
	PORT (
		clk_in : in std_logic; -- 50 mhz clock
		KEY0 : in std_logic; -- key0
		KEY1 : in std_logic; -- key1
		KEY2 : in std_logic; -- key2
		KEY3 : in std_logic; -- key 3
		LCD_Data : out std_logic_vector(7 downto 0); -- lcd data out, sent from top level state machine? 
		LCD_EN : out std_logic; -- lcd data is writing or not (enable writing) 
		LCD_RS : out std_logic; -- lcd either command ('1') or data ('0')
		SRAM_DQ : inout std_logic_vector(15 downto 0); -- SRAM data in/out bus
		SRAM_addr : out std_logic_vector(19 downto 0); -- SRAM addy
		SRAM_WR_EN : out std_logic; --  sram write enable, only used on INIT
		SRAM_OE_N : out std_logic -- SRAM output enable, used everywhere else( reading) 
		
	
	);
END top_level;

architecture arch of top_level is 


signal mode : std_logic_vector(2 downto 0) := "000"; -- inital mode is INIT (000)
-- Top level state machine? 
-- i2c master

-- WE NEED  TO DEBOUNCE ALL THE KEY SIGNALS
signal KEY0_deb : std_logic;
signal KEY1_deb : std_logic;
signal KEY2_deb : std_logic;
signal KEY3_deb : std_logic;



COMPONENT i2c_master IS
  GENERIC(
    input_clk : INTEGER := 100_000_000; --input clock speed from user logic in Hz
    bus_clk   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz
  PORT(
    clk       : IN     STD_LOGIC;                    --system clock
    reset_n   : IN     STD_LOGIC;                    --active low reset
    ena       : IN     STD_LOGIC;                    --latch in command
    addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
    rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
    data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
    busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
    data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
    ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
    sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
    scl       : INOUT  STD_LOGIC);                   --serial clock output of i2c bus
END component;

COMPONENT Btn_Debounce_Toggle is
GENERIC (
	CONSTANT CNTR_MAX : std_logic_vector(15 downto 0) := X"FFFF");  
    Port ( BTN_I 	: in  STD_LOGIC;
           CLK 		: in  STD_LOGIC;
           BTN_O 	: out  STD_LOGIC;
           TOGGLE_O : out  STD_LOGIC;
		   PULSE_O  : out STD_LOGIC);
END COMPONENT;


COMPONENT Statemachine is
	PORT (
		clk_in : in std_logic;
		KEY0 : in std_logic; -- key0
		KEY1 : in std_logic; -- key1
		KEY2 : in std_logic; -- key2
		KEY3 : in std_logic; -- key 3
		mode  : out std_logic_vector(2 downto 0) -- 000 init, 001 test, 010 - pause, 111 - pwm freq 60,, 100 pwm freq 120, 101 pwm freq 1000hz
	); -- this is  what drives mode, and 
	
END component;

COMPONENT LCD_Controller is  
	PORT(
		clk_in : in std_logic; -- 50mhz clock
		mode : in std_logic_vector(2 downto 0);
		LCD_EN : out std_logic;
		LCD_RS : out std_logic; -- LCD command or data
		LCD_Data : out std_logic_vector(7 downto 0)
		);
end component;


begin 
--- INSTANTIATIONS GO HERE
-- INSTANTIATE i2C master, figure out where all ports connect, going to need logic
INST_LCD_CONTROLLER : LCD_Controller
	PORT MAP (
		clk_in => clk_in,
		mode => mode,
		LCD_EN => LCD_EN,
		LCD_RS => LCD_RS,
		LCD_Data => LCD_Data
	);
INST_BTN_DEBOUNCE_Key0  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I => not KEY0,
		CLK => clk_in,
		BTN_O => KEY0_deb,
		TOGGLE_O => open,
		PULSE_O => open

	); 
INST_BTN_DEBOUNCE_Key1  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I => not KEY1,
		CLK => clk_in,
		BTN_O => KEY1_deb,
		TOGGLE_O => open,
		PULSE_O => open

	); 
INST_BTN_DEBOUNCE_Key2  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I => not KEY2,
		CLK => clk_in,
		BTN_O => KEY2_deb,
		TOGGLE_O => open,
		PULSE_O => open

	); 
INST_BTN_DEBOUNCE_Key3  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I => not KEY3,
		CLK => clk_in,
		BTN_O => KEY3_deb,
		TOGGLE_O => open,
		PULSE_O => open

	); 
	

INST_Statemachine : Statemachine
	PORT MAP (
		clk_in => clk_in,
		KEY0 => KEY0_deb, 
		KEY1 => KEY1_deb, 
		KEY2 => KEY2_deb,
		KEY3 => KEY3_deb,
		mode => mode
	);
-----


--process(clk_in)
--begin
--	if (rising_edge(clk_in)) then
--		
--		
--		
--		
--		
--	end if;
--end process;	

	

end arch;
