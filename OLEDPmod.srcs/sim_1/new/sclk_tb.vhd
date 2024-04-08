----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 08:11:07 PM
-- Design Name: 
-- Module Name: sclk_tb - Behavioral
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

entity sclk_tb is
--  Port ( );
end sclk_tb;

architecture Behavioral of sclk_tb is
    -- UUT/DUT --
component sclk_s is
    port(   clk : in std_logic;
            rst : in std_logic;
            clk_7p1MHz : out std_logic
    );
end component; 

    -- Signals --
signal clk, rst, clk_7p1MHz : std_logic;
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

    uut : sclk_s 
    port map(
        clk => clk, 
        rst => rst, 
        clk_7p1MHz => clk_7p1MHz
    );

    stim : process 
    begin
        
        rst <= '0'; 
        
        wait; 
    end process ; -- stim

end Behavioral;
