--
-- filename:    blinker_tb.vhd
-- written by:  steve dinicolantonio
-- description: testbench for blinker.vhd
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity debouncer_tb is
end debouncer_tb;

architecture testbench of debouncer_tb is

    signal tb_clk : std_logic := '0';
    signal tb_btn0 : std_logic := '0';
    signal tb_led0 : std_logic;
    
    component debounce is
        port ( btn : in STD_LOGIC;
               clk : in STD_LOGIC;
               dbnc : out STD_LOGIC);
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
    
    -- flip the switch high after 1ms
    btn_proc: process
    begin
        
        tb_btn0 <= '0';
        wait for 4 ns;
        tb_btn0 <= '1';
        
        wait for 40 ns;
        tb_btn0 <= '0';
        
        wait for 4 ns;
        tb_btn0 <= '0';
        
        wait for 8 ns; 
        tb_btn0 <= '1';
        
        wait for 12 ns;
     
        end process btn_proc;
    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : debounce
    port map (
    
        clk  => tb_clk,
        btn  => tb_btn0,
        dbnc => tb_led0
    
    );

    
end testbench; 