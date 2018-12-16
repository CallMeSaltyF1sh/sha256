library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Wj_gen is
    port(
        c_k         : in  integer range 0 to 63;
        msg         : in  std_logic_vector (31 downto 0);
        msg_all     : out std_logic_vector (31 downto 0)
        );
end entity Wj_gen;

architecture behaviour of Wj_gen is
        signal j : integer range 0 to 63 ;
        type expanded_message_block_array is array(0 to 63) of std_logic_vector(31 downto 0);
        signal W : expanded_message_block_array;

        function o0(x : std_logic_vector) return std_logic_vector is
        begin
          return std_logic_vector(rotate_right(unsigned(x), 7) xor rotate_right(unsigned(x), 18) xor shift_right(unsigned(x), 3));
        end function o0;

        function o1(x : std_logic_vector) return std_logic_vector is
        begin
            return std_logic_vector(rotate_right(unsigned(x), 17) xor rotate_right(unsigned(x), 19) xor shift_right(unsigned(x), 10));
        end function o1;
begin
    j <= c_k;
    process(j,W)
    begin
        if (j < 16) then
            W(j) <= msg;
        else 
            W(j) <= std_logic_vector(unsigned(o1(W(j - 2))) + unsigned(W(j - 7)) + unsigned(o0(W(j - 15))) + unsigned(W(j - 16)));
        end if;
        msg_all <= W(j);
    end process;
end architecture behaviour ;