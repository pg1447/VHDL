entity unit_tb is
end unit_tb;

architecture behaviour of unit_tb is
    component unit
        port (i1, i2 :in bit; o1, o2 :out bit);
    end component;

    --  Specifies which entity is bound with the component.
    for unit_0: unit use entity work.unit;

    signal i1, i2, t1, t2, o1, o2 :bit;
begin
    --  Component instantiation.
    unit_0: unit port map (  i1 => i1,
                             i2 => i2,
                             o1 => o1,
                             o2 => o2
                          );

    process
    type pattern_type is record
        i1, i2 :bit;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
         (('0', '0'),
          ('0', '1'),
          ('1', '0'),
          ('1', '1'));
    begin

    for i in patterns'range loop
        i1 <= patterns(i).i1;
        i2 <= patterns(i).i2;

        wait for 1 ns;
    end loop;

    wait;
    end process;
end behaviour;
