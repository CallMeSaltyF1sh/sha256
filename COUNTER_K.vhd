library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER_K is
	port
	(
		clk		: in std_logic;
		reset		: in std_logic;
		enable 	: in std_logic;
		c_k		: out integer range 0 to 63
	);
end entity;

architecture rtl of COUNTER_K is
begin
	process (clk)
		variable   cnt	: integer range 0 to 63;
	begin
		if (rising_edge(clk)) then
			if reset = '1' then
				-- Reset the counter to 0
				cnt := 0;
			elsif enable = '1' then
				-- Increment the counter if counting is enabled
				cnt := cnt + 1;
			end if;
		end if;
		
		-- Output the current count
		c_k <= cnt;
	end process;

end rtl;
