--Main Prog KKS

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PWM_TL_tb is
-- Port ();
end PWM_TL_tb;

architecture Behavorial of PWM_TL_tb is

component PWM_TL is
	generic(DataS: integer := 8; Cnt2: integer := 255);
	port(
		iClk					: in std_logic; 
		Reset  				: in std_logic;
		iClk_en				: in std_logic;
		iData             : in std_logic_vector (DataS-1 downto 0);
		Scream_Pain       : out std_logic;
		oPWM              : out std_logic
	);
end component;

	signal clock 	      : std_logic := '0';
	signal clock_en 	   : std_logic := '0';
	signal reset         : std_logic;
	signal Richie        : std_logic;
	signal data          : std_logic_vector(7 downto 0);
	signal PWM           : std_logic;

begin

DUT : PWM_TL
	port map(
		iClk        => clock,
		Reset       => reset,
		iClk_en     => clock_en,
		iData       => data,
		Scream_Pain => Richie,
		oPWM        => PWM
	);
	
clock <= not clock after 10 ns;
	
process 
	begin

		reset <= '1';
		data  <= "00000000";
		wait for 50 ns;

		reset <= '0';
		data  <= "00001111";
		wait for 6000 ns;
		
		
		reset <= '0';
		data  <= "00101101";
		wait for 6000 ns;
		wait;

	end process; 
end Behavorial;