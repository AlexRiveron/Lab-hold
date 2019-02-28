library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity CD_tb is
end CD_tb;

architecture testbench of CD_tb is

    signal tb_clk : std_logic := '0';
    signal tb_led0 : std_logic;
    
    component clock_div is
        port(
        
            clk_in  : in std_logic;        -- 125 Mhz clock
            
            div : out std_logic        -- led, '1' = on
        
        );
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : clock_div
    port map (
    
        clk_in  => tb_clk,
        div => tb_led0
    
    );

    
end testbench; 