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
use IEEE.NUMERIC_STD.ALL;

library myLib; 
use myLib.types_p.all;                                                                                                      -- used for array of bytes to be used as IN

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
            OLEDRdy : in std_logic;                                                                                         -- OLED can be used, onSeq is completed (when HI); OLED not available (when LOW)
            byteFlag : in std_logic;                            
            onOffFlag : in std_logic;                                                                                       -- onSeq byteFlag bit connected to this IN so CTRL knows ON/OFF command incoming    
            DCIN : in std_logic_vector;                             
            byteCountIN : in std_logic_vector(3 downto 0);                                                                  -- number of bytes to Tx
            bytesIN : in byteArr;                                                                                           -- byte(s) to be Tx 
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
            -- startRdy : in std_logic;                                                                                        -- indicates all bytes recieved; Ready to start Tx  
            byteFlag : in std_logic;                                                                                        -- byte(s) are ready to be captured in buffer
            TxReady : in std_logic;                                                                                         -- SPI_Tx ready to Tx 
            nxByte : in std_logic;                                                                                          -- SPI_Tx ready for next byte in current data/command sequence 
            byteCountIN : in std_logic_vector(3 downto 0);                                                                  -- number of bytes to Tx 
            DCIN : in std_logic_vector;                                                                                     -- all data/command bits for each byte In
            bytesIN : in byteArr;                                                                                           -- all bytes to be Tx by SPI_Tx for specific command or data 
            rdy : out std_logic;                                                                                            -- flag for other modules to see buffer can receive 
            startOUT : out std_logic;                                                                                       -- start signal sent to SPI_Tx
            DCOUT: out std_logic;                                                                                           -- current data/command bit to be Tx
            byteCountOUT : out std_logic_vector(3 downto 0);                                    
            byteOUT : out std_logic_vector(N-1 downto 0)                                                                    -- current byte to be Tx
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
    -- Signals --                                                                                                           -- for signals; i => inReg, w => wire, t => tempReg (for out)
signal byteFlag_i : std_logic := '0';                                                                                       -- might delete; currently redundant                                                                    
signal byteFlag_w : std_logic := '0';                       
signal byteSel : std_logic_vector(1 downto 0) := (others => '0');                                                           -- used as sel vector for mux controlling IN bus; comprised of onOffFlag and byteFlag IN
signal done : std_logic := '0';                         
signal nxByte_w : std_logic := '0';                         
signal OLEDPRst_t : std_logic := '1';                       
signal OLEDVddc_t : std_logic := '0';                       
signal OLEDVbat_t : std_logic := '0';                       
signal DCOUT_t : std_logic := '0';                      
signal DCOUT_w : std_logic := '0';                      
signal CS_t : std_logic := '1';                         
signal MOSI_t : std_logic := '0';                       
signal rdy_w : std_logic := '0';                        
signal running : std_logic := '0';                  
signal startOUT_w : std_logic := '0';                       
signal TxReady_w : std_logic := '0';                        
signal TxFlag : std_logic := '0';                                                                                           -- Flag signals Tx is to occur
signal byteCountIN_i : std_logic_vector(3 downto 0) := (others => '0');                                                     -- reg for byteCount IN (byte count received from outside module)
signal byteCountIN_w : std_logic_vector(3 downto 0) := (others => '0');                                                     -- wire for byteCount wire; read by byteBuffer; either IN or internal byte count 
signal byteCountINDummy : std_logic_vector(3 downto 0) := (others => '0');                                                  -- place holder for internal byteCount vector; probably to become ocByteCount (OLEDCtrlByteCount)
signal byteCountOUT_w : std_logic_vector(3 downto 0) := (others => '0');                                                    -- wire for byte count output by buffer (one at a time) IN to SPI_Tx 
signal LxCount : std_logic_vector(3 downto 0) := (others => '0');                                                           -- byteCount in index used for loading bytes external bytes into bytesCount_i
signal ocByteCount : std_logic_vector(3 downto 0) := (others => '0');                                                       -- permanent replacement for Dummy byteCount
signal TxCount : std_logic_vector(3 downto 0) := "1000";                                                                    -- count of bits being transmitted 
signal byteOUT_w : std_logic_vector (N-1 downto 0) := (others => '0');                                                      -- wire byte out by buffer to IN of SPI_Tx
signal DCIN_i : std_logic_vector(9 downto 0) := (0 => '0', others => '0');                                                  -- reg for D/C command vector; stores D/C bit to be Tx'd with complementary byte (command = 0, data = 1)
signal DCIN_w : std_logic_vector(9 downto 0) := (others => '0');                                                            -- wire for D/C commeand vect OUT by buffer to be sent by OLEDCTrl in syc with associated byte every first bit
signal DCINDummy : std_logic_vector(9 downto 0) := (others => '0');                                                         -- place holder for internal D/C command vect 
signal bytesIN_i : byteArr (9 downto 0) := (others => (others => '0'));                                                     -- reg for arr of bytes to be sent from source external to OLEDCtrl (i.e onSeq)
signal bytesIN_w : byteArr (9 downto 0) := (others => (others => '0'));                                                     -- bus for bytes to IN bytebuffer; mux selects between bytes from external and internal source 
signal bytesINDummy : byteArr (9 downto 0) := (others => (others => 'Z'));                                                  -- place holder for internal arr of bytes 

begin                       
    -- IN to signal --                      
    OLEDPRst_t <= OLEDPRstIN;                       
    OLEDVddc_t <= OLEDVddcIN;                       
    OLEDVbat_t <= OLEDVbatIN;                     
    --byteSel <= onOffFlag & byteFlag;                                                                                      -- will need some tweaking*; first tweak complete; setting this as sync reg for now                 
    byteCountIN_i <= (others => '0') when (stt = rstStt) else byteCountIN;                                                  -- reset for reg controlled by sync state machine 
    running <= OLEDRdy;                                                                                                     -- OLEDCtrl native flag that signal whether or not OLED is on (and therefore can receive data/commands)

    -- MUXs --                      
    bytesIN_w <= bytesIN_i when (byteSel = "10" or byteSel = "01") else bytesINDummy;                                       -- select bytes from onSeq when onSeq byteFlag goes high else select internal byte source
    byteCountIN_w <= byteCountIN_i when (byteSel = "10" or byteSel = "01") else byteCountINDummy;                           -- same as above but for byte count 
    DCIN_w <= DCIN_i when (byteSel = "10" or byteSel = "01") else DCINDummy;                                                -- same as above but for D/C vector; DCIN+i initialized to what onSeq default is, when reset or after used by another potential module, returns to default of LSB = '1'

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
                        if ( done = '1') then                   
                            stt <= idle;                    
                        else                    
                            stt <= tx;                  
                        end if ;                    
                end case ;                  
            end if ;                    
        end if ;                    

    end process ; -- trns                   

    output : process( sclkIN, rst, stt )                                                                                    -- Use start signal and 8 bit count with sclk to control dcout to OLED in tx state 0
    begin           
       
        if (falling_edge(sclkIN)) then                  
            case( stt ) is                  
                when rstStt =>                  
                    byteFlag_i <= '0';                                                                                      -- currently redundant signal; may be removed               
                    done <= '0';                    
                    --nxByte_w <= '0';                                                                                      -- wire in purest sense; should not be controlled                                  
                    DCOUT_t <= '0';                 
                    --DCOUT_w <= '0';                                                                                       -- wire in purest sense; should not be controlled
                    --CS_t <= '1';                                                                                          -- wire in purest sense; should not be controlled
                    --MOSI_t <= '0';                                                                                        -- wire in purest sense; should not be controlled          
                    --startOUT_w <= '0';                                                                                    -- wire in purest sense; should not be controlled
                    --TxReady_w <= '0';                                                                                     -- wire in purest sense; should not be controlled
                    TxFlag <= '0';                                                     
                    byteCountINDummy <= (others => '0');                                                                    -- will probably be removed and placed in another process 
                    --byteCountOUT_w <= (others => '0');                                                                    -- wire in purest sense; should not be controlled           
                    ocByteCount <= (others => '0');                     
                    TxCount <= "1000";                  
                    --byteOUT_w <= (others => '0');                                                                         -- wire in purest sense; should not be controlled            
                    DCINDummy <= (others => '0');                                                                           -- will probably be removed and placed in another process 
                    bytesINDummy <= (others => (others => 'Z'));                                                            -- will probably be removed and placed in another process 
                when idle =>                    
                    if (startOUT_w = '1') then                  
                        TxFlag <= '1';                  
                        ocByteCount <= byteCountOUT_w;                  
                    else                    
                        TxFlag <= '0';                  
                    end if ;                    
                when others =>   
                    TxFlag <= '0';                                                                                          -- Lower Tx Flag once Tx state reached                
                    if (unsigned(ocByteCount) = 0) then                                                                     -- as soon as last D/C bit Tx'd, move to idle state 
                        done <= '1';                                
                    else                        
                        if (unsigned(TxCount) = 1) then                                                                     -- once 8 cycles, reset TxCount
                            TxCount <= "1000";                      
                        elsif (unsigned(TxCount) = 8) then                                                                  -- on first cycle, send D/C bit, dec TxCount and ocByteCount so if ocBC = 0 move to idle immediately           
                            DCOUT_t <= DCOUT_w;                                 
                            TxCount <= std_logic_vector(unsigned(TxCount) - 1);                         
                            ocByteCount <= std_logic_vector(unsigned(ocByteCount) - 1);                         
                        else                                                                                                -- cycles 2 -> 7; dec TxCount 
                            TxCount <= std_logic_vector(unsigned(TxCount) - 1);                                 
                        end if ;                    
                    end if ;                    
            end case ;                  
        end if ;                    

    end process ; -- ouitput                    

    LxProc : process( clk, rst )                                                                                            -- load bytesIN into bytesIN_i; this proc allows for variable bytesIN; rdy_w can be added to this proc to ensure buffer is ready to receive; probably need to set lxCount but not decrement until rdy 
    begin                   
        -- Sync Defaults --
        if (rising_edge(clk)) then
            byteFlag_w <= '0'; 
        end if ;
        
        
        if (rising_edge(clk)) then                                                                                          -- signals can only be acted on by one proc therefore two signal set in this proc must be reset in this proc
            if (stt = rstStt) then
                byteFlag_w <= '0'; 
                byteSel <= (others => '0');                                                                             
                LxCount <= (others => '0'); 
                DCIN_i <= (0 => '0', others => '0');                                                                    -- Default setting is fill with 0s which indicate commmands; keep this format for future reference            
                bytesIN_i <= (others => (others => '0'));   
            else
                if (unsigned(LxCount) = 1) then                                                                             -- Special case; when final byte loaded into bytesIN_i raise byteFlag wire to signal byteBuffer can capture
                    bytesIN_i(to_integer(unsigned(LxCount) - 1)) <= bytesIN(to_integer(unsigned(LxCount) - 1 )); 
                    DCIN_i(to_integer(unsigned(LxCount) - 1)) <= DCIN(to_integer(unsigned(LxCount) - 1)); 
                    LxCount <= std_logic_vector(unsigned(LxCount) - 1); 
                    byteFlag_w <= '1'; 
                elsif (unsigned(LxCount) > 0) then                                                                          -- normal loading 
                    bytesIN_i(to_integer(unsigned(LxCount) - 1)) <= bytesIN(to_integer(unsigned(LxCount) - 1 )); 
                    DCIN_i(to_integer(unsigned(LxCount) - 1)) <= DCIN(to_integer(unsigned(LxCount) - 1)); 
                    LxCount <= std_logic_vector(unsigned(LxCount) - 1); 
                elsif ((onOffFlag = '1') or (byteFlag = '1')) then
                    LxCount <= byteCountIN; 
                    byteSel <= onOffFlag & byteFlag;                                                                        -- currently having byteSel act as reg that stores both onOffFlag and byteFlag current values when one of them goes high
                end if ;
            end if ;
        end if ;
    end process ; -- LxProc
    
    -- Signal to OUT --
    sclkOUT <= sclkIN; 
    OLEDPRstOUT <= OLEDPRst_t;
    OLEDVddcOUT <= OLEDVddc_t; 
    OLEDVbatOUT <= OLEDVbat_t; 
    DCOUT <= DCOUT_t; 
    CS <= CS_t; 
    MOSI <= MOSI_t; 



end Behavioral;
