library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;

entity selection is
	generic(width: 	integer := 8);
	port(
			A, B: 	in std_logic_vector(width - 1 downto 0);
			s: 		in std_logic;
			C: 		out std_logic_vector(width - 1 downto 0)
	);
end selection;

architecture behavioral of selection is
begin
	process(A, B, s)
	begin

		if s = '0' then
			C <= A;
		else
			C <= B;
		end if;

	end process;
end behavioral;
