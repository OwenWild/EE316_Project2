--main prog J.S.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;
	
entity PWM_Comparator is
	generic(N: integer := 8);
	port(
		iClk					: in std_logic;
		MODE              : in std_logic_vector(1 downto 0);
		A                 : in std_logic_vector(N-1 downto 0); --IN FROM COUNTER
		B                 : in std_logic_vector(N-1 downto 0); --IN FROM REG
		C                 : out std_logic
	);
end PWM_Comparator;

architecture Structural of PWM_Comparator is
	
begin
	
	process(iClk)
	begin
	
	if rising_edge(iClk) then
		case MODE is
		
			when "00" => 
			if A = B then
				C <= '1';
			else
				C <= '0'; 
			end if;
			
			when "01" => 
			if A < B then
				C <= '1';
			else
				C <= '0'; 
			end if;
			
			when "10" => 
			if A > B then
				C <= '1';
			else
				C <= '0'; 
			end if;
			
			when others => 
			if A = B then
				C <= '1';
			else
				C <= '0'; 
			end if;
			
		end case;
		
	end if;
	
	end process;
	
end Structural;