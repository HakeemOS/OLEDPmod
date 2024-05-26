----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hakeem S.
-- 
-- Create Date: 05/21/2024 08:10:02 PM
-- Design Name: 
-- Module Name: OLEDCtrl_s - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: OLED Controller. ALl signals that reach the OLED are controlled and must pass through this module. SPI_Tx and byteBuffer_s also contained within this buffer  
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

library myLib; 
use myLib.types_p.all;                                                                  -- used for array of bytes to be used as IN

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OLEDCtrl_s is
    generic (N : integer := 8); 
    port (  clk : in std_logic; 
            sclkIN : in std_logic; 
            rst : in std_logic; 
            OLEDPRstIN : in std_logic;                                                          
            OLEDVddcIN : in std_logic; 
            OLEDVbatIN : in std_logic; 
            OLEDRdy : in std_logic;                                                             -- OLED can be used, onSeq is completed (when HI); OLED not available (when LOW)
            byteFlag : in std_logic;
            onOffFlag : in std_logic;                                                           -- onSeq byteFlag bit connected to this IN so CTRL knows ON/OFF command incoming    
            DCIN : in std_logic_vector; 
            byteCountIN : in std_logic_vector(3 downto 0);                                      -- number of bytes to Tx
            bytesIN : in byteArr;                                                               -- byte(s) to be Tx 
            sclkOUT : out std_logic; 
            OLEDPRstOUT : out std_logic; 
            OLEDVddcOUT : out std_logic; 
            OLEDVbatOUT : out std_logic; 
            DCOUT : out std_logic; 
            CS : out std_logic; 
            MOSI : out std_logic 
    );
end OLEDCtrl_s;

architecture Behavioral of OLEDCtrl_s is

    -- Components -- 
component byteBuffer_s is 
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
end component; 

component SPI_Tx is 
    generic (N : integer := 8);
    port (  clk : in std_logic;
            rst : in std_logic;  
            start : in std_logic; 
            byteCount : in std_logic_vector(3 downto 0);
            byteIN : in std_logic_vector(N-1 downto 0); 
            MOSI : out std_logic; 
            CS : out std_logic; 
            nxByte : out std_logic; 
            TxReady : out std_logic
    );
end component; 

    -- Constants --
    -- State Initialization --  
type state is (rstStt, idle, tx); 
signal stt : state := idle; 
    -- Signals --                                                                       -- for signals; i => inReg, w => wire, t => tempReg (for out)
signal byteFlag_i : std_logic := '0';                                                   
signal byteFlag_w : std_logic := '0'; 
signal byteSel : std_logic := '0'; 
signal done : std_logic := '0'; 
signal nxByte_w : std_logic := '0'; 
signal OLEDPRst_t : std_logic := '1';
signal OLEDVddc_t : std_logic := '0'; 
signal OLEDVbat_t : std_logic := '0'; 
signal DCOUT_t : std_logic := '0';
signal DCOUT_w : std_logic := '0'; 
signal CS_t : std_logic := '0'; 
signal MOSI_t : std_logic := '0'; 
signal rdy_w : std_logic := '0'; 
signal startOUT_w : std_logic := '0'; 
signal TxReady_w : std_logic := '0'; 
signal TxFlag := std+logic := '0'; 
signal byteCountIN_i : std_logic_vector(3 downto 0) := (others => '0'); 
signal byteCountIN_w : std_logic_vector(3 downto 0) := (others => '0'); 
signal byteCountINDummy : std_logic_vector(3 downto 0) := (others => '0');  
signal byteCountOUT_w : std_logic_vector(3 downto 0) := (others => '0');
signal byteOUT_w : std_logic_vector (N-1 downto 0) := (others => '0'); 
signal DCIN_i : std_logic_vector(9 downto 0) := (0 => '1', others => '0'); 
signal DCIN_w : std_logic_vector(9 downto 0) := (others => '0'); 
signal DCINDummy : std_logic_vector(9 downto 0) := (others => '0'); 
signal bytesIN_i : byteArr (9 downto 0) := (others => (others => '0')); 
signal bytesIN_w : byteArr (9 downto 0) := (others => (others => '0')); 
signal bytesINDummy : byteArr (9 downto 0) := (others => (others => 'z'));

begin
    -- IN to signal --
    OLEDPRst_t <= OLEDPRstIN;
    OLEDVddc_t <= OLEDVddcIN; 
    OLEDVbat_t <= OLEDVbatIN; 
    byteSel <= onOffFlag; 
    byteCountIN <= byteCountIN_i; 
    bytesIN_i <= bytesIN; 

    -- MUXs --
    bytesIN_w <= bytesIN_i when byteSel else bytesINDummy;                              -- select bytes from onSeq when onSeq byteFlag goes high else select internal byte source
    byteCountIN_w <= byteCountIN_i when byteSel else byteCountINDummy;                  -- same as above but for byte count 
    DCIN_w <= DCIN_i when bytesel else DCINDummy;                                       -- same as above but for D/C vector; DCIN+i initialized to what onSeq default is, when reset or after used by another potential module, returns to default of LSB = '1'

    BB0 : byteBuffer_s 
    generic map (
        N => 8   
    )
    port map (
        clk => clk, 
        rst => rst, 
        -- startRdy => startRdy_w, 
        byteFlag => byteFlag_w,
        TxReady => TxReady_w, 
        nxByte => nxByte_w, 
        byteCountIN => byteCountIN_w,  
        DCIN => DCIN_w, 
        bytesIN => bytesIN_w,  
        rdy => rdy_w, 
        startOUT => startOUT_w,
        DCOUT => DCOUT_w,  
        byteCountOUT => byteCountOUT_w, 
        byteOUT => byteOUT_w
    ); 

    SPI0 : SPI_Tx 
    generic map (
        N => 8
    )
    port map (
            clk => sclkIN, 
            rst => rst, 
            start => startOUT_w, 
            byteCount => byteCountOUT_w,
            byteIN => byteOUT_w,  
            MOSI => MOSI_t,
            CS => CS_t, 
            nxByte => nxByte_w, 
            TxReady => TxReady_w
    ); 

    trns : process( clk, rst, stt )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is
                    when rstStt => stt <= idle; 
                    when idle => 
                        if (TxFlag = '1') then
                            stt <= tx; 
                        else
                            stt <= idle;
                        end if ;
                    when others =>
                        if (expression) then
                            
                        end if ;
                end case ;
            end if ;
        end if ;
        
    end process ; -- trns

    ouitput : process( clk, rst, stt )
    begin
        
    end process ; -- ouitput
    

    -- Signal to OUT --
    sclkOUT <= sclkIN; 
    OLEDPRstOUT <= OLEDPRst_t;
    OLEDVddcOUT <= OLEDVddc_t; 
    OLEDVbatOUT <= OLEDVbat_t; 
    DCOUT <= DCOUT_t; 
    CS <= CS_t; 
    MOSI <= MOSI_t; 



end Behavioral;
