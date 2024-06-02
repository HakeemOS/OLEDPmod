----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2024 01:32:15 AM
-- Design Name: 
-- Module Name: OLEDCtrl_tb - Behavioral
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

library myLib; 
use myLib.types_p.all;                                                                                                      -- used for array of bytes to be used as IN

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OLEDCtrl_tb is
--  Port ( );
end OLEDCtrl_tb;

architecture Behavioral of OLEDCtrl_tb is

    -- UUT/DUT --
component OLEDCtrl_s is 
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
end component; 

    -- Generic Constants --
constant N : integer := 8; 
    -- Signals --
signal clk, sclkIN, rst, OLEDPRstIN, OLEDVddcIN, OLEDVbatIN, OLEDRdy, byteFlag, onOffFlag, sclkOUT, OLEDPRstOUT, OLEDVddcOUT, OLEDVbatOUT, DCOUT, CS, MOSI : std_logic; 
signal DCIN, byteCountIN : std_logic_vector(3 downto 0); 
signal bytesIN : byteArr(3 downto 0); 
    -- clk Signals --
signal clk_period : time := 10ns; 
signal clk_period2 : time := 20ns; 
signal clk_stop : boolean; 

begin
    clkproc : process 
    begin
        clk <= '1'; 
        wait for clk_period/2; 
        clk <= '0';
        wait for clk_period/2; 
    end process ; -- clkproc

    clkproc2 : process 
    begin
        sclkIN <= '1'; 
        wait for clk_period2/2; 
        sclkIN <= '0'; 
        wait for clk_period2/2; 
    end process ; -- clkproc2

    uut : OLEDCtrl_s
    generic map (
        N => 8
    )
    port map (
        clk => clk, 
        sclkIN => sclkIN, 
        rst => rst, 
        OLEDPRstIN => OLEDPRstIN,
        OLEDVddcIN => OLEDVddcIN, 
        OLEDVbatIN => OLEDVbatIN, 
        OLEDRdy => OLEDRdy, 
        byteFlag => byteFlag, 
        onOffFlag => onOffFlag, 
        DCIN => DCIN, 
        byteCountIN => byteCountIN, 
        bytesIN => bytesIN, 
        sclkOUT => sclkOUT, 
        OLEDPRstOUT => OLEDPRstOUT, 
        OLEDVddcOUT => OLEDVddcOUT, 
        OLEDVbatOUT => OLEDVbatOUT, 
        DCOUT => DCOUT, 
        CS => CS, 
        MOSI => MOSI
    ); 

    stim : process
    begin
        rst <= '0'; 
        OLEDPRstIN <= '1'; 
        OLEDVddcIN <= '0'; 
        OLEDVbatIN <= '0'; 
        OLEDRdy <= '0'; 
        byteFlag <= '0'; 
        onOffFlag <= '0'; 
        DCIN <= x"0";  
        byteCountIN <= x"0"; 
        bytesIN <= (x"00", x"00", x"11", x"00"); 

        wait for 50ns; 

        -- START; emmulating onSeq_s; 
        OLEDPRstIN <= '0'; 

        wait for 40ns;                                          -- repr 4us delay;

        OLEDPRstIN <= '1'; 

        wait for 40ns;                                          -- repr 4us delay;

        OLEDVddcIN <= '1'; 
        OLEDVbatIN <= '1'; 

        wait for 10ns;                                          -- repr stt change; 

        byteCountIN <= x"1"; 
        bytesIN(0) <= x"AF";                                    -- disp on command; DCIN needn't not be changed since D/C = 0 => command 
        onOFfFlag <= '1'; 

        wait for 10ns; 

        onOffFlag <= '0';

        wait for 190ns;                                         -- repr 200ms delay 
        
        OLEDRdy <= '1'; 


        wait; 
    end process ; -- stim

end Behavioral;
