----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hakeem Sadiq
-- 
-- Create Date: 04/05/2024 08:18:11 PM
-- Design Name: 
-- Module Name: types_p - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Package containing different custom data types
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

package types_p is
    type byteArr is array (natural range <>) of std_logic_vector(7 downto 0); 
    type wordArr is array (natural range <>) of std_logic_vector(15 downto 0); 
end package ;

package body types_p is

end package body; 