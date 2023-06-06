LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity simple_tb is
end simple_tb;

architecture behavior of simple_tb is

    -- UUT (Unit Under Test)
    component simple
    port(
            clk: in     std_logic;
            rst: in     std_logic;
            q:  inout   unsigned(7 downto 0)
    );
    end component;

    -- input signals
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';

    -- input/output signal
    signal qq: unsigned(7 downto 0);

    -- set clock period
    constant clk_period: time := 20 ns;

begin
    -- instantiate UUT
    uut: simple PORT MAP (
          clk => clk,
          rst => rst,
          q   => qq
    );

    -- clock management process
    -- no sensitivity list, but uses 'wait'
    clk_process: process
    begin
	    clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
    end process;


    -- stimulating process
    stim_proc: process
    begin

        rst <= '0';
        wait for clk_period / 2;
        rst <= '1';
        wait for clk_period * 35;

        rst <= '0';
        wait for clk_period / 2;
        rst <= '1';
        wait for clk_period * 23;

        wait;
    end process;
end;
