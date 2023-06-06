library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity rom_for_crc8 is
    port (
        address  :in  std_logic_vector (2 downto 0);
        data_out :out std_logic_vector (7 downto 0)
	);
end rom_for_crc8;

--
-- ROM in this architecture stores CRC sums
-- for constant input vector X"a0"
-- n-th generated CRC sum is stored under n-th address
--
architecture const_a0 of rom_for_crc8 is
    constant ADDRESS_WIDTH :integer := 3;
    constant DATA_WIDTH    :integer := 8;
    constant SIZE          :integer := 2 ** ADDRESS_WIDTH - 1;
    type rom_t is array (0 to SIZE) of std_logic_vector(DATA_WIDTH-1 downto 0);
    constant output_after_rom: rom_t := (
	    X"69",
	    X"71",
	    X"39",
	    X"c6",
	    X"35",
	    X"e2",
	    X"c9",
	    X"18"
    );
begin
  data_out <= output_after_rom(to_integer(unsigned(address)));
end const_a0;

--
-- ROM in this architecture stores CRC sums
-- for constant input vector X"66"
-- n-th generated CRC sum is stored under n-th address
--
architecture const_66 of rom_for_crc8 is
    constant ADDRESS_WIDTH :integer := 3;
    constant DATA_WIDTH    :integer := 8;
    constant SIZE          :integer := 2 ** ADDRESS_WIDTH - 1;
    type rom_t is array (0 to SIZE) of std_logic_vector(DATA_WIDTH-1 downto 0);
    constant output_after_rom : rom_t := (
        X"35",
	    X"be",
	    X"06",
	    X"27",
	    X"c0",
	    X"7b",
	    X"53",
	    X"8b"
	);
begin
  data_out <= output_after_rom(to_integer(unsigned(address)));
end const_66;
--
-- ROM in this architecture stores CRC sums
-- for constant input vector X"66"
-- n-th generated CRC sum is stored under n-th address
--
architecture const_BC of rom_for_crc8 is
    constant ADDRESS_WIDTH :integer := 3;
    constant DATA_WIDTH    :integer := 8;
    constant SIZE          :integer := 2 ** ADDRESS_WIDTH - 1;
    type rom_t is array (0 to SIZE) of std_logic_vector(DATA_WIDTH-1 downto 0);
    constant output_after_rom : rom_t := (
        X"3d",
        X"8e",
        X"9e",
	    X"ee",
	    X"b9",
	    X"1b",
        X"7c",
        X"4e"
	);
begin
  data_out <= output_after_rom(to_integer(unsigned(address)));
end const_BC;
