----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hakeem S. 
-- 
-- Create Date: 04/29/2024 06:17:46 PM
-- Design Name: 
-- Module Name: byteBuffer_s - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
use IEEE.NUMERIC_STD.ALL;

library myLib; 
use myLib.types_p.all;                                                                  -- used for array of bytes to be used as IN

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity byteBuffer_s is
    generic (N : integer := 8); 
    port (  clk : in std_logic;  
            rst : in std_logic; 
            -- startRdy : in std_logic;                                                    -- indicates all bytes recieved; Ready to start Tx  
            byteFlag : in std_logic;                                                    -- byte(s) are ready to be captured in buffer
            TxReady : in std_logic;                                                     -- SPI_Tx ready to Tx 
            nxByte : in std_logic;                                                      -- SPI_Tx ready for next byte in current data/command sequence 
            byteCountIN : in std_logic_vector(3 downto 0);                              -- number of bytes to Tx 
            DCIN : in std_logic_vector;                                                 -- all data/command bits for each byte In
            bytesIN : in byteArr;                                                       -- all bytes to be Tx by SPI_Tx for specific command or data 
            rdy : out std_logic;                                                        -- flag for other modules to see buffer can receive 
            startOUT : out std_logic;                                                   -- start signal sent to SPI_Tx
            DCOUT: out std_logic;                                                       -- current data/command bit to be Tx
            byteCountOUT : out std_logic_vector(3 downto 0); 
            byteOUT : out std_logic_vector(N-1 downto 0)                                -- current byte to be Tx
    );
end byteBuffer_s;

architecture Behavioral of byteBuffer_s is

    -- Constants --
constant MaxBytes : integer := 10;                                                       -- Max number of bytes stored in buffer

    -- State Initialization --
type state is (rstStt, idle, lx, sx);                                                   -- lx = ld = load; sx = snd = send 
signal stt : state := idle;  
    -- Signals --
signal nByteCount : integer range 0 to MaxBytes := 0;                                   -- byteCount Index as integer; n indicates integer; nl is natural  
signal lxFlag : std_logic := '0'; 
signal lxDone : std_logic := '0';   
signal sxFlag : std_logic := '0';   
signal sxDone : std_logic := '0';   
signal oneByte : std_logic := '0';                                                      -- for special case; only one byte to buffer
signal rdy_t : std_logic := '1';                                                 
signal startOUT_t : std_logic := '0'; 
signal DCOUT_t : std_logic := '0'; 
signal byteCountIN_i : std_logic_vector(3 downto 0) := (others => '0');                 -- Used for keeping track of bytes recieved and ensuring same amount of bytes sent (and accomponying D/C bits)
signal byteCountOUT_t : std_logic_vector(3 downto 0) := (others => '0');
signal byteOUT_t : std_logic_vector(N-1 downto 0) := (others => '0'); 
signal DCIN_i : std_logic_vector(9 downto 0) := (others => '0');                        -- since default max bytes stored is 10, 10 bit vector to store each of the accompanying D/C bits 
signal bytesIN_i : byteArr(9 downto 0) := (others => (others => '0'));                 -- For now default max number of bytes stored is 10; 


begin
    trns : process( clk, rst, stt )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is
                    when rstStt => stt <= idle;
                    when idle =>
                        if (lxFlag = '1') then
                            stt <= lx; 
                        else
                            stt <= idle; 
                        end if ;
                    when lx =>
                        if (lxDone = '1' or oneByte = '1') then
                            stt <= sx; 
                        else
                            stt <= lx; 
                        end if ;                               
                    when others =>
                        if (sxDone = '1') then
                            if (byteFlag = '1') then
                                stt <= lx; 
                            else
                                stt <= idle; 
                            end if ;
                        else
                            stt <= sx; 
                        end if ;
                end case ;
            end if ;
        end if ;
        
    end process ; -- trns

    output : process( clk, rst, stt)
    begin
        if (rising_edge(clk)) then
            -- Defaults --
            lxFlag <= '0'; 
            lxDone <= '0'; 
            startOUT_t <= '0'; 

            case( stt ) is
                when rstStt =>
                    lxDone <= '0'; 
                    sxDone <= '0';
                    rdy_t <= '1'; 
                    startOUT_t <= '0'; 
                    DCOUT_t <= '0'; 
                    byteCountIN_i <= (others => '0'); 
                    byteCountOUT_t <= (others => '0');
                    byteOUT_t <= (others => '0');
                    DCIN_i <= (others => '0'); 
                    bytesIN_i <= (others => (others => '0'));
                when idle =>
                    rdy_t <= '1';                                                       -- rdy doesnt have to be high right at start of idle state since SPI_Tx will still be TX once buffer is idle for about 3-4 cycles
                    if (byteFlag = '1') then
                        byteCountIN_i <= byteCountIN;
                        nByteCount <= to_integer(unsigned(byteCountIN)); 
                        lxFlag <= '1'; 
                        if (unsigned(byteCountIN) = 1) then                             -- for special case; if only one byte in set oneByte Hi (used to flag lx state to load for 1 cycle only)
                            oneByte <= '1'; 
                        end if ;
                    else
                        lxFlag <= '0'; 
                    end if ;
                when lx =>
                    rdy_t <= '0';                                                       -- rdy = 0 indicates buffer is loading/sending data already, cannot load more
                    if (nByteCount = 2) then                                            -- set lxDone on second last byte load, one extra byte load occurs while lxDone is being detected by trns proc
                        bytesIN_i(nByteCount - 1) <= bytesIN(nByteCount - 1); 
                        DCIN_i(nByteCount - 1) <= DCIN(nByteCount - 1); 
                        nByteCount <= nByteCount - 1; 
                        lxDone <= '1'; 
                    elsif (nByteCount > 1) then                                         -- normal lx of bytes and D/C bits
                        bytesIN_i(nByteCount - 1) <= bytesIN(nByteCount - 1); 
                        DCIN_i(nByteCount - 1) <= DCIN(nByteCount - 1); 
                        nByteCount <= nByteCount - 1; 
                    elsif (oneByte = '1') then                                          -- for special case; if only one byte to buffer store byte in byteArr(0) and D/C in DCIN(0) and stt trns; 
                        oneByte <= '0'; 
                        bytesIN_i(nByteCount - 1) <= bytesIN(nByteCount - 1); 
                        DCIN_i(nByteCount - 1) <= DCIN(nByteCount - 1); 
                    else                                                                -- occurs on last cycle 
                        bytesIN_i(nByteCount - 1) <= bytesIN(nByteCount - 1); 
                        DCIN_i(nByteCount - 1) <= DCIN(nByteCount - 1);                                             
                        nByteCount <= to_integer(unsigned(byteCountIN_i));  
                    end if ;
                when others =>
                    byteCountOUT_t <= byteCountIN_i; 
                    if (sxFlag = '1' and nByteCount = 0) then                           -- last byte has been sent to SPI_Tx; sending flag => low, sending done => hi 
                        sxFlag <= '0'; 
                        sxDone <= '1'; 
                    elsif (sxFlag = '1' and nxByte = '1') then                          -- SPI signals ready for next byte 
                        byteOUT_t <= bytesIN_i(nByteCount - 1); 
                        DCOUT_t <= DCIN_i(nByteCount - 1); 
                        nByteCount <= nByteCount - 1;                                   -- dec index used for selecting byte to send in byteArr
                    elsif (TxReady = '1' and sxFlag = '0') then                         -- to start sending signal, put byteOUT and associated D/C signal on busses, send start signal to SPI_Tx Module; this should become an elsif i believe 
                        byteOUT_t <= bytesIN_i(nByteCount - 1); 
                        DCOUT_t <= DCIN_i(nByteCount - 1); 
                        startOUT_t <= '1'; 
                        sxFlag <= '1'; 
                        nByteCount <= nByteCount - 1;                                   -- dec index used for selecting byte to send in byteArr
                    else                                                                -- waiting for SPI_Tx to be ready
                        null; 
                    end if ;
            end case ;
        end if ;
    end process ; -- output

    -- Signal to OUTs --
    rdy <= rdy_t; 
    startOUT <= startOUT_t; 
    DCOUT <= DCOUT_t; 
    byteCountOUT <= byteCountOUT_t; 
    byteOUT <= byteOUT_t; 

end Behavioral;
