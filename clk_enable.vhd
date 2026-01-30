--main prog J.S.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.Numeric_std.all;

entity clk_enable is
	generic(lenght: integer := 49999999);
	port(
		iClk					: in std_logic;
		Enable				: in std_logic;
		clk_en            : out std_logic
	);
end clk_enable;

architecture Structural of clk_enable is
	signal clk_cnt				 : integer range 0 to lenght;
begin
	
	process(iClk)
	begin
		if rising_edge(iClk) then
			if (clk_cnt = lenght) then --For sim - 49, for use 49999999
				clk_cnt <= 0;
				clk_en <= '1';
			else 
				clk_cnt <= clk_cnt + 1;
				clk_en <= '0' or not Enable;
			end if;
		end if;
	
	end process;
	
end Structural;