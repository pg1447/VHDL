LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity clk2_tb is
end clk2_tb;

architecture behavior of clk2_tb is

    component clk2 is generic(N : integer);
    port(
        clk_in: in std_logic;
        clk_out: out std_logic_vector(N downto 0));
    end component;

    constant N : integer := 8;
    signal clk_in : std_logic := '0';
    signal clk_out : std_logic_vector(N downto 0) := (OTHERS => '0');
    constant clk_period : Time := 8 ns;
begin

    uut: clk2 generic map (N => N)
    port map (
        clk_in => clk_in,
        clk_out => clk_out
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk_in <= '1';
        wait for clk_period / 2;
        clk_in <= '0';
        wait for clk_period / 2;

    end process;
end;
