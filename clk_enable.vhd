--Original Code: J.S.
--Edited by Xander Paquette
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_enable is
   generic(
      length : integer := 49999999  -- number of iClk cycles between pulses
   );
   port(
      iClk   : in  std_logic;
      Enable : in  std_logic;
      clk_en : out std_logic        -- 1-cycle pulse
   );
end clk_enable;

architecture rtl of clk_enable is
   signal clk_cnt : integer range 0 to length := 0;
begin
   process(iClk)
   begin
      if rising_edge(iClk) then
         if Enable = '1' then
            if clk_cnt = length then
               clk_cnt <= 0;
               clk_en  <= '1';
            else
               clk_cnt <= clk_cnt + 1;
               clk_en  <= '0';
            end if;
         else
            clk_cnt <= 0;
            clk_en  <= '0';
         end if;
      end if;
   end process;
end rtl;