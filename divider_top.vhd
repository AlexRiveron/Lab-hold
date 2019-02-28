----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 04:28:16 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

entity RTL_REG is
    Port (C, CE, D : in std_logic;
        Q : out std_logic);
end RTL_REG;

architecture RTL_REG of RTL_REG is
    begin
        process (c)
        begin
            if rising_edge(c) then
                if (CE = '1') then
                    Q <= D;
                end if;
            end if;
        end process;
end RTL_REG;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RTL_INV is
    Port (I0: in std_logic;
        o : out std_logic);
end RTL_INV;

architecture RTL_INV of RTL_INV is
    begin
        o <= not I0;
end RTL_INV;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_top is
    Port ( clk : in STD_LOGIC;
           led0 : out STD_LOGIC);
end divider_top;

architecture divider_top of divider_top is

component clock_div is
    Port ( clk_in : in STD_LOGIC;
           div : out STD_LOGIC);
end component;

component RTL_REG is
    Port (C, CE, D : in std_logic;
        Q : out std_logic);
end component;

signal o : std_logic;
signal div : std_logic;

begin
   led0 <= not o;
    
    led_reg: RTL_REG
        port map (
        C => clk,
        CE => div,
        D => o,
        Q => led0);
    U1: clock_div
        port map (
        clk_in => clk,
        div => div);
end divider_top;