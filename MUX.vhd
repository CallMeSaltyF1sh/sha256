library IEEE;
use IEEE.std_logic_1164.all;

entity MUX is
port(
        a_1     : in std_logic_vector(31 downto 0);
        b_1     : in std_logic_vector(31 downto 0);
        c_1     : in std_logic_vector(31 downto 0);
        d_1     : in std_logic_vector(31 downto 0);
        e_1     : in std_logic_vector(31 downto 0);
        f_1     : in std_logic_vector(31 downto 0);
        g_1     : in std_logic_vector(31 downto 0);
        h_1     : in std_logic_vector(31 downto 0);

        a_0     : out std_logic_vector(31 downto 0);
        b_0     : out std_logic_vector(31 downto 0);
        c_0     : out std_logic_vector(31 downto 0);
        d_0     : out std_logic_vector(31 downto 0);
        e_0     : out std_logic_vector(31 downto 0);
        f_0     : out std_logic_vector(31 downto 0);
        g_0     : out std_logic_vector(31 downto 0);
        h_0     : out std_logic_vector(31 downto 0);
        --K       : out std_logic_vector(31 downto 0);

        sel     : in std_logic
	 );
end MUX;

architecture rtl of MUX is

begin
  p_mux : process(a_1, b_1, c_1, d_1, e_1, f_1, g_1, h_1, sel)
  begin
    case sel is
      when '0' => 
        a_0 <=  X"6a09e667";
        b_0 <=  X"bb67ae85";
        c_0 <=  X"3c6ef372";
        d_0 <=  X"a54ff53a";
        e_0 <=  X"510e527f";
        f_0 <=  X"9b05688c";
        g_0 <=  X"1f83d9ab";
        h_0 <=  X"5be0cd19";
      when '1' => 
        a_0 <= a_1;
        b_0 <= b_1;
        c_0 <= c_1;
        d_0 <= d_1;
        e_0 <= e_1;
        f_0 <= f_1;
        g_0 <= g_1;
        h_0 <= h_1;
    end case;
  end process p_mux;
end rtl;
