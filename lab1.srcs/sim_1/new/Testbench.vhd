----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 05:55:00 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div is
    Port ( clk_in : in STD_LOGIC;
           div : out STD_LOGIC);
end clock_div;

architecture clock_div of clock_div is

signal count : std_logic_vector (31 downto 0) := X"00000000";
signal temp : std_logic := '0';
begin
    div  <= '0';
    process(clk_in) begin
        if(rising_edge(clk_in)) then
            if(count >= X"03B9ACA0") then
            temp <= not temp;
            div <= temp;
            count <= X"00000000";
            end if;
            count <= std_logic_vector( unsigned(count) + 1 );
        end if;
    end process;    
end clock_div;
