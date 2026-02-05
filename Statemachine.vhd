library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY Statemachine is
	Generic ( 
		constant cnt_max  : integer := 23041 -- for init delay, this worked for other project with this length
		);
	PORT (
		clk_in : in std_logic;
		KEY0 : in std_logic; -- key0
		KEY1 : in std_logic; -- key1
		KEY2 : in std_logic; -- key2
		KEY3 : in std_logic; -- key 3
		mode  : out std_logic_vector(2 downto 0) -- 000 init, 001 test, 010 - pause, 111 - pwm freq 60,, 100 pwm freq 120, 101 pwm freq 1000hz
	);
	
END Statemachine;

architecture arch of Statemachine is 
-- signals go here: 
type state_type is (INIT, TEST, PAUSE, PWM1, PWM2, PWM3);
signal TLS : state_type := INIT;
signal INIT_Del_Cnt : integer range 0 to cnt_max := 0;-- for init delay counter signal
-- Component binary counter here



begin 



---- NOTE ALL KEY SIGNALS ARE DEBOUNCED AND ACTIVE HIGH NOW
process(clk_in) 
begin 
	if(rising_edge(clk_in)) then 
		case TLS is
			when INIT => 
				mode <= "000";
				-- the rom should initialize, -- HERE IS DELAY: 
				if((INIT_Del_Cnt = cnt_max) AND (KEY0 = '1')) then -- KEY0 is active high, so this is when it reaches max and key0 is not being pressed
					INIT_Del_cnt <= 0; -- resets delay counter
					TLS <= TEST; -- goes into test mode
					
				elsif (INIT_Del_Cnt = cnt_max) then INIT_Del_cnt <= INIT_Del_cnt; TLS <= INIT;
				else
					INIT_Del_cnt <= INIT_Del_cnt + 1;
					TLS <= INIT;
					
				end if;
			
			when TEST =>
				mode <= "001"; -- this mode is read by LCD controller to do stuff
				if(KEY1 = '1') then  -- key1 is active high, if its pressed, 
					TLS <= PAUSE;  -- goes into pause mode
				elsif (KEY2 = '1') then 
					TLS <= PWM1; -- goes into pwm1 mode, 60hz
				elsif (KEY0 = '1') then 
					TLS <= INIT;
				else
					TLS <= TEST;
				end if;
				
			when PAUSE => 
				mode <= "010";
				if(KEY1 = '1') then 
					TLS <= TEST; 
					elsif (KEY0 = '1') then 
					TLS <= INIT;
					else
					TLS <= PAUSE;
				end if;
				
				
			when PWM1 =>
				mode <= "100";
				if(KEY3 = '1') then 
					TLS <= PWM2;
				elsif(KEY2 = '1') then 
					TLS <= TEST;
					elsif (KEY0 = '1') then 
					TLS <= INIT;
				else 
					TLS <= PWM1;
				end if;
			when PWM2 =>  
				mode <= "101";
				if(KEY3 = '1') then 
					TLS <= PWM3;
				elsif(KEY2 = '1') then 
					TLS <= TEST;
					elsif (KEY0 = '1') then 
					TLS <= INIT;
				else 
					TLS <= PWM2;
				end if;
			when PWM3 =>
				mode <= "110";
				if(KEY3 = '1') then 
					TLS <= PWM1;
				elsif(KEY2 = '1') then 
					TLS <= TEST;
					elsif (KEY0 = '1') then 
					TLS <= INIT;
				else 
					TLS <= PWM3;
				end if;
			
				
			end case;
	end if;
end process;



end arch; 
