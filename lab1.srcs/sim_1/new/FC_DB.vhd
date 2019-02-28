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

entity FC_tb is
end FC_tb;

architecture testbench of FC_tb is

   signal clk_tb : STD_LOGIC := '0';
   signal clk_en_tb :  STD_LOGIC := '0';
   signal dir_tb :  STD_LOGIC := '0';
   signal en_tb :  STD_LOGIC := '0';
   signal ld_tb :  STD_LOGIC := '0';
   signal rst_tb :  STD_LOGIC := '0';
   signal updn_tb : STD_LOGIC := '0';
   signal val_tb :  STD_LOGIC_VECTOR (3 downto 0) := "0000";
   signal cnt_tb :  STD_LOGIC_VECTOR (3 downto 0);
    
    component fancy_counter is
        Port ( clk : in STD_LOGIC;
               clk_en : in STD_LOGIC;
               dir : in STD_LOGIC;
               en : in STD_LOGIC;
               ld : in STD_LOGIC;
               rst : in STD_LOGIC;
               updn : in STD_LOGIC;
               val : in STD_LOGIC_VECTOR (3 downto 0);
               cnt : inout STD_LOGIC_VECTOR (3 downto 0));
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        clk_tb <= '1';
        
        wait for 4 ns;
        clk_tb <= '0';
    
    end process clk_gen_proc;
    
    -- flip the switch high after 1ms
    switch_proc: process
    begin
    
        wait for 8 ns;
        en_tb  <= '1';
        clk_en_tb <= '1';
        dir_tb <= '0';
        updn_tb <= '1';
        val_tb <= "1010";
        ld_tb <= '1';
        
    end process switch_proc;
    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : fancy_counter
    port map (
    
       clk => clk_tb,
       clk_en => clk_en_tb,
       dir => dir_tb,
       en => en_tb,
       ld => ld_tb,
       rst=> rst_tb,
       updn => updn_tb,
       val => val_tb,
       cnt => cnt_tb
    
    );

    
end testbench; 