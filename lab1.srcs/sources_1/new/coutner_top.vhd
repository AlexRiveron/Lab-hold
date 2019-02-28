----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 07:50:14 PM
-- Design Name: 
-- Module Name: coutner_top - Behavioral
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

--library declaration--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity declaration
entity counter_top is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end counter_top;


--entity declaration--

architecture top_structure of counter_top is

component fancy_counter is
        Port ( clk : in STD_LOGIC;
               clk_en : in STD_LOGIC;
               dir : in STD_LOGIC;
               en : in STD_LOGIC;
               ld : in STD_LOGIC;
               rst : in STD_LOGIC;
               updn : in STD_LOGIC;
               val : in STD_LOGIC_VECTOR (3 downto 0);
               cnt : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

component debounce is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end component;

component clock_div is
    Port ( clk_in : in STD_LOGIC;
           div : out STD_LOGIC);
end component;

signal dbnc_res : std_logic_vector( 3 downto 0);
signal clk2hz : std_logic;

begin
    
    u1: debounce
        port map ( 
            btn => btn(0),
            clk => clk,
            dbnc => dbnc_res(0));
    u2: debounce
        port map ( 
            btn => btn(1),
            clk => clk,
            dbnc => dbnc_res(1));
    u3: debounce
        port map (
            btn => btn(2),
            clk => clk,
            dbnc => dbnc_res(2));
    u4: debounce
        port map (
            btn => btn(3),
            clk => clk,
            dbnc => dbnc_res(3));
    u5: clock_div
        port map (
            clk_in => clk,
            div => clk2hz);
    u6: fancy_counter
        port map(
            clk => clk,
            clk_en => clk2hz,
            dir => sw(0),
            en => dbnc_res(1),
            ld => dbnc_res(3),
            rst => dbnc_res(0),
            updn => dbnc_res(2),
            val => sw,
            cnt => led);
end top_structure;
