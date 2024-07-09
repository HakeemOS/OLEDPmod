----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 07:13:10 PM
-- Design Name: 
-- Module Name: userIF_tb - Behavioral
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

entity userIF_tb is
--  Port ( );
end userIF_tb;

architecture Behavioral of userIF_tb is
    -- DUT/UUT -- 
component userIF_s is 
    port (  clk : in std_logic; 
            rst : in std_logic;
            sw0 : in std_logic; 
            byteFlag : out std_logic; 
            DC : out std_logic_vector; 
            byteCount : out std_logic_vector(3 downto 0); 
            OLEDBytes : out byteArr
    );
end component; 
    
    -- Signals -- 
signal clk, rst, sw0, byteFlag : std_logic; 
signal DC : std_logic_vector(3 downto 0); 
signal byteCount : std_logic_vector(3 downto 0); 
signal OLEDBytes : byteArr(9 downto 0); 
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
    UIF0 : userIF_s 
    port map (
        clk => clk, 
        rst => rst, 
        sw0 => sw0, 
        byteFlag => byteFlag,
        DC => DC,
        byteCount => byteCount, 
        OLEDBytes => OLEDBytes
    );

    stim : process 
    begin
        sw0 <= '0'; 
        rst <= '0'; 

        wait for 100ns; 

        sw0 <= '1'; 

        wait for 100ns; 
         
        sw0 <= '0'; 

        wait; 

    end process ; -- stim

end Behavioral;
