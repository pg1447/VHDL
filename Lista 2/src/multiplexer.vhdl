-- multiplekser czterowejisciowy
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer is
    port (
            a, b, c, d: in std_logic;
            s0, s1:     in std_logic;
            x:          out std_logic
    );
end multiplexer;

architecture behavior of multiplexer is
begin
    process (a, b, c, d, s0, s1)
    variable sel: integer;
    begin
        if s0 = '0' and s1 = '0' then
	        sel := 0;
	    elsif s0 = '1' and s1 = '1' then
	        sel := 1;
	    elsif s0 = '0' and s1 = '1' then
	        sel := 2;
	    else
	        sel := 3;
	    end if;

        case sel is
	        when 0 =>
		        x <= a;
	        when 1 =>
		        x <= b;
	        when 2 =>
		        x <= c;
	        when others =>
		        x <= d;
	    end case;
    end process;
end behavior;
