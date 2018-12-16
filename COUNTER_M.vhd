library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER_M is
    port
    (
        clk     : in std_logic;
        reset   : in std_logic;
        enable  : in std_logic;
        c_k     : in integer range 0 to 63;
        c_m     : out integer range 0 to 255
    );
end entity;

architecture rtl of COUNTER_M is
begin
    process (clk)
        variable   cnt  : integer range 0 to 255;
    begin
        if (rising_edge(clk) and c_k = 63 ) then
            if reset = '1' then
                cnt := 0;
            elsif enable = '1' then
                cnt := cnt + 1;
            end if;
        end if;
        c_m  <= cnt;
    end process;
end rtl;