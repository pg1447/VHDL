library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity twoway is
	generic(width: positive := 8);
   	port(
		clk:  in   std_logic;
        q: 	  out  std_logic_vector(width - 1 downto 0) := (OTHERS => '0')  -- stan power-on
	);
end twoway;

architecture Behavioral of twoway is
begin
	process(clk)

	variable x: 	unsigned(width - 1 downto 0) := (others => '0');
	variable dir: 	std_logic := '0';

	begin
	 	if (clk'event AND clk = '1') then
			if dir = '1' then
				x := x + 1;
				if x = 2 ** width -1 THEN
					dir := '0';
				end if;
			else
				x := x - 1;
				if x = 0 then
					dir := '1';
				end if;
			end if;
		end if;
		q <= std_logic_vector(x);
	end process;
end Behavioral;
