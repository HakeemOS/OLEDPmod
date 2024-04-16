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
    -- Constant --
constant c_Delay4us : std_logic_vector(8 downto 0) := x"18F";                -- constant = 399
    -- State Initialization -- 
type states is (s0, s1, s2, s3, s4); 
signal stt: states := s0; 
    -- Signals --
signal start : std_logic := '0'; 
signal OLEDPRst_t : std_logic := '1';
signal OLEDVddc_t : std_logic := '0'; 
signal OLEDVbat_t : std_logic := '0'; 
signal OLEDByte_t : std_logic_vector(N-1 downto 0) := (others => '0');
signal delay4us : std_logic_vector(8 downto 0) := (others => '0');        



begin
    trns : process( clk, rst, sw, stt )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= s0; 
                OLEDPRst_t <= '1'; 
                OLEDVddc_t <= '0'; 
                OLEDVbat_t <= '0';
                OLEDByte_t <= (others => '0'); 
                delay4us <= (others => '0'); 
            else
                case( stt ) is
                    when s0 =>
                        if (start = '1') then
                            stt <= s1; 
                        end if ;
                    when s1 =>
                    when s2 =>
                    when others =>
                
                end case ;
            end if; 
        end if ;
    end process ; -- trns

    output : process( clk, stt )
    begin
        case( stt ) is
            when s0 =>
                if (sw = '1') then
                    start <= '1'; 
                    OLEDPRst_t <= '0'; 
                end if ;
            when s1 => 
                    if (rising_edge(clk)) then
                        if (delay4us = c_Delay4us) then
                            OLEDPRst_t <= '1'; 
                        else 
                            delay4us <= std_logic_vector(unsigned(delay4us) + 1); 
                        end if ;
                        
                    end if ; 

            when others =>
        
        end case ;
    end process ; -- output


    -- Signals to OUT -- 
    OLEDPRst <= OLEDPRst_t; 
    OLEDVddc <= OLEDVddc_t; 
    OLEDVbat <= OLEDVbat_t;
    OLEDByte <= OLEDByte_t; 
end Behavioral;
