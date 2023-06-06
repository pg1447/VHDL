LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity xand_tb is
end xand_tb;

architecture behavior of xand_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component xand is
    generic(width: integer);
    port(
            clk: 		in std_logic; --fake clock
            A, B: 		in std_logic_vector;
            C:			out std_logic_vector
    );
    end component;

    constant period : time := 1 ns;
	constant width: integer := 4;

	signal A, B:   std_logic_vector(width - 1 downto 0) := (others => '0');
	signal clk:    std_logic := '0';
	signal C:      std_logic_vector(width - 1 downto 0) := (others => '0');

BEGIN
	-- Instantiate the Unit Under Test (UUT)
 	UUT: xand generic map (width => width)
	port map (
		      A => A,
		      B => B,
		      clk => clk,
		      C => C
	);

	-- Stimulus process
	stim_proc: process
	begin

		for i in 0 to 2 ** width loop
			for j in 0 to 2 ** width loop
                    wait for period;
				B <= std_logic_vector(unsigned(B) + 1);
			end loop;
			A <= std_logic_vector(unsigned(A) + 1);
		end loop;

      	wait;
   end process;

END;
