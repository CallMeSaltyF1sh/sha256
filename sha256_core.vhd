library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sha256_core is
    port(

        K  : in  std_logic_vector(31 downto 0); 
        W  : in  std_logic_vector(31 downto 0); 

       
        a_0     : in std_logic_vector(31 downto 0);
        b_0     : in std_logic_vector(31 downto 0);
        c_0     : in std_logic_vector(31 downto 0);
        d_0     : in std_logic_vector(31 downto 0);
        e_0     : in std_logic_vector(31 downto 0);
        f_0     : in std_logic_vector(31 downto 0);
        g_0     : in std_logic_vector(31 downto 0);
        h_0     : in std_logic_vector(31 downto 0);

        -- Intermediate/final hash values:
        a_1     : out std_logic_vector(31 downto 0);
        b_1     : out std_logic_vector(31 downto 0);
        c_1     : out std_logic_vector(31 downto 0);
        d_1     : out std_logic_vector(31 downto 0);
        e_1     : out std_logic_vector(31 downto 0);
        f_1     : out std_logic_vector(31 downto 0);
        g_1     : out std_logic_vector(31 downto 0);
        h_1     : out std_logic_vector(31 downto 0)
    );
end entity sha256_core;


architecture behaviour of sha256_core is
		function Ch(x, y, z : std_logic_vector) return std_logic_vector is
			begin
				return (x and y) xor ((not x) and z);
		end function Ch;

		function Maj(x, y, z : std_logic_vector) return std_logic_vector is
			begin
				return (x and y) xor (x and z) xor (y and z);
		end function Maj;

		function s0(x : std_logic_vector) return std_logic_vector is
			begin
				return std_logic_vector(rotate_right(unsigned(x), 2) xor rotate_right(unsigned(x), 13) xor rotate_right(unsigned(x), 22));
		end function s0;

		function s1(x : std_logic_vector) return std_logic_vector is
			begin
				return std_logic_vector(rotate_right(unsigned(x), 6) xor rotate_right(unsigned(x), 11) xor rotate_right(unsigned(x), 25));
		end function s1;

    
begin
	process(a_0, b_0, c_0, d_0, e_0, f_0, g_0, h_0,K,W)
		variable a, b, c, d, e, f, g, h : std_logic_vector(31 downto 0);
		variable t1, t2 : std_logic_vector(31 downto 0);
		begin
		a := a_0;
		b := b_0;
		c := c_0;
		d := d_0;
		e := e_0;
		f := f_0;
		g := g_0;
		h := h_0;

		-- Calculate temporary values:
		t1 := std_logic_vector(unsigned(h) + unsigned(s1(e))
			+ unsigned(Ch(e, f, g)) + unsigned(K) + unsigned(W));
		t2 := std_logic_vector(unsigned(s0(a)) + unsigned(Maj(a, b, c)));

		-- Assign new values to working variables:
		h := g;
		g := f;
		f := e;
		e := std_logic_vector(unsigned(d) + unsigned(t1));
		d := c;
		c := b;
		b := a;
		a := std_logic_vector(unsigned(t1) + unsigned(t2));

		-- Assign new values to the intermediate hash values:
		a_1 <= std_logic_vector(unsigned(a_0) + unsigned(a));
		b_1 <= std_logic_vector(unsigned(b_0) + unsigned(b));
		c_1 <= std_logic_vector(unsigned(c_0) + unsigned(c));
		d_1 <= std_logic_vector(unsigned(d_0) + unsigned(d));
		e_1 <= std_logic_vector(unsigned(e_0) + unsigned(e));
		f_1 <= std_logic_vector(unsigned(f_0) + unsigned(f));
		g_1 <= std_logic_vector(unsigned(g_0) + unsigned(g));
		h_1 <= std_logic_vector(unsigned(h_0) + unsigned(h));
		end process;
end architecture behaviour;
