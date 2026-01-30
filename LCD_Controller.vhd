library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY LCD_Controller is  
	PORT(
		clk_in : in std_logic; -- 50mhz clock
		mode : in std_logic_vector(2 downto 0);
		LCD_EN : out std_logic;
		LCD_RS : out std_logic; -- LCD command or data
		LCD_Data : out std_logic_vector(7 downto 0)
		);
end LCD_Controller;

architecture arch of LCD_Controller is 


-- STATES ARE  (000 INIT, 001 TEST, 010 PAUSE, 100 PWM1, 101 PWM2, 110 PWM3);


-- instantiate an actual LCD data creator? 
-- deppends how to make the LCD data creator 


begin 

process(clk_in) 
begin
	if rising_edge(clk_in) then 
		
		if (mode = "000") then 
			-- we're in init mode
			--  First line:  INITIALIZING
		end if;
		
		if (mode = "001") then
			-- we're in the test mode
			-- this is the hard one, needs to display data at 1hz
		end if;
		
		if (mode = "010") then
			-- we're in the pause mode
			-- this is kinda easy after we've done test mode, just have same logic, but don't need to update. 
		end if;
		
		if (mode = "100") then
			-- we're in the pwm1 mode
			-- this is easy, 
			-- First line: PWM generation mode
			-- Second line: 60Hz
		end if;
		
		if (mode = "101") then
			-- we're in pwm2 mode
			-- First Line: PWM generation mode
			-- Second Line: 120Hz
		end if;
		
		if (mode = "110") then
			-- we're in pwm3 mode
			-- First Line: PWM generation mode
			-- Second line: 1000Hz
		
		else
			--- BIG ERROR MESSAGE! 
		end if;
		

	end if;
	
end process;


end arch;



