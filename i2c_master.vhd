--I2C Master Code Credit: Alexander Paquette
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c is
    generic(
        iClk : integer := 100_000_000; -- Input clock
        bClk : integer := 100_000      -- I2C bus clock
    );
    port(
        clk     : in  std_logic;                      -- system clock
        reset_n : in  std_logic;
        en      : in  std_logic;
        addr    : in  std_logic_vector(6 downto 0);   -- 7-bit slave address
        rw      : in  std_logic;                      -- '0' = write, '1' = read
        r_data  : in  std_logic_vector(7 downto 0);   -- data to write
        busy    : out std_logic;
        rd_data : out std_logic_vector(7 downto 0);   -- data read from slave
        error   : buffer std_logic;
        sda     : inout std_logic;                    -- serial data
        scl     : inout std_logic                     -- serial clock
    );
end entity i2c;

architecture rtl of i2c is

    -- Types and internal signals
    type state_type is (
        ready,
        start_cond,
        send_addr,
        addr_ack,
        write_byte,
        write_ack,
        read_byte,
        read_ack,
        stop_cond
    );

    signal state      : state_type := ready;
    signal next_state : state_type;

    signal scl_int    : std_logic := '1';
    signal sda_int    : std_logic := '1';  -- internal drive value (0 = pull low, 1 = release)
    signal sda_oe     : std_logic := '0';  -- output enable for SDA (1 = drive, 0 = Z)

    signal bit_cnt    : integer range 0 to 7 := 7;

    signal addr_rw    : std_logic_vector(7 downto 0) := (others => '0');
    signal data_tx    : std_logic_vector(7 downto 0) := (others => '0');
    signal data_rx    : std_logic_vector(7 downto 0) := (others => '0');

    signal busy_int   : std_logic := '0';

    -- Simple clock divider for SCL (very basic, adjust as needed)
    constant DIV : integer := iClk / (bClk * 2);  -- toggle SCL at bClk
    signal div_cnt : integer range 0 to DIV := 0;
    signal scl_en  : std_logic := '0';            -- tick for FSM steps

begin
    
    -- I/O assignments
    busy    <= busy_int;
    rd_data <= data_rx;

    -- Open-drain style SDA: drive low or release (Z)
    sda <= '0' when (sda_oe = '1' and sda_int = '0') else 'Z';

    -- For simplicity, drive SCL as push-pull here (you can adapt to open-drain)
    scl <= scl_int;

    
    -- Clock divider to generate SCL and scl_en
    clk_divider : process(clk, reset_n)
    begin
        if reset_n = '0' then
            div_cnt <= 0;
            scl_int <= '1';
            scl_en  <= '0';
        elsif rising_edge(clk) then
            if div_cnt = DIV then
                div_cnt <= 0;
                scl_int <= not scl_int;
                scl_en  <= '1';
            else
                div_cnt <= div_cnt + 1;
                scl_en  <= '0';
            end if;
        end if;
    end process;

    
    -- I2C State Machine --
    fsm : process(clk, reset_n)
    begin
        if reset_n = '0' then
            state    <= ready;
            busy_int <= '0';
            sda_int  <= '1';
            sda_oe   <= '0';
            bit_cnt  <= 7;
            addr_rw  <= (others => '0');
            data_tx  <= (others => '0');
            data_rx  <= (others => '0');
            error    <= '0';
        elsif rising_edge(clk) then
            if scl_en = '1' then  -- advance FSM only on SCL edges
                case state is

                    -- IDLE / READY
						  
                    when ready =>
                        busy_int <= '0';
                        sda_int  <= '1';
                        sda_oe   <= '0';
                        bit_cnt  <= 7;
                        error    <= '0';

                        if en = '1' then
                            busy_int <= '1';
                            addr_rw  <= addr & rw;   -- 7-bit addr + R/W
                            data_tx  <= r_data;      -- latch write data
                            state    <= start_cond;
                        else
                            state <= ready;
                        end if;

                    -- START condition: SDA goes low while SCL high

                    when start_cond =>
                        sda_oe  <= '1';
                        sda_int <= '0';  -- pull SDA low
                        bit_cnt <= 7;
                        state   <= send_addr;

                    -- Send address + R/W bit (MSB first)
                    
                    when send_addr =>
                        sda_oe  <= '1';
                        sda_int <= addr_rw(bit_cnt);

                        if bit_cnt = 0 then
                            bit_cnt <= 7;
                            state   <= addr_ack;
                        else
                            bit_cnt <= bit_cnt - 1;
                        end if;

                    -- Slave ACK for address

                    when addr_ack =>
                        sda_oe <= '0';  -- release SDA, sample ACK
                        -- In real hardware, sample SDA here (on SCL high)
                        -- For now, we don't check it and assume ACK
                        if rw = '0' then
                            -- WRITE operation
                            state <= write_byte;
                        else
                            -- READ operation
                            state <= read_byte;
                        end if;

                    -- WRITE: send data byte
                    when write_byte =>
                        sda_oe  <= '1';
                        sda_int <= data_tx(bit_cnt);

                        if bit_cnt = 0 then
                            bit_cnt <= 7;
                            state   <= write_ack;
                        else
                            bit_cnt <= bit_cnt - 1;
                        end if;

                    -- Slave ACK for data byte
                    when write_ack =>
                        sda_oe <= '0';  -- release SDA, sample ACK
                        -- Again, not checking ACK here
                        state <= stop_cond;

                    -- READ: receive data byte
                    when read_byte =>
                        sda_oe <= '0';  -- release SDA, slave drives
                        -- Sample SDA into data_rx(bit_cnt)
                        data_rx(bit_cnt) <= sda;

                        if bit_cnt = 0 then
                            bit_cnt <= 7;
                            state   <= read_ack;
                        else
                            bit_cnt <= bit_cnt - 1;
                        end if;

                   
                    -- Master ACK/NACK after read
                    when read_ack =>
                        sda_oe  <= '1';
                        sda_int <= '1';  -- NACK for single-byte read
                        state   <= stop_cond;

                    -- STOP condition: SDA goes high while SCL high
                    
                    when stop_cond =>
                        sda_oe  <= '1';
                        sda_int <= '0';  -- ensure low first
                        -- next tick, release SDA to generate STOP
                        sda_int  <= '1';
                        sda_oe   <= '0';
                        busy_int <= '0';
                        state    <= ready;

                    when others =>
                        state <= ready;

                end case;
            end if;
        end if;
    end process;

end architecture rtl;