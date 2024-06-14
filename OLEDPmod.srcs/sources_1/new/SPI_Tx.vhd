----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hakeem S. 
-- 
-- Create Date: 04/29/2024 06:12:30 PM
-- Design Name: 
-- Module Name: SPI_Tx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Recieves byte data and converts to data sent via SPI
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;                                                                               -- used for incrementing vector (unsigned())

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI_Tx is
    generic (N : integer := 8);
    port (  clk : in std_logic;
            rst : in std_logic;  
            start : in std_logic; 
            byteCount : in std_logic_vector(3 downto 0);
            byteIN : in std_logic_vector(N-1 downto 0); 
            CS : out std_logic; 
            MOSI : out std_logic;
            nxByte : out std_logic; 
            TxReady : out std_logic
        );
end SPI_Tx;

architecture Behavioral of SPI_Tx is

    -- State Initialization --
type state is (idle, Tx, rstStt);
signal stt : state := idle; 
    -- Signals --
signal done : std_logic := '0';                                                                         -- This bit is high when the last bit of the current byte is being Tx   
signal lBit : std_logic := '0';                                                                         -- for properly sending last bit of last byte; signal used to keep Tx from ending before last bit sits on MOSI line for 1 cycle
signal MOSI_t : std_logic := '0';                                                                       -- Bit being Tx
signal CS_t : std_logic := '1';                                                                         -- Chip select 
signal nxByte_t : std_logic := '0';                                                                     -- signals to buffer to load next byte (If any)
signal TxReady_t : std_logic := '1';                                                                    -- Ready to Tx signal; must start at 1;  
signal TxCount : std_logic_vector(3 downto 0) := "1000";                                                -- keeps track of which bit in byte has been tx
signal byteReg : std_logic_vector(N-1 downto 0) := (others => '0');                                     -- stores the byte being currently sent; rec'd from byte reg 
signal byteCount_i : std_logic_vector(3 downto 0) := (others => '0');                                   -- store number of bytes to be Tx'd successively  

begin
    -- Processes -- 
    trns : process( clk, rst, stt, done, TxReady_t )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is
                    when rstStt => stt <= idle; 
                    when idle =>
                        if (TxReady_t = '0') then
                            stt <= Tx; 
                        else
                            stt <= idle; 
                        end if ;
                    when others =>
                        if (done = '1') then
                            stt <= idle; 
                        else
                            stt <= Tx; 
                        end if ;
                end case ;
            end if ;
        end if ;
    end process ; -- trns

    output : process( clk, rst, stt, start, done, TxCount, byteCount_i )
    begin
        if (falling_edge(clk)) then
            -- Sync Defaults --
            done <= '0'; 
            nxByte_t <= '0';
            lBit <= '0'; 

            case( stt ) is
                when rstStt =>
                    done <= '0'; 
                    MOSI_t <= '0';
                    CS_t <= '1'; 
                    nxByte_t <= '0'; 
                    TxReady_t <= '0';  
                    TxCount <= "1000"; 
                    --byteReg <= (others => '0');                                                               -- since byteReg controlled by byte sent to it from byteBuffer, may be illegal to reset 
                    byteCount_i <= (others => '0'); 
                when idle => 
                    TxCount <= "1000"; 
                    TxReady_t <= '1'; 
                    if (start = '1') then                                                                       -- Once start detected, whatever is on byteIN, byCount is stored 
                        byteReg <= byteIN; 
                        byteCount_i <= byteCount; 
                        TxReady_t <= '0'; 
                    else
                        TxReady_t <= '1'; 
                    end if ;
                when others =>
                    if (unsigned(TxCount) = 1) then                                                             -- sending last bit of current byte
                        MOSI_t <= byteReg(to_integer(unsigned(TxCount) - 1));                                   -- when using std_logic_vector as index for another std_logic_vector to_integer(unsigned(...)) necessary  
                        lBit <= '1'; 
                        if (unsigned(byteCount_i) = 1 and lBit = '1') then                                      -- if byteCount is one AND last bit has sent (lBit = '1') end Tx, else dec number of remaining bytes and Tx next 
                            TxCount <= "1000";
                            nxByte_t <= '0'; 
                            TxReady_t <= '1';
                            CS_t <= '1'; 
                            done <= '1';
                            lBit <= '0'; 
                        elsif (unsigned(byteCount_i) > 1) then                                                  -- when it is not the last byte being sent 
                            byteCount_i <= std_logic_vector(unsigned(byteCount_i) - 1); 
                            byteReg <= byteIN; 
                            TxCount <= "1000";
                        end if ;
                    elsif (unsigned(TxCount) = 8) then                                                          -- sending first bit of current byte 
                        CS_t <= '0'; 
                        MOSI_t <= byteReg(to_integer(unsigned(TxCount) - 1));  
                        TxCount <= std_logic_vector(unsigned(TxCount) - 1); 
                        if (unsigned(byteCount_i) > 1) then
                            nxByte_t <= '1';
                        end if ;
                    elsif (unsigned(TxCount) > 1) then                                                          -- sending second to second last bit of current byte 
                        MOSI_t <= byteReg(to_integer(unsigned(TxCount) - 1));  
                        TxCount <= std_logic_vector(unsigned(TxCount) - 1); 
                    end if ;
            end case ;
        end if ;
    end process ; -- output

    -- Signal to OUTs -- 
    CS <= CS_t;
    MOSI <= MOSI_t; 
    nxByte <= nxByte_t; 
    TxReady <= TxReady_t; 

end Behavioral;
