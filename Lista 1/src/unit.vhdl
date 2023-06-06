entity unit is
    port (i1, i2 :in bit; o1, o2 :out bit);
end unit;

architecture behaviour of unit is
    signal t1: bit;
    signal t2: bit;
begin
    t1 <= i1 and i2;
    t2 <= i1 or i2;
    o1 <= t1 nor t2;
    o2 <= t1 xor t2;
end behaviour;
