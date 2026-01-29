--main prog J.S.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;
	
entity PWM_reg is
	port(
		iClk					: in std_logic; 
		X                 : in std_logic_vector(7 downto 0);
		Load  				: in std_logic;
		num               : out std_logic_vector(7 downto 0) --num is y from Fig.11
	);
end PWM_reg;

architecture Structural of PWM_reg is

	signal R   : std_logic_vector(7 downto 0):= (others => '0');
	
begin
	
	process(iClk)
	begin
	
	if rising_edge(iClk) then
	
		if Load = '1' then
			R <= X;
		end if;
		
	end if;
	
	end process;
	num <= R;
end Structural;