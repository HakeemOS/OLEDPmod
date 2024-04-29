----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 07:18:51 PM
-- Design Name: 
-- Module Name: onOffSeq_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity onOffSeq_tb is
--  Port ( );
end onOffSeq_tb;

architecture Behavioral of onOffSeq_tb is

    --UUT/DUT -- 
component onSeq_S is 
    generic (N : integer := 8); 
    port (  clk : in std_logic; 
            rst : in std_logic;
            sw : in std_logic; 
            OLEDPRst : out std_logic; 
            OLEDVddc : out std_logic; 
            OLEDVbat : out std_logic; 
            OLEDRdy : out std_logic; 
            byteFlag : out std_logic; 
            OLEDByte : out std_logic_vector(N-1 downto 0)
    );
end component; 
    -- Generic Constants -- 
constant N : integer := 8;  
    -- Signals --
signal clk, rst, sw, OLEDPRst, OLEDVddc, OLEDVbat, OLEDRdy, byteFlag : std_logic; 
signal OLEDByte : std_logic_vector(N-1 downto 0); 
    -- clk Signals --
signal clk_period : time := 10ns; 
signal clk_stop : boolean; 
    

begin
    clkproc : process 
    begin
        clk <= '1';  
        wait for clk_period/2; 
        clk <= '0'; 
        wait for clk_period/2; 
    end process ; -- clkproc

    UUT : onSeq_s 
    generic map (
        N => 8
    ) 
    port map (
        clk => clk, 
        rst => rst, 
        sw => sw, 
        OLEDPRst => OLEDPRst, 
        OLEDVddc => OLEDVddc, 
        OLEDVbat => OLEDVbat, 
        OLEDRdy => OLEDRdy,
        byteFlag => byteFlag,  
        OLEDByte => OLEDByte
    ); 

    stim : process 
    begin
        sw <= '0'; 
        rst <= '0'; 
        
        wait for 20ns; 

        sw <= '1'; 

        wait for 10ms; 
        
        rst <= '1'; 

        wait for 20ns; 

        rst <= '0'; 

        wait for 290ms; 

        sw <= '0'; 
    
        wait;  
    end process ; -- stim

end Behavioral;
