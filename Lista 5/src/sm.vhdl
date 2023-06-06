
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sm is
    port(
	   clk      :in std_logic;
	   P        :in std_logic;
	   R        :out std_logic;
       reset    :in std_logic
    );

end sm;

architecture Flow of sm is
    type stan is (A, B, C, D);
    signal cur_state : stan := A;
    signal next_state0 : stan := A;
    signal next_state1 :stan := A;
begin

state_advance: process(clk)
begin
    if reset = '1' then
        cur_state <= A;
    elsif rising_edge(clk) then
        if P = '1' then
            cur_state <= next_state1;
        else
            cur_state <= next_state0;
	    end if;
    end if;

end process;

next_state: process(cur_state)
begin
    case cur_state is
        when A =>
		    next_state0 <= A;
            next_state1 <= B;
			R <= '0';
        when B =>
			next_state0 <= B;
            next_state1 <= C;
			R <= '0';
	    when C =>
			next_state0 <= C;
            next_state1 <= D;
			R <= '0';
	    when D =>
		    next_state0 <= A;
            next_state1 <= B;
			R <= '1';
    end case;
end process;

end Flow;
