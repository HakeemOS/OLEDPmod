----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 08:22:46 AM
-- Design Name: 
-- Module Name: SPITx_tb - Behavioral
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

entity SPITx_tb is
--  Port ( );
end SPITx_tb;

architecture Behavioral of SPITx_tb is

    -- UUT/DUT --
component SPI_Tx is 
    generic (N : integer := 8); 
    port (  clk : in std_logic;
            rst : in std_logic; 
            start : in std_logic; 
            byteCount : in std_logic_vector(N-1 downto 0); 
            byteIN : in std_logic_vector(N-1 downto 0); 
            MOSI : out std_logic; 
            CS : out std_logic; 
            nxByte : out std_logic; 
            TxReady : out std_logic
    ); 
end component; 
    -- Generic Constants -- 
constant N : integer := 8; 
    -- Signals --
signal clk, rst, start, MOSI, CS, nxByte, TxReady : std_logic; 
signal byteCount, byteIN : std_logic_vector(N-1 downto 0); 
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

    uut : SPI_Tx
    generic map (
        N => 8
    )
    port map (
        clk => clk, 
        rst => rst,
        start => start, 
        byteCount => byteCount, 
        byteIN => byteIN, 
        MOSI => MOSI, 
        CS => CS, 
        nxByte => nxByte, 
        TxReady => TxReady
    ); 

    stim : process 
    begin
        start <= '0'; 
        rst <= '0'; 
        byteCount <= "00000011"; 
        byteIN <= "00111010"; 

        wait for 20ns; 

        start <= '1'; 

        wait for 50ns; 

        rst <= '1'; 
         
        wait for 10ns; 

        rst <= '0'; 
        start <= '0'; 
        byteIN <= "11000110";
        byteCount <= "00000100"; 

        wait for 20ns; 

        start <= '1'; 

        wait for 50ns; 

        start <= '0'; 
        byteIN <= "00001111"; 

        wait for 80ns; 

        byteIN <= "01011110"; 

        wait for 80ns; 

        byteIN <= "10010111"; 





        wait; 
    end process ; -- stim

end Behavioral;
