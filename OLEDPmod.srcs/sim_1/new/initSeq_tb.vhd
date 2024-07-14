----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2024 08:30:15 AM
-- Design Name: 
-- Module Name: initSeq_tb - Behavioral
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

entity initSeq_tb is
--  Port ( );
end initSeq_tb;

architecture Behavioral of initSeq_tb is
    --DUT/UUT -- 
component initSeq_s is 
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
            DC : out std_logic_vector;                                                                   -- vector of D/C bits following same index as array of bytes (i.e corresponding D/C bit of byte at pos 1 also at pos 1 of vector)
            byteCount : out std_logic_vector(3 downto 0); 
            OLEDBytes : out byteArr
    );
end component; 

    -- Generic Constants --
constant M : integer := 10; 
    -- Signals --
signal clk, rst, sw, byteFlag, OLEDPRst, OLEDRdy, OLEDVbat, OLEDVddc, rdyFlag : std_logic; 
signal byteCount : std_logic_vector(3 downto 0); 
signal DC : std_logic_vector(M-1 downto 0); 
signal OLEDBytes : byteArr(M-1 downto 0); 
    -- clk Signals --
signal clk_period : time := 10ns;
signal clk_stop : boolean;  

begin
    -- clk init -- 
    clkproc : process 
    begin
        clk <= '1'; 
        wait for clk_period/2; 
        clk <= '0';
        wait for clk_period/2; 
    end process ; -- clkproc

    -- DUT/UUT -- 
    DUT : initSeq_s 
    generic map (
        M => 10
    )
    port map (
        clk => clk,
        rst => rst,
        sw => sw,
        byteFlag => byteFlag,
        OLEDPRst => OLEDPRst,
        OLEDRdy => OLEDRdy,
        OLEDVbat => OLEDVbat,
        OLEDVddc => OLEDVddc,
        rdyFlag => rdyFlag,
        DC => DC,
        byteCount => byteCount,
        OLEDBytes => OLEDBytes
    ); 

    -- Stimulus -- 
    stim : process 
    begin
        rst <= '0'; 
        sw <= '0'; 

        wait for 50ns; 

        sw <= '1'; 

        
        wait; 

    end process ; -- stim


end Behavioral;
