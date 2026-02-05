library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY LCD_Controller is  
	PORT(
		clk_in : in std_logic; -- 50mhz clock
		mode : in std_logic_vector(2 downto 0);
		LCD_EN : out std_logic;
		LCD_RS : out std_logic; -- LCD command or data, command is 0, data is 1
		LCD_Data : out std_logic_vector(7 downto 0)
		);
end LCD_Controller;

architecture arch of LCD_Controller is 
signal lcd_start : integer range -20 to 50 := -20;

-- STATES ARE  (000 INIT, 001 TEST, 010 PAUSE, 100 PWM1, 101 PWM2, 110 PWM3);
signal div_cnt : integer range 0 to 500000 := 0;
signal lcd_tick : std_logic := '0';


-- instantiate an actual LCD data creator? 
-- deppends how to make the LCD data creator 

-- need clock divider
begin 

-- clock divider: 

process(clk_in) 
begin
	if rising_edge(clk_in) then 
		if (div_cnt = 499999) then
			div_cnt <= 0;
			lcd_tick <= '1';
			LCD_EN <= '1';
		elsif (div_cnt = 260000) then 
			LCD_EN <= '0';
		else
			div_cnt <= div_cnt + 1;
			lcd_tick <= '0';
		end if;
		if LCD_tick = '1' then 
		if lcd_start < 16 then
			lcd_start <= lcd_start + 1;
		else lcd_start <= -20;
		end if;
		end if;
			------------------------------
		if (mode = "000") then 
			
			case lcd_start is 
				when 0 => LCD_RS <= '0'; LCD_Data <= x"38"; -- these 4 are commands, that are the init sequence for the LCD
				when 1 => LCD_RS <= '0'; LCD_Data <= x"0C";
				when 2 => LCD_RS <= '0'; LCD_Data <= x"01";
				when 3 => LCD_RS <= '0'; LCD_Data <= x"06";
				when 4 => LCD_RS <= '0'; LCD_Data <= x"80";
				
				-- INITIALIZING :
				when 5  => LCD_RS <= '1'; LCD_Data <= x"49"; -- I
				when 6  => LCD_RS <= '1'; LCD_Data <= x"4E"; -- N
				when 7  => LCD_RS <= '1'; LCD_Data <= x"49"; -- I
				when 8  => LCD_RS <= '1'; LCD_Data <= x"54"; -- T
				when 9  => LCD_RS <= '1'; LCD_Data <= x"49"; -- I
				when 10 => LCD_RS <= '1'; LCD_Data <= x"41"; 
				when 11 => LCD_RS <= '1'; LCD_Data <= x"4C"; 
				when 12 => LCD_RS <= '1'; LCD_Data <= x"49"; 
				when 13 => LCD_RS <= '1'; LCD_Data <= x"5A"; 
				when 14 => LCD_RS <= '1'; LCD_Data <= x"49"; 
				when 15 => LCD_RS <= '1'; LCD_Data <= x"4E"; 
				when 16 => LCD_RS <= '1'; LCD_Data <= x"47"; 
				
				when others => 
					LCD_RS <= '0';
					LCD_Data <= x"00"; -- do nothing
			end case;
		
		
			elsif (mode = "001") then
            -- TEST mode placeholder: "TEST"
            case lcd_start is
                when 0  => LCD_RS <= '0'; LCD_Data <= x"80"; 
                when 1  => LCD_RS <= '1'; LCD_Data <= x"54"; 
                when 2  => LCD_RS <= '1'; LCD_Data <= x"45"; 
                when 3  => LCD_RS <= '1'; LCD_Data <= x"53"; 
                when 4  => LCD_RS <= '1'; LCD_Data <= x"54"; 
                when others =>
                    LCD_RS <= '0'; LCD_Data <= x"00";
            end case;

        elsif (mode = "010") then
            -- PAUSE mode placeholder: "PAUSE"
            case lcd_start is
                when 0  => LCD_RS <= '0'; LCD_Data <= x"80";
                when 1  => LCD_RS <= '1'; LCD_Data <= x"50"; 
                when 2  => LCD_RS <= '1'; LCD_Data <= x"41"; 
                when 3  => LCD_RS <= '1'; LCD_Data <= x"55"; 
                when 4  => LCD_RS <= '1'; LCD_Data <= x"53"; 
                when 5  => LCD_RS <= '1'; LCD_Data <= x"45"; 
                when others =>
                    LCD_RS <= '0'; LCD_Data <= x"00";
            end case;

        elsif (mode = "100") then
            -- PWM1 placeholder: "PWM1"
            case lcd_start is
                when 0  => LCD_RS <= '0'; LCD_Data <= x"80";
                when 1  => LCD_RS <= '1'; LCD_Data <= x"50"; 
                when 2  => LCD_RS <= '1'; LCD_Data <= x"57"; 
                when 3  => LCD_RS <= '1'; LCD_Data <= x"4D"; 
                when 4  => LCD_RS <= '1'; LCD_Data <= x"31"; 
                when others =>
                    LCD_RS <= '0'; LCD_Data <= x"00";
            end case;

        elsif (mode = "101") then
            -- PWM2 placeholder: "PWM2"
            case lcd_start is
                when 0  => LCD_RS <= '0'; LCD_Data <= x"80";
                when 1  => LCD_RS <= '1'; LCD_Data <= x"50"; 
                when 2  => LCD_RS <= '1'; LCD_Data <= x"57";
                when 3  => LCD_RS <= '1'; LCD_Data <= x"4D"; 
                when 4  => LCD_RS <= '1'; LCD_Data <= x"32"; 
                when others =>
                    LCD_RS <= '0'; LCD_Data <= x"00";
            end case;

        elsif (mode = "110") then
            -- PWM3 
            case lcd_start is
                when 0  => LCD_RS <= '0'; LCD_Data <= x"80";
                when 1  => LCD_RS <= '1'; LCD_Data <= x"50"; 
                when 2  => LCD_RS <= '1'; LCD_Data <= x"57";
                when 3  => LCD_RS <= '1'; LCD_Data <= x"4D";
                when 4  => LCD_RS <= '1'; LCD_Data <= x"33"; 
                when others =>
                    LCD_RS <= '0'; LCD_Data <= x"00";
            end case;

        else
            -- BIG ERROR MESSAGE 
            case lcd_start is
                when 0  => LCD_RS <= '0'; LCD_Data <= x"80";
                when 1  => LCD_RS <= '1'; LCD_Data <= x"45"; 
                when 2  => LCD_RS <= '1'; LCD_Data <= x"52"; 
                when 3  => LCD_RS <= '1'; LCD_Data <= x"52"; 
                when 4  => LCD_RS <= '1'; LCD_Data <= x"4F";
                when 5  => LCD_RS <= '1'; LCD_Data <= x"52";
                when others =>
                    LCD_RS <= '0'; LCD_Data <= x"00";
            end case;

		
		----------------- Thats all the modes sending the signals and data. I now want to send EN every 1ms, and increment LCD start every 1ms. 
		
		
		

		end if;-- mode ifs
	end if;-- rising edge clock
end process;


end arch;



