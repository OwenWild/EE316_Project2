--main prog J.S.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;
	
entity PWM_Comparator is
	port(
		iClk					: in std_logic; 
		A                 : in std_logic_vector(7 downto 0);
		B                 : in std_logic_vector(7 downto 0);
		C                 : out std_logic
	);
end PWM_Comparator;

architecture Structural of PWM_Comparator is
	
begin
	
	process(iClk)
	begin
	
	if rising_edge(iClk) then
	
		if A = B then
			C <= '1';
		else
			C <= '0'; 
		end if;
		
	end if;
	
	end process;
	
end Structural;