library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity simple is
	generic (NBit: natural := 8);
   		port  (
				clk: in  	std_logic;
           		rst: in  	std_logic;
             	q: 	 inout  unsigned(NBit - 1 downto 0)
		);
end simple;

architecture simple_counter_arch of simple is
begin
    process(clk, rst)
	begin
		if rst = '0' then
		    q <= ('1', '0', '1', '0', OTHERS => '0');
		elsif (clk'event and clk = '1') then
			 q <= q + 1;
		end if;
 	end process;
end simple_counter_arch;
