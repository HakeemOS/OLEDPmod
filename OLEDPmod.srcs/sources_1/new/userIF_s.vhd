----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2024 02:12:17 PM
-- Design Name: 
-- Module Name: userIF_s - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library myLib;                  
use myLib.types_p.all;                                                                                      -- used for array of bytes to be used as IN

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity userIF_s is
    port (  clk : in std_logic; 
            rst : in std_logic;
            sw0 : in std_logic; 
            byteFlag : out std_logic; 
            DC : out std_logic_vector; 
            byteCount : out std_logic_vector(3 downto 0); 
            OLEDBytes : out byteArr
        );
end userIF_s;

architecture Behavioral of userIF_s is
    -- State Iinitialization -- 
type states is (idle, rstStt, drawLine, holdStt); 
signal stt : states := idle; 
    -- Signals --
signal byteFlag_t : std_logic := '0';
signal dlDone : std_logic := '0';  
signal dlFlag : std_logic := '0'; 
signal LxFlag : std_logic := '0'; 
signal rstDone : std_logic := '0'; 
signal DC_t : std_logic_vector(9 downto 0) := (others => '0');                                  
signal byteCount_t : std_logic_vector(3 downto 0) := (others => '0'); 
signal OLEDBytes_t : byteArr(9 downto 0) := (others => (others => '0')); 

begin
    -- Processes -- 
    trns : process( clk, rst, stt )
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is
                    when rstStt => 
                        if (rstDone = '1') then
                            stt <= idle; 
                        else
                            stt <= rstStt; 
                        end if ;
                    when idle =>
                        if (dlFlag = '1') then
                            stt <= drawLine; 
                        else
                            stt <= idle; 
                        end if ;
                    when drawLine => 
                        if(LxFlag = '1') then
                            stt <= holdStt; 
                        else
                            stt <= drawLine; 
                        end if; 
                    when others =>
                        if (dlDone = '1') then
                            stt <= idle; 
                        else 
                            stt <= holdStt; 
                        end if ;
                end case ;
            end if ;
        end if ;
    end process ; -- trns

    output : process( clk, rst, stt )
    begin
        if (rising_edge(clk)) then
            -- Sync Defaults -- 
            byteFlag_t <= '0'; 
            dlFlag <= '0'; 
            dlDone <= '0';
            rstDone <= '0';
            LxFlag <= '0'; 

            case( stt ) is
                when rstStt =>
                    byteFlag_t <= '0'; 
                    dlFlag <= '0'; 
                    dlDone <= '0';
                    LxFlag <= '0'; 
                    byteCount_t <= (others => '0');
                    DC_t <= (others => '0');  
                    OLEDBytes_t <= (others => (others => '0')); 
                    rstDone <= '1'; 
                when idle =>
                    if (sw0 = '1') then 
                        dlFlag <= '1'; 
                    else 
                        null; 
                    end if ;
                when drawLine =>                     
                        byteCount_t <= std_logic_vector(to_unsigned(5, 4));
                        DC_t <= (others => '0');  
                        OLEDBytes_t(4 downto 0) <= (x"21", x"01", x"10", x"26", x"04"); 
                        byteFlag_t <= '1'; 
                        LxFlag <= '1'; 
                when others => 
                if (sw0 = '0') then
                    dlDone <= '1';  
                else
                    null; 
                end if; 
            end case ;
        end if ;
    end process ; -- output

    -- Signal to OUT -- 
    byteFlag <= byteFlag_t; 
    byteCount <= byteCount_t; 
    DC <= DC_t; 
    OLEDBytes <= OLEDBytes_t; 

end Behavioral;
