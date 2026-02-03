--Original Code: J.S.
--Edited by Xander Paquette
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM_Comparator is
   generic(
      N : integer := 8
   );
   port(
      iClk : in  std_logic;
      MODE : in  std_logic_vector(1 downto 0);
      A    : in  std_logic_vector(N-1 downto 0); -- input A
      B    : in  std_logic_vector(N-1 downto 0); -- input B
      C    : out std_logic
   );
end PWM_Comparator;

architecture rtl of PWM_Comparator is
begin
   process(iClk)
   begin
      if rising_edge(iClk) then
         case MODE is
            -- 00: A = B
            when "00" =>
               if A = B then
                  C <= '1';
               else
                  C <= '0';
               end if;

            -- 01: A < B
            when "01" =>
               if unsigned(A) < unsigned(B) then --interpret A and B as unsigned to wrap them and ensure they are compared numarically.
                  C <= '1';
               else
                  C <= '0';
               end if;

            -- 10: A > B
            when "10" =>
               if unsigned(A) > unsigned(B) then
                  C <= '1';
               else
                  C <= '0';
               end if;

            -- others: A = B
            when others =>
               if A = B then
                  C <= '1';
               else
                  C <= '0';
               end if;
         end case;
      end if;
   end process;
end rtl;