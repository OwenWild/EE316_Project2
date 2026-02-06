LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_i2c IS
END tb_i2c;

ARCHITECTURE behavioral OF tb_i2c IS

    COMPONENT i2c IS
        GENERIC(
            iClk : INTEGER := 100_000_000;
            bClk : INTEGER := 100_000
        );
        PORT(
            clk     : IN  STD_LOGIC;
            reset_n : IN  STD_LOGIC;
            en      : IN  STD_LOGIC;
            addr    : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            rw      : IN  STD_LOGIC;
            r_data  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
            busy    : OUT STD_LOGIC;
            rd_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            error   : BUFFER STD_LOGIC;
            sda     : INOUT STD_LOGIC;
            scl     : INOUT STD_LOGIC
        );
    END COMPONENT;

    --------------------------------------------------------------------
    -- Testbench signals
    --------------------------------------------------------------------
    signal clk       : STD_LOGIC := '0';
    signal reset_n   : STD_LOGIC := '0';
    signal en        : STD_LOGIC := '0';
    signal addr      : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1110001";
    signal rw        : STD_LOGIC := '0';
    signal r_data    : STD_LOGIC_VECTOR(7 DOWNTO 0) := X"A5";
    signal busy      : STD_LOGIC;
    signal rd_data   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal error     : STD_LOGIC;

    -- IMPORTANT: open‑drain pull‑ups
    signal sda       : STD_LOGIC := 'H';
    signal scl       : STD_LOGIC := 'H';

BEGIN

    --------------------------------------------------------------------
    -- Instantiate DUT
    --------------------------------------------------------------------
    DUT: i2c
        GENERIC MAP(
            iClk => 100_000_000,
            bClk => 100_000
        )
        PORT MAP(
            clk     => clk,
            reset_n => reset_n,
            en      => en,
            addr    => addr,
            rw      => rw,
            r_data  => r_data,
            busy    => busy,
            rd_data => rd_data,
            error   => error,
            sda     => sda,
            scl     => scl
        );

    --------------------------------------------------------------------
    -- 100 MHz clock
    --------------------------------------------------------------------
    clk <= NOT clk AFTER 5 ns;

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    process
    begin
        -- Hold reset low
        reset_n <= '0';
        en      <= '0';
        wait for 1 us;

        -- Release reset
        reset_n <= '1';
        wait for 1 us;

        -- Start transaction
        en <= '1';
        wait for 200 ns;
        en <= '0';

        wait;
    end process;

END behavioral;