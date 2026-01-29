library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Bin_Counter IS
    PORT (
        cnt_dir : in std_logic;
		cnt_en : in std_logic;
        clk_in : in std_logic;
		rst : in std_logic;
		val_out : out std_logic_vector(7 downto 0)
			);	
END Bin_Counter;


ARCHITECTURE Arch OF Bin_Counter IS

signal count : std_logic_vector(7 downto 0) := X"00";

BEGIN
 PROCESS(clk_in,rst)
 BEGIN
	if (rst = '1') then
		count <= X"00";
	elsif rising_edge (clk_in) then
		if (cnt_en = '1') then
			if (cnt_dir = '1') then
				if (NOT (count = X"FF")) then
					count <= count + 1;
				else
					count <= X"00";
				end if;
			elsif (cnt_dir = '0') then
				if (NOT (count = X"00")) then
					count <= count - 1;
				else
					count <= X"FF";
				end if;
			end if;
		end if;
	end if;
	val_out <= count;
 END PROCESS;
	
END Arch;
