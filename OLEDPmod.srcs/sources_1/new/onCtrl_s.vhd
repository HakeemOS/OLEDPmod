----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2024 09:29:28 AM
-- Design Name: 
-- Module Name: onCtrl_s - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Drives on and off sequence required to turn on/off the OLED to OLEDctrlr
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
use IEEE.NUMERIC_STD.ALL;                                                                                   -- used for incrementing vector (unsigned())

library myLib;                  
use myLib.types_p.all;                                                                                      -- used for array of bytes to be used as IN

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity onCtrl_s is
    generic (M : integer := 10);                                                                            -- Max buffer size 
    port (  clk : in std_logic; 
            rst : in std_logic;
            sw : in std_logic; 
            byteFlag : out std_logic;
            offCmd : out std_logic;                                                                         -- Used to hold srcSel so out command actually captured  
            OLEDPRst : out std_logic; 
            OLEDRdy : out std_logic;                                                                        -- signals to OLEDCtrl On/OFF seq complete 
            OLEDVbat : out std_logic;
            OLEDVddc : out std_logic; 
            rdyFlag : out std_logic;                                                                        -- in sync with OLEDRdy; drives OUT LED when OLEDRdy HI
            DC : out std_logic_vector;                                                                      -- vector of D/C bits following same index as array of bytes (i.e corresponding D/C bit of byte at pos 1 also at pos 1 of vector)
            byteCount : out std_logic_vector(3 downto 0); 
            OLEDBytes : out byteArr
    );
end onCtrl_s;

architecture Behavioral of onCtrl_s is
    -- Constants -- 
constant c_Delay2ms : std_logic_vector(19 downto 0) := x"30D40"; 
constant c_Delay100ms : std_logic_vector(23 downto 0) := x"98967F";  
    -- State Initialization --
type states is (idle, rstStt, rdyStt, s0, s1, s2, s3, s4, s5, s6 ); 
signal stt : states := idle; 
    -- Signals -- 
signal byteFlag_t : std_logic := '0';
signal offCmdFlag : std_logic := '0'; 
signal OLEDPRst_t : std_logic := '1';
signal OLEDRdy_t : std_logic := '0';
signal OLEDVbat_t : std_logic := '1'; 
signal OLEDVddc_t : std_logic := '1'; 
signal powerOn : std_logic := '0'; 
signal powerOff : std_logic := '0'; 
signal rdyFlag_t : std_logic :='0';                                                                                     -- in sync with OLEDRdy; drives OUT LED when OLEDRdy HI
signal rstDone : std_logic := '0';      
signal running : std_logic := '0';  
signal sttFlag : std_logic := '0';  
signal byteCount_t : std_logic_vector (3 downto 0) := (others => '0');  
signal DC_t : std_logic_vector(M-1 downto 0) := (others => '0');                                                        -- length 4 vector limits number of D/C bits and therefore bytes OUT by this module to 4        
signal delay2ms : std_logic_vector(19 downto 0) := (0 => '1', others => '0');  
signal delay100ms : std_logic_vector(23 downto 0) := (others => '0'); 
signal OLEDBytes_t : byteArr(M-1 downto 0) := (others => (others => '0')); 

begin
    -- Processes -- 
    trns : process( clk, rst, stt, sw )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is 
                    when rstStt => 
                        if (rstDone = '1') then
                            stt <= idle;
                        else 
                            stt <= rstStt;
                        end if ;
                    when idle => 
                        if (powerOn = '1') then
                            stt <= s0; 
                        elsif (powerOff = '1') then
                            stt <= s6; 
                        else 
                            stt <= idle; 
                        end if ;
                    when s0 => 
                        if (sttFlag = '1') then
                            stt <= s1; 
                        else 
                            stt <= s0; 
                        end if ;
                    when s1 => stt <= s2; 
                    when s2 =>
                        if (sttFlag = '1') then
                            stt <= s3; 
                        else 
                            stt <= s2; 
                        end if ;
                    when s3 => 
                        if (sttFlag = '1') then
                            stt <= s4; 
                        else 
                            stt <= s3; 
                        end if ;
                    when s4 => stt <= s5; 
                    when s5 =>
                        if (sttFlag = '1') then
                            stt <= rdyStt; 
                        else
                            stt <= s5; 
                        end if ;
                    when rdyStt =>
                        if (sttFlag = '1') then
                            stt <= idle; 
                        else 
                            stt <= rdyStt; 
                        end if ;
                    when others =>
                        if (sttFlag = '1') then
                            stt <= rdyStt;
                        else
                            stt <= s6; 
                        end if ;
                end case ;
            end if ;
        end if ;
    end process ; -- 
    

    output  : process( clk, rst, stt )
    begin
        if (rising_edge(clk)) then
            -- Sync Defaults -- 
            byteFlag_t <= '0'; 
            powerOff <= '0'; 
            powerOn <= '0'; 
            sttFlag <= '0'; 

            case( stt ) is
                when rstStt =>
                    byteFlag_t <= '0'; 
                    OLEDPRst_t <= '1';
                    OLEDRdy_t <= '0';
                    OLEDVbat_t <= '1';
                    OLEDVddc_t <= '1';
                    powerOn <= '0';
                    powerOff <= '0';
                    rdyFlag_t <= '0';
                    running <= '0';
                    byteCount_t <= (others => '0'); 
                    DC_t <= (others => '0'); 
                    delay2ms <= (0 => '1', others => '0');  
                    delay100ms <= (others => '0'); 
                    OLEDBytes_t <= (others => (others => '0')); 
                    rstDone <= '1'; 
                when idle => 
                    rstDone <= '0';
                    OLEDVddc_t <= '0';  
                    delay2ms <= (0 => '1', others => '0');  
                    delay100ms <= (others => '0'); 
                    if (running = '0' and sw = '1') then                                                                -- On state machine activated; must be "OFF"                         
                        running <= '1';     
                        powerOn <= '1';     
                    elsif (running = '1' and sw = '0') then                                                             -- Off state activated; must be "ON" 
                        powerOff <= '1';    
                    end if ;    
                when s0 =>  
                    if (delay2ms = c_Delay2ms) then 
                        OLEDBytes_t(0) <= x"AE";                                                                        -- OFF command 
                        DC_t <= (others => '0'); 
                        byteCount_t <= std_logic_vector(to_unsigned(1, 4));                                             -- must use to_unsigned(convertingInt, vectorLength) to cast a integer value on its own (called universal int) to a std_logic_vector 
                        byteFlag_t <= '1'; 
                        delay2ms <= (others => '0'); 
                        sttFlag <= '1'; 
                    else
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);  
                    end if ;
                when s1 => 
                    OLEDPRst_t <= '0'; 
                when s2 => 
                    if (delay2ms = c_Delay2ms) then
                        OLEDPRst_t <= '1'; 
                        delay2ms <= (others => '0'); 
                        sttFlag <= '1'; 
                    else
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);
                    end if ;
                when s3 => 
                    if (delay2ms = c_Delay2ms) then
                        OLEDBytes_t(3 downto 0) <= (x"8D", x"14", x"D9", x"F1");                                        -- Configure Charge Pump (1 & 2), Configure Pre-charge (3 & 4) commands; Byte Data sent MSByte to LSByte  
                        DC_t <= (others => '0');  
                        byteCount_t <= std_logic_vector(to_unsigned(4, 4)); 
                        byteFlag_t <= '1'; 
                        delay2ms <= (others => '0'); 
                        sttFlag <= '1'; 
                    else
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);
                    end if ;   
                when s4 => OLEDVbat_t <= '0'; 
                when s5 =>
                    if (delay100ms = c_Delay100ms) then
                        OLEDBytes_t(6 downto 0) <= (x"81", x"FF", x"A0", x"C0", x"DA", x"00", x"AF");                   -- Set Contrast (1 & 2), Set Segment Remap (3), Set Scan Dir (4), Set COM Pin (5 & 6), ON (7) commands   
                        DC_t <= (others => '0');  
                        byteCount_t <= std_logic_vector(to_unsigned(7, 4)); 
                        byteFlag_t <= '1'; 
                        delay100ms <= (others => '0');
                        sttFlag <= '1'; 
                    else
                        delay100ms <= std_logic_vector(unsigned(delay100ms) + 1);
                    end if ;   
                when rdyStt => 
                    if ((delay2ms = c_Delay2ms) and running = '0') then
                            OLEDRdy_t <= '0';                                                                               -- Once delay is finished and commands are sent we can signal to OLEDCtrl OLED is no longer ready
                            rdyFlag_t <= '0';
                            offCmdFlag <= '0'; 
                            delay2ms <= (others => '0'); 
                            sttFlag <= '1'; 
                    elsif ((delay2ms = c_Delay2ms) and running = '1') then
                            OLEDRdy_t <= '1';                                                                               -- Once delay is finished and commands are sent we can signal to OLEDCtrl OLED is rdy to be used
                            rdyFlag_t <= '1';
                            delay2ms <= (others => '0'); 
                            sttFlag <= '1'; 
                    else
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);
                    end if ;
                when others => 
                    if (delay2ms = c_Delay2ms) then
                        delay2ms <= (others => '0'); 
                        running <= '0';
                        --byteFlag_t <= '1'; 
                        sttFlag <= '1'; 
                    elsif (offCmdFlag = '0') then                                                                           -- send Off Command before 2ms delay
                        OLEDBytes_t(6 downto 0) <= (x"00", x"00", x"00", x"00", x"00", x"00", x"AE");                       -- Send OFF Command when switch OFF
                        DC_t <= (others => '0'); 
                        byteCount_t <= std_logic_vector(to_unsigned(1, 4)); 
                        byteFlag_t <= '1'; 
                        offCmdFlag <= '1';  
                    else 
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);
                    end if ;
                    
            end case ;
        end if ;
    end process ; -- output 

    -- Signals to OUT -- 
    byteFlag <= byteFlag_t; 
    offCmd <= offCmdFlag; 
    OLEDPRst <= OLEDPRst_t; 
    OLEDRdy <= OLEDRdy_t; 
    OLEDVbat <= OLEDVbat_t; 
    OLEDVddc <= OLEDVddc_t; 
    rdyFlag <= rdyFlag_t; 
    DC <= DC_t; 
    byteCount <= byteCount_t; 
    OLEDBytes <= OLEDBytes_t; 

end Behavioral;
