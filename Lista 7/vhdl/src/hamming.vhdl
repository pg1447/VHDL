library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Package is ported from C code see L7/C/src/coder.c
package hamming is
	function encode (input : STD_LOGIC_VECTOR(3 downto 0))
		return std_logic_vector;

	function decode (input :  STD_LOGIC_VECTOR(7 downto 0))
		return std_logic_vector;
end hamming;

package body hamming is
	function encode (input :  STD_LOGIC_VECTOR(3 downto 0))
		return std_logic_vector is

		variable res : std_logic_vector(7 downto 0):= (others => '0');
		begin

		res(0) := input(0) xor input(1) xor input(3);
		res(1) := input(0) xor input(2) xor input(3);
		res(2) := input(0);
		res(3) := input(1) xor input(2) xor input(3);
		res(4) := input(1);
		res(5) := input(2);
		res(6) := input(3);
		res(7) := res(0) xor res(1) xor res(2) xor res(3) xor res(4) xor res(5) xor res(6);
		return res;
	end encode;

	function decode (input :  STD_LOGIC_VECTOR(7 downto 0))
		return std_logic_vector is

		variable error_position : integer := 0;

		variable res : std_logic_vector(3 downto 0);
		begin

		res(0) := input(2);
		res(1) := input(4);
		res(2) := input(5);
		res(3) := input(6);

		if input(0) /= (input(2) xor input(4) xor input(6)) then
			error_position := error_position + 1;
		end if;

		if input(1) /= (input(2) xor input(5) xor input(6)) then
			error_position := error_position + 2;
		end if;

		if input(3) /= (input(4) xor input(5) xor input(6)) then
			error_position := error_position + 4;
		end if;


		if error_position /= 0 then
			if input(7) /= (input(0) xor input(1) xor input(2) xor input(3) xor input(4) xor input(5) xor input(6)) then
				if error_position = 3 then
					res(0) := not(res(0));
				elsif error_position = 5 then
					res(1) := not(res(1));
				elsif error_position = 6 then
					res(2) := not(res(2));
				elsif error_position = 7 then
					res(3) := not(res(3));
				end if;
			else
				res(0) := '1';
				res(1) := '1';
				res(2) := '1';
				res(3) := '1';
			end if;
		end if;

		return res;
	end decode;
end hamming;
