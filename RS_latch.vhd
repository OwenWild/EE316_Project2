--Original Code: J.S.
--Edited by Xander Paquette
library ieee;
use ieee.std_logic_1164.all;

entity RS_latch is
   port(
      iClk : in  std_logic;
      R    : in  std_logic;  -- reset (active high)
      S    : in  std_logic;  -- set   (active high)
      q    : out std_logic
   );
end RS_latch;

architecture rtl of RS_latch is
   signal q_reg : std_logic := '0';
begin
   process(iClk)
   begin
      if rising_edge(iClk) then
         if R = '1' then
            q_reg <= '0';
         elsif S = '1' then
            q_reg <= '1';
         else
            -- hold the previous value in memory
            q_reg <= q_reg;
         end if;
      end if;
   end process;

   q <= q_reg;
end rtl;