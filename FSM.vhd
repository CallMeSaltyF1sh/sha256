library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--use ieee.numeric_std_unsigned.all


entity FSM is
port(
	clk         :  in  std_logic;
	reset       :  in  std_logic;
	c_k         :  in  integer range 0 to 63; -- counter k
	cs_k        :  out std_logic;
	rd_k        :  out std_logic;
	addr_k      :  out std_logic_vector(5 downto 0);
	
	c_m			:  in  integer range 0 to 255;
	cs_m        :  out std_logic;
	rd_m        :  out std_logic;
	addr_m      :  out std_logic_vector(15 downto 0);

	m           :  in  std_logic_vector(7 downto 0);   -- number of chunk

	sel         :  out std_logic;
	irq         :  out std_logic);

end FSM;

architecture rtl of FSM is
type state_type is (START, RET, IDEL, FINAL);
    signal state : state_type;
--    signal word_address   : std_logic_vector(3 downto 0);

begin
    process(reset, clk, c_k, c_m)
    begin
        if (reset = '1') then
            state <= START;
				sel <= '1';
        elsif rising_edge(clk) then
        case state is
            when START =>
                state <= RET; 
            when RET =>
					 sel <= '1';
                state <= IDEL;
					 
            when IDEL  =>
                if (c_k = 63 and c_m = unsigned(m) ) then
                    state <= FINAL;
                end if;
            when others =>
                state <= START;
        end case;    
    end if;
    end process ; 


    addr_k <= std_logic_vector(to_unsigned(c_k, 6));
    addr_m(11 downto 4) <= std_logic_vector(to_unsigned(c_m, 8));
	 addr_m(3  downto 0) <= std_logic_vector(to_unsigned(c_k, 4));

    cs_m <= '1';
    cs_k <= '1';
    rd_m <= '1';
    rd_k <= '1';

--    sel <= '1' when state = RET   else '0';

    irq <= '1' when state = FINAL else '0';

end rtl;

--end architecture ; -- rtl