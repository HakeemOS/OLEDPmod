----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2024 12:31:11 PM
-- Design Name: 
-- Module Name: initSeq_s - Behavioral
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

entity initSeq_s is
    generic (M : integer := 10);                                                                            -- Max buffer size 
    port (  clk : in std_logic; 
            rst : in std_logic;
            sw : in std_logic; 
            byteFlag : out std_logic; 
            OLEDPRst : out std_logic; 
            OLEDRdy : out std_logic;                                                                        -- signals to OLEDCtrl On/OFF seq complete 
            OLEDVbat : out std_logic;
            OLEDVddc : out std_logic; 
            rdyFlag : out std_logic;                                                                        -- in sync with OLEDRdy; drives OUT LED when OLEDRdy HI
            DCOUT : out std_logic_vector;                                                                   -- vector of D/C bits following same index as array of bytes (i.e corresponding D/C bit of byte at pos 1 also at pos 1 of vector)
            byteCount : out std_logic_vector(3 downto 0); 
            OLEDBytes : out byteArr
    );
end initSeq_s;

architecture Behavioral of initSeq_s is
    -- Constants -- 
constant c_Delay2ms : std_logic_vector(19 downto 0) := x"30D3F"; 
constant c_Delay100ms : std_logic_vector(15 downto 0) := x"270F";  
    -- State Initialization --
type states is (idle, rstStt, s0, s1, s2, s3, s4, s5 ); 
signal stt : states := idle; 
    -- Signals -- 
signal byteFlag_t : std_logic := '0';
signal OLEDPRst_t : std_logic := '1';
signal OLEDRdy_t : std_logic := '0';
signal OLEDRdyFlag : std_logic := '0'; 
signal OLEDVbat_t : std_logic := '1'; 
signal OLEDVddc_t : std_logic := '1'; 
signal powerOn : std_logic := '0'; 
signal rdyFlag_t : std_logic :='0';                                                                         -- in sync with OLEDRdy; drives OUT LED when OLEDRdy HI
signal rstDone : std_logic := '0';  
signal running : std_logic := '0'; 
signal sttFlag : std_logic := '0'; 
signal byteCount_t : std_logic_vector (3 downto 0) := (others => '0'); 
signal DCOUT_t : std_logic_vector(M-1 downto 0) := (others => '0');                                           -- length 4 vector limits number of D/C bits and therefore bytes OUT by this module to 4        
signal delay2ms : std_logic_vector(19 downto 0) := (others => '0');  
signal delay100ms : std_logic_vector(15 downto 0) := (others => '0'); 
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
                        else 
                            stt <= idle; 
                        end if ;
                    when s0 => 
                        if (sttFlag <= '1') then
                            stt <= s1; 
                        else 
                            stt <= s0; 
                        end if ;
                    when s1 => stt <= s2; 
                    when s2 =>
                        if (sttFlag <= '1') then
                            stt <= s1; 
                        else 
                            stt <= s0; 
                        end if ;
                    when s3 => 
                        if (sttFlag <= '1') then
                            stt <= s1; 
                        else 
                            stt <= s0; 
                        end if ;
                    when s4 => stt <= s5; 
                    when others =>
                        if (sttFlag <= '1') then
                            stt <= idle; 
                        else
                            stt <= s5; 
                        end if ;
                end case ;
            end if ;
        end if ;
    end process ; -- 
    
    output  : process( clk, rst, stt )
    begin
        if (rising_edge(clk)) then
            -- Sync Defaults -- 
            sttFlag <= '0'; 
            powerOn <= '0'; 
            byteFlag_t <= '0'; 

            case( stt ) is
                when rstStt =>
                    byteFlag_t <= '0'; 
                    OLEDPRst_t <= '1';
                    OLEDRdy_t <= '0';
                    OLEDRdyFlag <= '0';
                    OLEDVbat_t <= '1';
                    OLEDVddc_t <= '1';
                    powerOn <= '0';
                    rdyFlag_t <= '0';
                    running <= '0';
                    byteCount_t <= (others => '0'); 
                    DCOUT_t <= (others => '0'); 
                    delay2ms <= (others => '0'); 
                    delay100ms <= (others => '0'); 
                    OLEDBytes_t <= (others => (others => '0')); 
                    rstDone <= '1'; 
                when idle => 
                    rstDone <= '0';
                    OLEDVddc_t <= '0';  
                    delay2ms <= (others => '0'); 
                    delay100ms <= (others => '0'); 
                    if (running = '0' and sw = '1') then
                        running <= '1'; 
                        powerOn <= '1'; 
                    elsif (running = '1' and sw = '0') then
                        powerOn <= '0'; 
                    end if ;
                when s0 =>
                    if (delay2ms = c_Delay2ms) then
                        OLEDBytes_t(0) <= x"AE";
                        DCOUT_t <= (others => '0'); 
                        byteCount_t <= std_logic_vector(to_unsigned(1, 4)); 
                        byteFlag_t <= '1'; 
                        sttFlag <= '1'; 
                    else
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);  
                    end if ;
                when s1 => 
                    OLEDPRst_t <= '0'; 
                    powerOn <= '0'; 
                when s2 => 
                    if (delay2ms = c_Delay2ms) then
                        OLEDPRst_t <= '1'; 
                        sttFlag <= '1'; 
                    else
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);
                    end if ;
                when s3 => 
                    if (delay2ms = c_Delay2ms) then
                        OLEDBytes_t(3 downto 0) <= (x"8D", x"14", x"D9", x"F1");
                        DCOUT_t <= (others => '0');  
                        byteCount_t <= std_logic_vector(to_unsigned(4, 4)); 
                        byteFlag_t <= '1'; 
                        sttFlag <= '1'; 
                    else
                        delay2ms <= std_logic_vector(unsigned(delay2ms) + 1);
                    end if ;   
                when s4 => OLEDVbat_t <= '0'; 
                when others =>
                    if (delay100ms = c_Delay100ms) then
                        OLEDBytes_t(7 downto 0) <= (x"81", x"FF", x"A0", x"C0", x"DA", x"00", x"AF");
                        DCOUT_t <= (others => '0');  
                        byteCount_t <= std_logic_vector(to_unsigned(8, 4)); 
                        byteFlag_t <= '1'; 
                        sttFlag <= '1'; 
                    else
                        delay100ms <= std_logic_vector(unsigned(delay100ms) + 1);
                    end if ;   
            end case ;
        end if ;
    end process ; -- output 

    -- Signals to OUT -- 
    byteFlag <= byteFlag_t; 
    OLEDPRst <= OLEDPRst_t; 
    OLEDRdy <= OLEDRdy_t; 
    OLEDVbat <= OLEDVbat_t; 
    OLEDVddc <= OLEDVddc_t; 
    rdyFlag <= rdyFlag_t; 
    DCOUT <= DCOUT_t; 
    byteCount <= byteCount_t; 
    OLEDBytes <= OLEDBytes_t; 

end Behavioral;
