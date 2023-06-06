use std.textio.all;

entity echo is
end echo;

architecture behaviour of echo is
begin
    process
        variable l : line;
    begin
        readline(input, l);
        writeline(output, l);
        wait;
    end process;
end behaviour;
