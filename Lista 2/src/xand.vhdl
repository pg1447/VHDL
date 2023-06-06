library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;

entity xand is
	generic(width: 		integer := 8);
	port(	clk: 		in std_logic; --fake clock
			A, B: 		in std_logic_vector(width - 1 downto 0);
			C:			out std_logic_vector(width - 1 downto 0)
	);
end xand;

architecture Behavioral of xand is
begin
	C<= A and B;
end Behavioral;
