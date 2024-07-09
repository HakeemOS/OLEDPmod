----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/12/2024 02:44:26 PM
-- Design Name: 
-- Module Name: Top_tb - Behavioral
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

entity Top_tb is
--  Port ( );
end Top_tb;

architecture Behavioral of Top_tb is

    --UUT/DUT -- 
component Top_s is 
    port (  clk : in std_logic;
            rst : in std_logic; 
            sw : in std_logic; 
            sw0 : in std_logic;
            CS : out std_logic; 
            DC : out std_logic; 
            MOSI : out std_logic; 
            PRst : out std_logic;
            rdy : out std_logic; 
            sclk : out std_logic;  
            Vbat : out std_logic; 
            Vddc : out std_logic
    );
end component; 

    -- Signals -- 
signal clk, rst, sw, sw0, CS, DC, MOSI, PRst, sclk, Vbat, Vddc : std_logic; 
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

    --UUT/DUT -- 
    Top0 : Top_s 
    port map (
        clk => clk, 
        rst => rst, 
        sw => sw, 
        sw0 => sw0, 
        CS => CS, 
        DC => DC, 
        MOSI => MOSI, 
        PRst => PRst, 
        sclk => sclk, 
        Vbat => Vbat, 
        Vddc => Vddc 
    );

    -- Stimulus -- 
    stim : process 
    begin
        rst <= '0'; 
        sw <= '0'; 
        sw0 <= '0'; 

        wait for 100ns; 

        sw <= '1'; 

        wait for 255ms; 

        sw0 <= '1'; 

        wait for 10ms; 

        sw0 <= '0'; 
        sw <= '0'; 

        wait; 

    end process ; -- stim

end Behavioral;
