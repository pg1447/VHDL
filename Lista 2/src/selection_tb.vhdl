LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity selection_tb is
end selection_tb;

architecture behavior of selection_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component selection is
    generic(width: integer);
    port(
    	   A, B:   in std_logic_vector;
    	   s:      in std_logic;
		   C:      out std_logic_vector
	);
    end component;

    constant period : time := 1 ns;
	constant width: integer := 4;

	signal A, B:   std_logic_vector(width - 1 downto 0) := (others => '0');
	signal s:      std_logic := '0';
	signal C:      std_logic_vector(width - 1 downto 0) := (others => '0');

BEGIN
	-- Instantiate the Unit Under Test (UUT)
 	UUT: selection generic map (width => width)
	port map (
		      A => A,
		      B => B,
		      s => s,
		      C => C
	);

	-- Stimulus process
	stim_proc: process
	begin

		for i in 0 to 2 ** width loop
			for j in 0 to 2 ** width loop
                for k in std_logic range '0' to '1' loop
                    s <= k;
                    wait for period;
                end loop;
				B <= std_logic_vector(unsigned(B) + 1);
			end loop;
			A <= std_logic_vector(unsigned(A) + 1);
		end loop;

      	wait;
   end process;

END;
