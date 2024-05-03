----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2024 06:17:46 PM
-- Design Name: 
-- Module Name: byteBuffer_s - Behavioral
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

entity byteBuffer_s is
    generic (N : integer := 8); 
    port (  clk : in std_logic;  
            rst : in std_logic; 
            byteFlag : std_logic; 
            nxByte : in std_logic; 
            bytesIN : in byteArr;                                                       -- all bytes to be Tx by SPI_Tx for specific command or data 
            DCIN : in std_logic_vector;                                                 -- all data/command bits for each byte In
            DCOUT: out std_logic;                                                       -- current data/command bit to be Tx
            byteOUT : out std_logic_vector(7 downto 0)                                  -- current bit to be Tx
    );
end byteBuffer_s;

architecture Behavioral of byteBuffer_s is

    -- State Initialization --
type state is (rstStt, idle, load, send); 
signal stt : state := idle;  
    -- Signals --
signal bytesIN_i : byteArr (9 downto 0);                                                -- For now default max number of bytes stored is 10; 

begin


end Behavioral;
