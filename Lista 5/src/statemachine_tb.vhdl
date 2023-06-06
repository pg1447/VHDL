LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- include also the local library for 'str' call
USE work.txt_util.ALL;


entity statemachine_tb is
end statemachine_tb;

architecture behavior of statemachine_tb is
    component statemachine
    port(
        clk:    in  std_logic;
        pusher: in  std_logic;
        driver: out  std_logic_vector(1 downto 0);
        reset   :in std_logic
    );
    end component;

    --Inputs
    signal clk : std_logic := '0';
    signal pusher : std_logic := '0';
    signal reset :std_logic := '0';

 	--Outputs
    signal driver : std_logic_vector(1 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: statemachine port map (
        clk => clk,
        pusher => pusher,
        driver => driver,
        reset => reset
    );

    -- Clock process definitions
    clk_process :process
    begin
	    clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns.
        wait for 100 ns;

        wait for clk_period * 10;
		pusher <= '1';				   -- allow state transitions now
		wait for clk_period * 2;	   -- let some states transit to some other...

		assert driver = "10"			-- test what we've got
		    report "expected state '01' on driver not achieved -- got '" & str(driver) & "'";

		wait for clk_period;
		pusher <= '0';					-- disable state transitions
		wait for clk_period * 2;

		assert driver = "11"
		    report "expected state '00' on driver not achieved -- got '" & str(driver) & "'";

        wait;
    end process;

end;
