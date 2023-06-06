-- bramka AND
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateAND is
	port (
			X: in std_logic;
			Y: in std_logic;
			Z: out std_logic
	);
end gateAND;

architecture Behavioral of gateAND is
begin
	Z <= X and Y after 1 ns;
end Behavioral;

-- bramka OR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateOR is
	port (
			X: in std_logic;
			Y: in std_logic;
			Z: out std_logic
	);
end gateOR;

architecture Behavioral of gateOR is
begin
	Z <= X or Y after 1 ns;
end Behavioral;

-- bramka XOR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateXOR is
	port (
			X: in std_logic;
			Y: in std_logic;
			Z: out std_logic
	);
end gateXOR;

architecture Behavioral of gateXOR is
begin
	Z <= X xor Y after 1 ns;
end Behavioral;

-- bramka NOT
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateNOT is
	port (
   			X: in std_logic;
			Z: out std_logic
	);
end gateNOT;

architecture Behavioral of gateNOT is
begin
	Z <= not X after 1 ns;
end Behavioral;
