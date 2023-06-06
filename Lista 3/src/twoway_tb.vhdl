LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity twoway_tb is
end twoway_tb;

architecture behavior of twoway_tb is

    -- UUT (Unit Under Test)
    component twoway is
    generic(width: positive);
    port(
            clk: in     std_logic;
            q:   out    std_logic_vector
    );
    end component;

    -- input signals
    signal clk: std_logic := '0';
    constant clk_period: time := 20 ns;
    constant width: positive := 8;
    -- input/output signal
    signal qq: std_logic_vector(width downto 0);

begin
    -- instantiate UUT
    uut: twoway generic map (width => width)
    port map (
          clk => clk,
          q   => qq
    );

    clk_process: process
    begin
	    clk <= '0';
		wait for clk_period / 10;
		clk <= '1';
		wait for clk_period / 10;
    end process;


    -- stimulating process
    stim_proc: process
    begin

        wait for clk_period * 100;
        wait;
    end process;
end;
