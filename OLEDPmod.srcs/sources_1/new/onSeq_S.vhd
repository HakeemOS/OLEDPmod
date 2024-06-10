----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hakeem S.
-- 
-- Create Date: 03/31/2024 09:56:04 AM
-- Design Name: 
-- Module Name: onSeq_S - Behavioral
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

entity onSeq_S is
    generic (N : integer := 8); 
    port (  clk : in std_logic; 
            rst : in std_logic;
            sw : in std_logic; 
            byteFlag : out std_logic; 
            OLEDPRst : out std_logic; 
            OLEDRdy : out std_logic;                                                                        -- signals to OLEDCtrl On/OFF seq complete 
            OLEDVbat : out std_logic;
            OLEDVddc : out std_logic; 
            DCOUT : out std_logic_vector;                                                                   -- vector of D/C bits following same index as array of bytes (i.e corresponding D/C bit of byte at pos 1 also at pos 1 of vector)
            byteCount : out std_logic_vector(3 downto 0); 
            OLEDByte : out byteArr
    );
end onSeq_S;

architecture Behavioral of onSeq_S is
    -- Constant --
constant c_Delay4us : std_logic_vector(11 downto 0) := x"18F";                                              -- constant = 399
constant c_Delay200ms :  std_logic_vector(27 downto 0) := x"1312CFF";                                       -- constant = 19,999,99 
    -- State Initialization --                  
type states is (idle, rstStt, s0, s1, s2, s3, s4, s5, s6);                                                  -- s0 -> s3 => On Seq; s4 - s6 => Off Seq           
signal stt: states := idle; 
    -- Signals --
signal powerOn : std_logic := '0'; 
signal powerOff : std_logic := '0'; 
signal running : std_logic := '0'; 
signal OLEDPRst_t : std_logic := '1';
signal OLEDRdy_t : std_logic := '0';
signal OLEDVbat_t : std_logic := '0'; 
signal OLEDVddc_t : std_logic := '0';  
signal byteFlag_t : std_logic := '0';
signal byteCount_t : std_logic_vector (3 downto 0) := (others => '0'); 
signal DCOUT_t : std_logic_vector(3 downto 0) := (others => '0');                                           -- length 4 vector limits number of D/C bits and therefore bytes OUT by this module to 4 
signal OLEDByte0_t : std_logic_vector(N-1 downto 0) := (others => '0');                                     -- byte to fill 0th position of OLEDByte byteArr
signal OLEDByte1_t : std_logic_vector(N-1 downto 0) := (others => '0');                                     -- byte to fill 1st position of OLEDByte byteArr; if only one byte is sent in final design remove this once simulating is complete 
--signal OLEDByteArr_t : byteArr (3 downto 0) := ( others => (others => '0'));                                -- another solution; create byte array and fill first position with on/off commands 
signal delay4us : std_logic_vector(11 downto 0) := (others => '0');      
signal delay200ms : std_logic_vector(27 downto 0) := (others => '0');   

begin
    -- Processes -- 
    trns : process( clk, rst, sw, stt, powerOn, powerOff, running, OLEDPRst_t, OLEDVddc_t, OLEDVbat_t, OLEDByte0_t, 
                    OLEDRdy_t  )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is
                    when rstStt => stt <= idle; 
                    when idle =>
                        if (powerOn = '1') then
                            stt <= s0; 
                        elsif (powerOff = '1') then
                            stt <= s4; 
                        else
                            stt <= idle;  
                        end if ;
                    when s0 =>
                        if (OLEDPRst_t = '1') then
                            stt <= s1; 
                        else
                            stt <= s0; 
                        end if ;
                    when s1 =>
                        if (OLEDVddc_t = '1' and OLEDVbat_t = '1') then
                            stt <= s2;
                        else
                            stt <= s1; 
                        end if ;
                    when s2 => stt <= s3; 
                    when s3 => 
                        if (OLEDRdy_t = '1') then
                            stt <= idle; 
                        --elsif () then
                            
                        else
                            stt <= s3; 
                        end if ;
                    when s4 => stt <= s5; 
                    when s5 => stt <= s6; 
                    when others =>
                        if (OLEDRdy_t = '0') then
                            stt <= idle; 
                        else 
                            stt <= s6; 
                        end if ;
                end case ;
            end if; 
        end if ;
    end process ; -- trns

    output : process( clk, stt, sw, powerOn, powerOff, running, OLEDPRst_t, OLEDVddc_t, OLEDVbat_t, OLEDByte0_t, 
                        OLEDRdy_t, delay4us, delay200ms )
    begin
        -- Sync Defaults --
        if rising_edge(clk) then
            byteFlag_t <= '0'; 
        end if ;
        
        case( stt ) is
            when rstStt => 
                powerOn <= '0'; 
                powerOff <= '0';
                running <= '0'; 
                OLEDPRst_t <= '1'; 
                OLEDVddc_t <= '0'; 
                OLEDVbat_t <= '0';
                OLEDRdy_t <= '0'; 
                byteCount_t <= (others => '0'); 
                DCOUT_t <= (others => '0'); 
                OLEDByte0_t <= (others => '0'); 
                delay4us <= (others => '0'); 
                delay200ms <= (others => '0'); 
            when idle =>
                delay4us <= (others => '0'); 
                delay200ms <= (others => '0'); 
                if (sw = '1' and running = '0') then
                    powerOn <= '1'; 
                    powerOff <= '0'; 
                    running <= '1'; 
                    OLEDPRst_t <= '0'; 
                elsif (sw = '0' and running = '1') then
                    powerOn <= '0'; 
                    powerOff <= '1'; 
                end if ;
            when s0 => 
                if (rising_edge(clk)) then
                    if (delay4us = c_Delay4us) then
                        OLEDPRst_t <= '1'; 
                        delay4us <= (others => '0'); 
                    else 
                        delay4us <= std_logic_vector(unsigned(delay4us) + 1); 
                    end if ;
                end if ;
            when s1 => 
                if (rising_edge(clk)) then
                    if (delay4us = c_Delay4us) then
                        OLEDVddc_t <= '1'; 
                        OLEDVbat_t <= '1'; 
                        delay4us <= (others => '0'); 
                    else 
                        delay4us <= std_logic_vector(unsigned(delay4us) + 1); 
                    end if ;
                end if ;
            when s2 => 
                OLEDByte0_t <= x"AF";                                                                       -- display on command 
                DCOUT_t <= "0000";                                                                          -- only one LSB meaningful data D/C = => command byte 
                --OLEDByteArr_t(0) <= x"AF";                                                                  -- display on command, byteArr signal method
                byteCount_t <= std_logic_vector(to_unsigned(1, 4));                                         -- must use to_unsigned(convertingInt, vectorLength) to cast a integer value on its own (called universal int) to a std_logic_vector 
                byteFlag_t <= '1'; 
            when s3 => 
                if (rising_edge(clk)) then
                    if (delay200ms = c_Delay200ms) then                                                     -- Once delay is finished we can signal to OLEDCtrl OLED is rdy to be used
                        OLEDRdy_t <= '1';
                        delay200ms <= (others => '0' ) ;    
                        powerOn <= '0';                                    
                    else 
                        delay200ms <= std_logic_vector(unsigned(delay200ms) + 1); 
                    end if ;
                end if ;
            when s4 => 
                OLEDByte0_t <= x"AE";                                                                       -- display off command     
                DCOUT_t <= "0000";                                                                          -- only one LSB meaningful data D/C = => command byte  
                --OLEDByteArr_t(0) <= x"AF";                                                                     -- display off commmand, byteArr signal method   
                byteCount_t <= std_logic_vector(to_unsigned(1, 4));
                byteFlag_t <= '1'; 
            when s5 => 
                OLEDVddc_t <= '0'; 
                OLEDVbat_t <= '0'; 
            when others =>
                if (rising_edge(clk)) then
                    if (delay200ms = c_Delay200ms) then
                        OLEDRdy_t <= '0';
                        delay200ms <= (others => '0' ) ;    
                        powerOff <= '0';      
                        running <= '0';                               
                    else 
                        delay200ms <= std_logic_vector(unsigned(delay200ms) + 1); 
                    end if ;
                end if ;
        end case ;
    end process ; -- output

    -- Signals to OUT -- 
    byteFlag <= byteFlag_t; 
    OLEDPRst <= OLEDPRst_t;
    OLEDRdy <= OLEDRdy_t; 
    OLEDVbat <= OLEDVbat_t;
    OLEDVddc <= OLEDVddc_t; 
    DCOUT <= DCOUT_t; 
    byteCount <= byteCount_t; 
    OLEDByte(0) <= (OLEDByte0_t); 
    OLEDByte(1) <= (OLEDByte1_t); 
    --OLEDByte <= OLEDByteArr_t; 

end Behavioral;
