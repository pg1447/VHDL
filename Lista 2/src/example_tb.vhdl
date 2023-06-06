library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity example_tb is
end example_tb;

architecture behavior of example_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component example
    port (
            a: in  std_logic;
            b: in  std_logic;
            c: in  std_logic;
            x: out std_logic
    );
    end component;

    --inputs
    signal a: std_logic := '0';
    signal b: std_logic := '0';
    signal c: std_logic := '0';

    -- test out both declarations
    signal abc : unsigned(2 downto 0) := (others => '0');

    --outputs
    signal x : std_logic;

    -- for display clarity only
    constant period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
    uut: example PORT MAP (
                            a => a,
                            b => b,
                            c => c,
                            x => x
    );

    -- Stimulus process
    stim_proc: process
    begin

        for i in 0 to 6 loop
            abc <= abc + 1;
	        a <= abc(2);
	        b <= abc(1);
	        c <= abc(0);
	        wait for period;
	    end loop;
        wait;
    end process;

END;
