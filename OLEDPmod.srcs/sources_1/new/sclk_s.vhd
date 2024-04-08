----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 09:44:00 AM
-- Design Name: 
-- Module Name: sclk_s - Behavioral
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

entity sclk_s is
    port (  clk : in std_logic; 
            rst : in std_logic; 
            clk_7p1MHz : out std_logic
    );
end sclk_s;

architecture Behavioral of sclk_s is
    -- Signals --
signal clk_7p1MHz_t : std_logic := '0'; 
signal counter : std_logic_vector(3 downto 0) := (others => '0'); 
signal tickCount : std_logic_vector(3 downto 0) := x"6";                    


begin
    proc1 : process( clk, rst )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                clk_7p1MHz_t <= '0'; 
            elsif (counter = tickCount) then
                clk_7p1MHz_t <= not clk_7p1MHz_t;
                counter <= (others => '0'); 
            else 
                counter <= std_logic_vector(unsigned(counter) + 1); 
            end if ;
        end if ;
    end process ; -- proc1

    clk_7p1MHz <= clk_7p1MHz_t; 

end Behavioral;
