LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.hamming.all;

ENTITY hamming_tb IS
END hamming_tb;

ARCHITECTURE behavior OF hamming_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT lossy_channel
	GENERIC (N : positive);
		PORT(
			data_in : IN  std_logic_vector(N-1 downto 0);
			clk : IN  std_logic;
			data_out : OUT  std_logic_vector(N-1 downto 0)
			);
    END COMPONENT;

	-- channel bitwidth
	constant WIDTH : positive := 8;

	-- channel inputs
	signal data_in : std_logic_vector(3 downto 0) := (others => '0');
	signal data_in_encoded : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
	signal clk : std_logic := '0';

	-- channel outputs
	signal data_out : std_logic_vector(WIDTH-1 downto 0);
	signal data_out_decoded : std_logic_vector(3 downto 0);

	-- clock period definitions
	constant clk_period : time := 10 ns;

BEGIN

	uut: lossy_channel
	GENERIC MAP ( N => WIDTH )
	PORT MAP (
		data_in => data_in_encoded,
		clk => clk,
		data_out => data_out
        );

	-- Clock process definitions
	clk_process :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;

	decoding: process(data_out)
	begin
		data_out_decoded <= decode(data_out);
	end process;


   -- Stimulus process
   stim_proc: process
   begin
		for i in 0 to 15
		loop
			data_in <= std_logic_vector(to_unsigned(i, data_in'length));
			data_in_encoded <= encode(data_in);
            wait for 10 * clk_period;
		end loop;
		wait;
   end process;
END;
