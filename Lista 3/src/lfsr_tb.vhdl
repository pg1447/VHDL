LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use std.textio.all;

entity lfsr_tb is
end lfsr_tb;

architecture behavior of lfsr_tb is

    -- UUT (Unit Under Test)
    component lfsr
    port(
            clk     :in     std_logic;
            q       :inout  std_logic_vector(15 downto 0)
    );
    end component;

   -- input signals
   signal clk   :std_logic := '0';
   -- input/output signal
   signal qq    :std_logic_vector(15 downto 0) := (others => '1');
   -- set clock period
   constant clk_period  :time := 2 ns;
   constant wait_time   :time := clk_period * 16;

BEGIN
	-- instantiate UUT
   uut: lfsr port map (
          clk   => clk,
          q     => qq
    );

   -- clock management process
   -- no sensitivity list, but uses 'wait'
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- stimulating process
   stim_proc: process
   variable init    :integer;
   variable l       :line;
   variable steps   :integer;
   begin
       --readline(input, l); -- read line from stdin
       init := 0;
       steps := 0;
       --read(l, init); -- convert line to integer
       --qq <= std_logic_vector(to_unsigned(init, 16));
       wait for clk_period;
       steps := steps + 1;
       while unsigned(qq) /= to_unsigned(init, 16) loop
           steps := steps + 1;
           write(l, to_integer(unsigned(qq)));
           writeline(output, l);
           wait for clk_period;
       end loop;

       write(l, to_integer(unsigned(qq)));
       writeline(output, l);

       write(l, steps);
       writeline(output, l);
       wait;
  end process;
end;
