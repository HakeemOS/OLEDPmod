----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hakeem S. 
-- 
-- Create Date: 04/29/2024 06:12:30 PM
-- Design Name: 
-- Module Name: SPI_Tx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Recieves byte data and converts to data sent via SPI
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
use IEEE.NUMERIC_STD.ALL;                                                                               -- used for incrementing vector (unsigned())

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI_Tx is
    generic (N : integer := 8);
    port (  clk : in std_logic;
            rst : in std_logic;  
            start : in std_logic; 
            byteIN : in std_logic_vector(N-1 downto 0); 
            MOSI : out std_logic; 
            CS : out std_logic; 
            TxReady : out std_logic
        );
end SPI_Tx;

architecture Behavioral of SPI_Tx is

    -- State Initialization --
type state is (idle, tx, rstStt);
signal stt : state := idle; 
    -- Signals --
signal done : std_logic := '0'; 
signal MOSI_t : std_logic := '0';                                                                       -- Bit being Tx
signal CS_t : std_logic := '1';                                                                         -- Chip select 
signal TxReady : std_logic := '1';                                                                      -- Ready to Tx signal 
signal TxCount : std_logic_vector(3 downto 0) := "1000";                                                -- keeps track of which bit in byte has been tx
signal byteReg : std_logic_vector(N-1 downto 0) := (others => '0');    


begin

    trns : process( clk, rst, stt, done )
    begin
        if (falling_edge(clk)) then
            if (rst = '1') then
                stt <= rstStt; 
            else
                case( stt ) is
                    when rstStt => stt <= idle; 
                    when idle =>
                        if (TxReady_t = '0') then
                            stt <= tx; 
                        else
                            stt <= idle; 
                        end if ;
                    when others =>
                        if (done = '1') then
                            stt <= idle; 
                        else
                            stt <= tx; 
                        end if ;
                end case ;
            end if ;
        end if ;
    end process ; -- trns

    output : process( clk, rst, stt, done, MOSI_t, CS_t )
    begin
        if (falling_edge(clk)) then
            -- Defaults --
            done <= '0'; 

            case( stt ) is
                when rstStt =>
                    done <= '0'; 
                    MOSI_t <= '0';
                    CS_t <= '1'; 
                    TxReady_t <= '1';  
                    TxCount <= "1000"; 
                    byteReg <= (others => '0'); 
                when idle => 
                    TxCount <= "1000"; 
                    if (start = '1') then
                        byteReg <= byteIN; 
                        TxReady_t <= '0'; 
                    else
                        TxReady_t <= '1'; 
                    end if ;
                when others =>
                    if (unsigned(TxCount) = 1) then
                        MOSI_t <= byteReg(unsigned(TxCount)); 
                        done <= '1';
                    elsif (unsigned(TxCount) = 8) then
                        CS_t <= '0'; 
                        MOSI_t <= byteReg(unsigned(TxCount)); 
                        TxCount <= std_logic_vector(unsigned(TxCount) - 1); 
                    elsif (unsigned(TxCount) > 1) then
                        MOSI_t <= byteReg(unsigned(TxCount)); 
                        TxCount <= std_logic_vector(unsigned(TxCount) - 1); 
                    end if ;
            end case ;
        end if ;
    end process ; -- output

    -- Signal to OUTs -- 
    MOSI <= MOSI_t; 
    CS <= CS_t;
    TxReady <= TxReady_t; 

end Behavioral;
