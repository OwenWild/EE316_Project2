--main prog J.S.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;

entity RS_latch is
	port(
		iClk					: in std_logic; 
		R      				: in std_logic;
		S                 : in std_logic;
		q                 : out std_logic
	);
end RS_latch;

architecture Structural of RS_latch is
	
begin
	
	process(iClk)
	begin
	
	if rising_edge(iClk) then
	
		if R = '0' then
			q <= '0';
		elsif S = '1' then
			q <= '1';
		elsif R = '1' and S = '1' then
			q <= '0';
		end if;
	end if;
	
	end process;
	
end Structural;