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
use IEEE.NUMERIC_STD.ALL;                                                   -- used for incrementing vector (unsigned())

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
            OLEDRdy : out std_logic; 
            OLEDByte : out std_logic_vector(N-1 downto 0)
    );
end onSeq_S;

architecture Behavioral of onSeq_S is
    -- Constant --
constant c_Delay4us : std_logic_vector(11 downto 0) := x"18F";                       -- constant = 399
constant c_Delay200ms :  std_logic_vector(27 downto 0) := x"1312CFF";               -- constant = 19,999,99 
    -- State Initialization -- 
type states is (idle, rstStt, s0, s1, s2, s3, s4);                                        
signal stt: states := idle; 
    -- Signals --
signal powerOn : std_logic := '0'; 
signal powerOff : std_logic := '0'; 
signal running : std_logic := '0'; 
signal OLEDPRst_t : std_logic := '1';
signal OLEDVddc_t : std_logic := '0'; 
signal OLEDVbat_t : std_logic := '0'; 
signal OLEDRdy_t : std_logic := '0'; 
signal OLEDByte_t : std_logic_vector(N-1 downto 0) := (others => '0');
signal delay4us : std_logic_vector(11 downto 0) := (others => '0');      
signal delay200ms : std_logic_vector(27 downto 0) := (others => '0');   



begin
    trns : process( clk, rst, sw, stt, powerOn, powerOff, running, OLEDPRst_t, OLEDVddc_t, OLEDVbat_t, OLEDByte_t, 
                    OLEDRdy_t  )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is
                    when rstStt => stt <= idle; 
                    when idle =>
                        if (powerOn = '1') then
                            stt <= s0; 
                        --elsif (powerOff = '1') then
                        --   
                        else
                            stt <= idle;  
                        end if ;
                    when s0 =>
                        if (OLEDPRst_t = '1') then
                            stt <= s1; 
                        else
                            stt <= s0; 
                        end if ;
                    when s1 =>
                        if (OLEDVddc_t = '1' and OLEDVbat_t = '1') then
                            stt <= s2;
                        else
                            stt <= s1; 
                        end if ;
                    when s2 => stt <= s3; 
                    when s3 => 
                        if (OLEDRdy_t = '1') then
                            stt <= idle; 
                        --elsif () then
                            
                        else
                            stt <= s3; 
                        end if ;
                    when others =>
                
                end case ;
            end if; 
        end if ;
    end process ; -- trns

    output : process( clk, stt, sw, powerOn, powerOff, running, OLEDPRst_t, OLEDVddc_t, OLEDVbat_t, OLEDByte_t, 
                        OLEDRdy_t, delay4us, delay200ms )
    begin
        case( stt ) is
            when rstStt => 
                powerOn <= '0'; 
                powerOff <= '0';
                running <= '0'; 
                OLEDPRst_t <= '1'; 
                OLEDVddc_t <= '0'; 
                OLEDVbat_t <= '0';
                OLEDRdy_t <= '0'; 
                OLEDByte_t <= (others => '0'); 
                delay4us <= (others => '0'); 
                delay200ms <= (others => '0'); 
            when idle =>
                delay4us <= (others => '0'); 
                delay200ms <= (others => '0'); 
                if (sw = '1' and running = '0') then
                    powerOn <= '1'; 
                    powerOff <= '0'; 
                    running <= '1'; 
                    OLEDPRst_t <= '0'; 
                --elsif (sw = '0' and running = '1') then
                --    powerOn <= '0'; 
                --    powerOff <= '1'; 
                --    running <= '0'; 
                --    OLEDPRst_t <= '0'; 
                end if ;
            when s0 => 
                if (rising_edge(clk)) then
                    if (delay4us = c_Delay4us) then
                        OLEDPRst_t <= '1'; 
                        delay4us <= (others => '0'); 
                    else 
                        delay4us <= std_logic_vector(unsigned(delay4us) + 1); 
                    end if ;
                end if ;
            when s1 => 
                if (rising_edge(clk)) then
                    if (delay4us = c_Delay4us) then
                        OLEDVddc_t <= '1'; 
                        OLEDVbat_t <= '1'; 
                        delay4us <= (others => '0'); 
                    else 
                        delay4us <= std_logic_vector(unsigned(delay4us) + 1); 
                    end if ;
                end if ;
            when s2 => 
                OLEDByte_t <= x"AF";                                                -- display on command 
            when s3 => 
                if (rising_edge(clk)) then
                    if (delay200ms = c_Delay200ms) then
                        OLEDRdy_t <= '1';
                        delay200ms <= (others => '0' ) ;    
                        powerOn <= '0';                                    
                    else 
                        delay200ms <= std_logic_vector(unsigned(delay200ms) + 1); 
                    end if ;
                end if ;
            when others =>
        
        end case ;
    end process ; -- output


    -- Signals to OUT -- 
    OLEDPRst <= OLEDPRst_t; 
    OLEDVddc <= OLEDVddc_t; 
    OLEDVbat <= OLEDVbat_t;
    OLEDRdy <= OLEDRdy_t; 
    OLEDByte <= OLEDByte_t; 
end Behavioral;
