--Original Code: J.S.
--Edited by Xander Paquette
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM_TL is
   generic(
      DataS   : integer := 16;      --data width (16-bit samples)
      Cnt2    : integer := 65535;   --max counter value
      en_time : integer := 49999999 -- clk_enable period
   );
   port(
      iClk        : in  std_logic;
      Reset       : in  std_logic;
      iClk_en     : in  std_logic;  -- enable for the clk_enable
      iData       : in  std_logic_vector(DataS-1 downto 0); -- Data from SRAM/ROM
      Scream_Pain : out std_logic;  --???
      oPWM        : out std_logic
   );
end PWM_TL;

architecture Structural of PWM_TL is

   -- Component declarations
   component clk_enable is
      generic(
         length : integer := en_time
      );
      port(
         iClk   : in  std_logic;
         Enable : in  std_logic;
         clk_en : out std_logic
      );
   end component;

   component univ_bin_counter is
      generic(
         N  : integer := DataS;
         N2 : integer := Cnt2;
         N1 : integer := 0
      );
      port(
         clk, reset        : in  std_logic;
         syn_clr, load, en : in  std_logic;
         up                : in  std_logic;
         clk_en            : in  std_logic := '1';
         d                 : in  std_logic_vector(N-1 downto 0);
         max_tick          : out std_logic;
         min_tick          : out std_logic;
         q                 : out std_logic_vector(N-1 downto 0)
      );
   end component;

   component PWM_reg is
      generic(
         N : integer := DataS
      );
      port(
         iClk : in  std_logic;
         X    : in  std_logic_vector(N-1 downto 0);
         Load : in  std_logic;
         num  : out std_logic_vector(N-1 downto 0)
      );
   end component;

   component PWM_Comparator is
      generic(
         N : integer := DataS
      );
      port(
         iClk : in  std_logic;
         MODE : in  std_logic_vector(1 downto 0);
         A    : in  std_logic_vector(N-1 downto 0);
         B    : in  std_logic_vector(N-1 downto 0);
         C    : out std_logic
      );
   end component;

   component RS_latch is
      port(
         iClk : in  std_logic;
         R    : in  std_logic;
         S    : in  std_logic;
         q    : out std_logic
      );
   end component;

   -- Signals
   signal Cnt_En : std_logic := '1';
   signal Max_Load : std_logic;
   signal clk_en   : std_logic;
   signal R_sig    : std_logic;
   signal Cnt      : std_logic_vector(DataS-1 downto 0);
   signal A_reg    : std_logic_vector(DataS-1 downto 0);

begin
   Scream_Pain <= Max_Load;

   -- Clock enable
   inst_PWM_clken : clk_enable
      generic map(
         length => en_time
      )
      port map(
         iClk   => iClk,
         Enable => iClk_en,
         clk_en => clk_en
      );

   -- Counter
   inst_PWM_cnt : univ_bin_counter
      generic map(
         N  => DataS,
         N2 => Cnt2
      )
      port map(
         clk      => iClk,
         reset    => Reset,
         syn_clr  => Reset,
         load     => '0',
         en       => Cnt_En,
         up       => '1',
         clk_en   => clk_en,
         d        => (others => '0'),
         max_tick => Max_Load,
         min_tick => open,
         q        => Cnt
      );

   -- Register (should latch iData at each max_tick)
   inst_PWM_reg : PWM_reg
      generic map(
         N => DataS
      )
      port map(
         iClk => iClk,
         X    => iData,
         Load => Max_Load,
         num  => A_reg
      );

   -- Comparator: (A = counter, B = data)
   inst_PWM_comp : PWM_Comparator
      generic map(
         N => DataS
      )
      port map(
         iClk => iClk,
         MODE => "01",   -- A < B
         A    => Cnt,    -- counter
         B    => A_reg,  -- data
         C    => R_sig
      );

   -- RS latch: Reset clears, comparator sets
   inst_PWM_RS_latch : RS_latch
      port map(
         iClk => iClk,
         R    => Reset,
         S    => R_sig,
         q    => oPWM
      );

end Structural;