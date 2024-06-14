----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2024 09:56:34 AM
-- Design Name: 
-- Module Name: Top_s - Structural
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
use myLib.types_p.all;                                                                                                      -- used for array of bytes to be used as IN
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_s is
    generic( N : integer := 8);
    port (  clk : in std_logic;
            rst : in std_logic; 
            sw : in std_logic; 
            CS : out std_logic; 
            DC : out std_logic; 
            MOSI : out std_logic; 
            PRst : out std_logic;
            sclk : out std_logic;  
            Vbat : out std_logic; 
            Vddc : out std_logic
    );
end Top_s;

architecture Structural of Top_s is

    -- Components -- 
component OLEDCtrl_s is 
    generic (N : integer := 8); 
    port (  clk : in std_logic;                     
            sclkIN : in std_logic;                  
            rst : in std_logic;     
            byteFlag : in std_logic;                 
            OLEDPRstIN : in std_logic; 
            OLEDRdy : in std_logic;                                                                                         -- OLED can be used, onSeq is completed (when HI); OLED not available (when LOW)
            OLEDVbatIN : in std_logic;                                                                               
            OLEDVddcIN : in std_logic;                                             
            onOffFlag : in std_logic;                                                                                       -- onSeq byteFlag bit connected to this IN so CTRL knows ON/OFF command incoming    
            DCIN : in std_logic_vector;                             
            byteCountIN : in std_logic_vector(3 downto 0);                                                                  -- number of bytes to Tx
            bytesIN : in byteArr;                                                                                           -- byte(s) to be Tx 
            sclkOUT : out std_logic;   
            CS : out std_logic;          
            DCOUT : out std_logic;
            MOSI : out std_logic;                   
            OLEDPRstOUT : out std_logic;       
            OLEDVbatOUT : out std_logic;                   
            OLEDVddcOUT : out std_logic                       
    ); 
end component; 

component OnSeq_s is 
    generic ( N : integer := 8); 
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
end component;              

component sclk_s is            
    port (  clk : in std_logic;                 
            rst : in std_logic;                 
            clk_7p1MHz : out std_logic              
    );              
end component;              

    -- Sync Signals -- 
signal clk_W : std_logic := '0'; 
signal rst_w : std_logic := '0'; 
    -- Signals --        
signal byteFlag_w : std_logic := '0';        
signal CS_t : std_logic := '1';                                                                                             -- active low CS
signal DC_t : std_logic := '0'; 
signal MOSI_t : std_logic := '0'; 
signal OLEDRdy_w : std_logic := '0'; 
signal onOffFlag_w : std_logic := '0'; 
signal PRst_t : std_logic := '1'; 
signal PRst_w : std_logic := '1'; 
signal Vbat_t : std_logic := '0';
signal Vbat_w : std_logic := '0'; 
signal Vddc_t : std_logic := '0';  
signal Vddc_w : std_logic := '0'; 
signal sclk_t : std_logic := '0'; 
signal sclk_w : std_logic := '0'; 
signal sw_w : std_logic := '0'; 
signal byteCount_w : std_logic_vector(3 downto 0) := (others => '0'); 
signal DC_w : std_logic_vector(3 downto 0) := (others => '0'); 
signal bytesIN_w : byteArr(9 downto 0) := (others => (others => '0')); 


begin
    -- IN to Signal -- 
    clk_w <= clk; 
    rst_w <= rst; 
    sw_w <= sw; 

    -- Component Instances -- 
    OC0 : OLEDCtrl_s 
    generic map (
        N => 8
    )
    port map (
        clk => clk_w, 
        sclkIN => sclk_w, 
        rst => rst_w, 
        byteFlag => byteFlag_w, 
        OLEDPRstIN => PRst_w, 
        OLEDRdy => OLEDRdy_w,  
        OLEDVbatIN => Vbat_w,         
        OLEDVddcIN => Vddc_w, 
        onOffFlag => onOffFlag_w, 
        DCIN => DC_w, 
        byteCountIN => byteCount_w, 
        bytesIN => bytesIN_w,  
        sclkOUT => sclk_t, 
        CS => CS_t, 
        DCOUT => DC_t, 
        MOSI => MOSI_t, 
        OLEDPRstOUT => PRst_t,         
        OLEDVbatOUT => Vbat_t, 
        OLEDVddcOUT => Vddc_t
    ); 
    
    OnSeq0 : OnSeq_s
    generic map (
        N => 8
    )
    port map (
        clk => clk_w, 
        rst => rst_w, 
        sw => sw_w, 
        byteFlag => onOffFlag_w, 
        OLEDPRst => PRst_w, 
        OLEDRdy => OLEDRdy_w, 
        OLEDVbat => Vbat_w, 
        OLEDVddc => Vddc_w, 
        DCOUT => DC_w, 
        byteCount => byteCount_w,
        OLEDByte => bytesIN_w  
    ); 

    sclk0 : sclk_s
    port map (
        clk => clk_w, 
        rst => rst_w, 
        clk_7p1MHz => sclk_w 
    ); 
    
    -- Signal to OUT -- 
    CS <= CS_t;
    DC <= DC_t;
    MOSI <= MOSI_t;
    PRst <= PRst_t;
    Vbat <= Vbat_t;
    Vddc <= Vddc_t;
    sclk <= sclk_t;


end Structural;
