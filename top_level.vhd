
--editid by J.S. 2/5/2026
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
		LCD_RS : out std_logic; -- lcd either command ('0') or data ('1')
		SRAM_DQ : inout std_logic_vector(15 downto 0); -- SRAM data in/out bus
		SRAM_addr : out std_logic_vector(19 downto 0); -- SRAM addy
		SRAM_WR_EN : out std_logic; --  sram write enable, only used on INIT
		SRAM_OE_N : out std_logic; -- SRAM output enable, used everywhere else( reading)
		SRAM_CE_N : out std_logic;
		SRAM_UB_N : out std_logic;
		SRAM_LB_N : out std_logic;	
		PWM_out : out std_logic
	
	);
END top_level;

architecture arch of top_level is 


signal mode : std_logic_vector(2 downto 0) := "000"; -- inital mode is INIT (000)
-- Top level state machine? 
-- i2c master

-- WE NEED  TO DEBOUNCE ALL THE KEY SIGNALS
signal Reset_Master : std_LOGIC;
signal ResetDelay  : std_LOGIC;

signal KEY0_in        : std_logic; --button reset
signal KEY1_in        : std_logic;
signal KEY2_in        : std_logic;
signal KEY3_in        : std_logic; 

signal KEY0_deb       : std_logic; --button reset
signal KEY1_deb       : std_logic;
signal KEY2_deb       : std_logic;
signal KEY3_deb       : std_logic;
signal pulse          : std_LOGIC;
signal PWM1           : std_logic;
signal PWM2           : std_logic;
signal PWM3           : std_logic;

signal PWM_out_60Hz   : std_logic;
signal PWM_out_120Hz  : std_logic;
signal PWM_out_1000Hz : std_logic;

signal Cnt            : std_logic_vector(7 downto 0);
signal Count_En       : std_logic;

signal cnt_en			 : std_logic;
signal clk_cnt			 : integer range 0 to 49999999;
signal clk_en			 : std_logic;
signal clk_cnt_12ns	 : integer range 0 to 49999;
signal clk_en_12ns	 : std_logic;

signal pulse_out      :std_logic;

signal SRAM_Data      : std_logic_vector(15 downto 0);
signal ROM_Data       : std_logic_vector(15 downto 0);


Component PWM_TL is
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
end component;

COMPONENT Reset_Delay IS	
    PORT (
        SIGNAL iCLK : IN std_logic;	
        SIGNAL oRESET : OUT std_logic
			);	
END COMPONENT;

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
		clk_in     : in std_logic;
		KEY0       : in std_logic; -- key 0
		KEY1       : in std_logic; -- key 1
		KEY2       : in std_logic; -- key 2
		KEY3       : in std_logic; -- key 3
--		count      : out std_logic;
--		pulse_out  : out std_logic;
--		PWM_1      : out std_logic;
--		PWM_2      : out std_logic;
--		PWM_3      : out std_logic;
		mode       : out std_logic_vector(2 downto 0) -- 000 init, 001 test, 010 - pause, 111 - pwm freq 60,, 100 pwm freq 120, 101 pwm freq 1000hz
	); -- this is  what drives mode, and 
	
END component;

COMPONENT LCD_Controller is  
	PORT(
		clk_in   : in std_logic; -- 50mhz clock
		mode     : in std_logic_vector(2 downto 0);
		LCD_EN   : out std_logic;
		LCD_RS   : out std_logic; -- LCD command or data
		LCD_Data : out std_logic_vector(7 downto 0)
		);
end component;

COMPONENT ROM IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		   : IN STD_LOGIC  := '1';
		q		      : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT S_RAM_Contrl is
		port ( 
		iCLK           : in std_LOGIC;
		iReset         : in std_logic;
		iEnable			: in std_logic; -- R_W
		pulse_in       : in std_LOGIC;
		iAddress			: in std_logic_vector(7 downto 0);
		iSData         : in std_logic_vector(15 downto 0);
		oSData         : out std_logic_vector(15 downto 0);
		addr           : out std_LOGIC_VECTOR(19 downto 0);
		we_n           : out std_logic; --Write enable input
		oe_n           : out std_logic; --Output enable input
		ce_n           : out std_logic; --Chip Enable input
		lb_n           : out std_logic; --Lower-byte Control
		ub_n           : out std_logic; --Upper-byte Control
		i_o            : inout std_LOGIC_VECTOR(15 downto 0)
		);
end COMPONENT;

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


begin 

Reset_Master <= ResetDelay or Key0_deb;
KEY0_in      <= not KEY0;
KEY1_in      <= not KEY1;
KEY2_in      <= not KEY2;
KEY3_in      <= not KEY3;
--- INSTANTIATIONS GO HERE
-- INSTANTIATE i2C master, figure out where all ports connect, going to need logic
INST_PWM_60Hz : PWM_TL 

   generic map(DataS => 8, Cnt2 => 255, en_time => 49999999)
	port map(
		iClk		    => clk_in,
		Reset  	    => Reset_Master, 
		iClk_en	    => '0',
		iData        => SRAM_Data(7 downto 0),
		Scream_Pain  => Count_En,
		oPWM         => PWM_out_60Hz
	);
	
INST_Reset_Delay : Reset_Delay
	PORT MAP (
		iCLK   => clk_in,	
      oRESET => ResetDelay
	);
	
INST_LCD_CONTROLLER : LCD_Controller
	PORT MAP (
		clk_in   => clk_in,
		mode     => mode,
		LCD_EN   => LCD_EN,
		LCD_RS   => LCD_RS,
		LCD_Data => LCD_Data
	);
INST_BTN_DEBOUNCE_Key0  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I    => KEY0_in,
		CLK      => clk_in,
		BTN_O    => open,
		TOGGLE_O => open,
		PULSE_O  => KEY0_deb

	); 
INST_BTN_DEBOUNCE_Key1  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I    => KEY1_in,
		CLK      => clk_in,
		BTN_O    => open,
		TOGGLE_O => open,
		PULSE_O  => KEY1_deb

	); 
INST_BTN_DEBOUNCE_Key2  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I    => KEY2_in,
		CLK      => clk_in,
		BTN_O    => open,
		TOGGLE_O => open,
		PULSE_O  => KEY2_deb

	); 
INST_BTN_DEBOUNCE_Key3  : Btn_Debounce_Toggle
	PORT MAP(
		BTN_I    => KEY3_in,
		CLK      => clk_in,
		BTN_O    => open,
		TOGGLE_O => open,
		PULSE_O  => KEY3_deb

	); 
	

INST_Statemachine : Statemachine
	PORT MAP (
		clk_in    => clk_in,
		KEY0      => KEY0_deb, 
		KEY1      => KEY1_deb, 
		KEY2      => KEY2_deb,
		KEY3      => KEY3_deb,
--		count     => Cnt_En,
--		pulse_out => pulse,
--		PWM_1     => PWM1,
--		PWM_2     => PWM2,
--		PWM_3     => PWM3,
		mode      => mode
	);
	
inst_ROMaddressor : univ_bin_counter
	generic map(N => 8, N2 => 255)
   port map(
			clk                     => clk_in, 
			reset				         => Reset_Master,
			syn_clr                 => Reset_Master, 
			load                    => '0', 
			en                      => Count_En, 
			up	                     => '1',
			clk_en 					   => open,			
			d						      =>(others => '0'),
			max_tick                => open, 
			min_tick		            => open,
			q						      => Cnt		
   );
	
INST_SEGA : ROM
	PORT MAP (
		address		=> Cnt,
		clock		   => clk_in,
		q		      => ROM_Data
	);

INST_SRAM : S_RAM_Contrl	
		port map( 
		iCLK           => clk_in,
		iReset         => Reset_Master,
		iEnable			=> '0', -- R_W
		pulse_in       => pulse,
		iAddress			=> Cnt,
		iSData         => ROM_Data,
		oSData         => SRAM_Data,
		addr           => SRAM_addr,
		we_n           => SRAM_WR_EN, --Write enable input
		oe_n           => SRAM_OE_N, --Output enable input
		ce_n           => SRAM_CE_N, --Chip Enable input
		lb_n           => SRAM_LB_N, --Lower-byte Control
		ub_n           => SRAM_UB_N, --Upper-byte Control
		i_o            => SRAM_DQ
		);
	

-----

-- clock enable 1 SEC

	process(clk_in)
	begin
		if rising_edge(clk_in) then
			if (clk_cnt = 49) then --For sim - 49, for use 49999999
				clk_cnt <= 0;
				clk_en <= '1';
			else 
				clk_cnt <= clk_cnt + 1;
				clk_en <= '0';
			end if;
		end if;
	
	end process;
	
	-- Clock enable 12 ns
	process(clk_in)
	begin
		if rising_edge(clk_in) then
			if (clk_cnt_12ns = 4) then --For sim - 4, for use 49999
				clk_cnt_12ns <= 0;
				clk_en_12ns <= '1';
			else 
				clk_cnt_12ns <= clk_cnt_12ns + 1;
				clk_en_12ns <= '0';
			end if;
		end if;
	
	end process;
	
	pulse_out <= clk_en or clk_en_12ns;

process(clk_in)
begin
	if mode = "100" then	
		PWM_out <= PWM_out_60Hz;
	elsif mode = "101" then
		PWM_out <= PWM_out_120Hz;
	elsif mode = "110" then
		PWM_out <= PWM_out_1000Hz;
	else
		PWM_out <= '0';
	end if;
end process;	

	

end arch;
