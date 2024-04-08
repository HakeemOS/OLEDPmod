----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2024 09:56:04 AM
-- Design Name: 
-- Module Name: onSeq_S - Behavioral
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

entity onSeq_S is
    generic (N : integer := 8); 
    port (  clk : in std_logic; 
            rst : in std_logic;
            sw : in std_logic; 
            OLEDPRst : out std_logic; 
            OLEDVddc : out std_logic; 
            OLEDVbat : out std_logic; 
            OLEDByte : out std_logic_vector(N-1 downto 0)
    );
end onSeq_S;

architecture Behavioral of onSeq_S is

    -- Signals --
signal OLEDPRst_t : std_logic := '1';
signal OLEDVddc_t : std_logic := '0'; 
signal OLEDVbat_t : std_logic := '0'; 
signal OLEDByte_t : std_logic_vector(N-1 downto 0) := (others => '0'); 


begin


    -- Signals to OUT -- 
    OLEDPRst <= OLEDPRst_t; 
    OLEDVddc <= OLEDVddc_t; 
    OLEDVbat <= OLEDVbat_t;
    OLEDByte <= OLEDByte_t; 
end Behavioral;
