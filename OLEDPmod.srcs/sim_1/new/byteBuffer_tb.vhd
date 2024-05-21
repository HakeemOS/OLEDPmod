----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2024 03:41:15 PM
-- Design Name: 
-- Module Name: byteBuffer_tb - Behavioral
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
use myLib.types_p.all;                                                                  -- used for array of bytes to be used as IN

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity byteBuffer_tb is
--  Port ( );
end byteBuffer_tb;

architecture Behavioral of byteBuffer_tb is

    -- UUT/DUT --
component byteBuffer_s is
    generic (N : integer := 8); 
    port (  clk : in std_logic;  
            rst : in std_logic; 
            -- startRdy : in std_logic;                                                    -- indicates all bytes recieved; Ready to start Tx  
            byteFlag : in std_logic;                                                    -- byte(s) are ready to be captured in buffer
            TxReady : in std_logic;                                                     -- SPI_Tx ready to Tx 
            nxByte : in std_logic;                                                      -- SPI_Tx ready for next byte in current data/command sequence 
            byteCountIN : in std_logic_vector(3 downto 0);                              -- number of bytes to Tx 
            DCIN : in std_logic_vector;                                                 -- all data/command bits for each byte In
            bytesIN : in byteArr;                                                       -- all bytes to be Tx by SPI_Tx for specific command or data 
            rdy : out std_logic;                                                        -- flag for other modules to see buffer can receive 
            startOUT : out std_logic;                                                   -- start signal sent to SPI_Tx
            DCOUT: out std_logic;                                                       -- current data/command bit to be Tx
            byteCountOUT : out std_logic_vector(3 downto 0); 
            byteOUT : out std_logic_vector(N-1 downto 0)                                -- current byte to be Tx
    );
end component; 

    -- Generic Constants -- 
constant N : integer := 8; 
    -- Signals -- 
signal clk, rst, byteFlag, TxReady, nxByte, rdy, startOUT, DCOUT : std_logic; 
signal DCIN : std_logic_vector(2 downto 0); 
signal byteCountIN, byteCountOUT : std_logic_vector(3 downto 0); 
signal byteOUT : std_logic_vector(N-1 downto 0); 
signal bytesIN : byteArr(2 downto 0); 
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

    dut : byteBuffer_s 
    generic map (
        N => 8
    )
    port map(
        clk => clk, 
        rst => rst, 
        byteFlag => byteFlag, 
        TxReady => TxReady, 
        nxByte => nxByte, 
        byteCountIN => byteCountIN, 
        DCIN => DCIN, 
        bytesIN => bytesIN, 
        rdy => rdy, 
        startOUT => startOUT, 
        DCOUT => DCOUT, 
        byteCountOUT => byteCountOUT, 
        byteOUT => byteOUT
    ); 
        
    stim : process 
    begin
        rst <= '0'; 
        byteFlag <= '0'; 
        TxReady <= '0'; 
        nxByte <= '0'; 
        byteCountIN <= x"3"; 
        DCIN <= "010"; 
        bytesIN <= (x"a6", x"f7", x"2e" ); 

        wait for 20ns; 

        byteFlag <= '1'; 

        wait for 10ns; 
        
        byteFlag <= '0'; 

        

        wait; 

        
    end process ; -- stim

end Behavioral;
