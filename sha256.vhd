library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256 is
    port(
        clk           : in  std_logic;
        reset         : in  std_logic
        );
end entity sha256;


architecture rtl of sha256 is

    signal k_address : std_logic_vector(5 downto 0);
    signal m_address : std_logic_vector(15 downto 0);
    signal k_cs, k_clken, m_cs, m_clken :std_logic;
    signal h_0,h_1,h_2,h_3,h_4,h_5,h_6,h_7 : std_logic_vector(31 downto 0);
    signal m_chunk : std_logic_vector(7 downto 0);
    signal k_readdata, m_readdata : std_logic_vector(31 downto 0);

    signal counter_k_c : integer range 0 to 63;
    signal counter_m_c : integer range 0 to 255;


    signal irq_system,mux_select : std_logic;


    signal hh1,hh2,hh3,hh4,hh5,hh6,hh7,hh8 :std_logic_vector(31 downto 0);

    signal msg_all_sha :std_logic_vector(31 downto 0);
	 signal enable_start : std_logic := '1';

    component sha256_core is
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
    end component sha256_core;


    component Wj_gen is
    port(
        c_k		     : in  integer range 0 to 63;
        msg         : in  std_logic_vector (31 downto 0);
        msg_all     : out std_logic_vector (31 downto 0)
        );
    end component Wj_gen;

    component COUNTER_K is
    port
    (
        clk     : in std_logic;
        reset   : in std_logic;
        enable  : in std_logic;
        c_k       : out integer range 0 to 63
    );
    end component;

    component COUNTER_M is
    port
    (
        clk     : in std_logic;
        reset   : in std_logic;
        enable  : in std_logic;
        c_k     : in integer range 0 to 63;
        c_m     : out integer range 0 to 255
    );
    end component;

    component MUX is
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
    end component;

    component FSM is
        port(
                clk         :  in  std_logic;
                reset       :  in  std_logic;
                c_k         :  in  integer range 0 to 63; -- counter k
                cs_k        :  out std_logic;
                rd_k        :  out std_logic;
                addr_k      :  out std_logic_vector(5 downto 0);
                
                c_m         :  in  integer range 0 to 255;
                cs_m        :  out std_logic;
                rd_m        :  out std_logic;
                addr_m      :  out std_logic_vector(15 downto 0);

                m           :  in  std_logic_vector(7 downto 0);   -- number of chunk

                sel         :  out std_logic;
                irq         :  out std_logic
            );
    end component;

    component soc_system is
        port (
            clk_clk                        : in    std_logic                     := 'X';             -- clk
            reset_reset_n                  : in    std_logic                     := 'X';             -- reset_n
            memory_mem_a                   : out   std_logic_vector(12 downto 0);                    -- mem_a
            memory_mem_ba                  : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck                  : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n                : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke                 : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n                : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n               : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n               : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n                : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n             : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq                  : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
            memory_mem_dqs                 : inout std_logic                     := 'X';             -- mem_dqs
            memory_mem_dqs_n               : inout std_logic                     := 'X';             -- mem_dqs_n
            memory_mem_odt                 : out   std_logic;                                        -- mem_odt
            memory_mem_dm                  : out   std_logic;                                        -- mem_dm
            memory_oct_rzqin               : in    std_logic                     := 'X';             -- oct_rzqin
            m_external_connection_export   : out   std_logic_vector(7 downto 0);                     -- export
            h_7_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
            h_6_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
            h_5_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
            h_4_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
            h_3_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
            h_2_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
            h_1_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
            h_0_external_connection_export : in    std_logic_vector(31 downto 0) := (others => 'X');
            memory_k_s1_address            : in    std_logic_vector(5 downto 0)  := (others => 'X'); -- address
            memory_k_s1_debugaccess        : in    std_logic                     := 'X';             -- debugaccess
            memory_k_s1_clken              : in    std_logic                     := 'X';             -- clken
            memory_k_s1_chipselect         : in    std_logic                     := 'X';             -- chipselect
            memory_k_s1_write              : in    std_logic                     := 'X';             -- write
            memory_k_s1_readdata           : out   std_logic_vector(31 downto 0);                    -- readdata
            memory_k_s1_writedata          : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
            memory_k_s1_byteenable         : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
            memory_m_s2_address            : in    std_logic_vector(15 downto 0) := (others => 'X'); -- address
            memory_m_s2_chipselect         : in    std_logic                     := 'X';             -- chipselect
            memory_m_s2_clken              : in    std_logic                     := 'X';             -- clken
            memory_m_s2_write              : in    std_logic                     := 'X';             -- write
            memory_m_s2_readdata           : out   std_logic_vector(31 downto 0);                    -- readdata
            memory_m_s2_writedata          : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
            memory_m_s2_byteenable         : in    std_logic_vector(3 downto 0)  := (others => 'X')  -- byteenable
        );
    end component soc_system;
begin

		
    u0 : component soc_system
        port map (
            clk_clk                        => clk,                        --                     clk.clk
            reset_reset_n                  => reset,                  --                   reset.reset_n
            --memory_mem_a                   => CONNECTED_TO_memory_mem_a,                   --                  memory.mem_a
            --memory_mem_ba                  => CONNECTED_TO_memory_mem_ba,                  --                        .mem_ba
            --memory_mem_ck                  => CONNECTED_TO_memory_mem_ck,                  --                        .mem_ck
            --memory_mem_ck_n                => CONNECTED_TO_memory_mem_ck_n,                --                        .mem_ck_n
            --memory_mem_cke                 => CONNECTED_TO_memory_mem_cke,                 --                        .mem_cke
            --memory_mem_cs_n                => CONNECTED_TO_memory_mem_cs_n,                --                        .mem_cs_n
            --memory_mem_ras_n               => CONNECTED_TO_memory_mem_ras_n,               --                        .mem_ras_n
            --memory_mem_cas_n               => CONNECTED_TO_memory_mem_cas_n,               --                        .mem_cas_n
            --memory_mem_we_n                => CONNECTED_TO_memory_mem_we_n,                --                        .mem_we_n
            --memory_mem_reset_n             => CONNECTED_TO_memory_mem_reset_n,             --                        .mem_reset_n
            --memory_mem_dq                  => CONNECTED_TO_memory_mem_dq,                  --                        .mem_dq
            --memory_mem_dqs                 => CONNECTED_TO_memory_mem_dqs,                 --                        .mem_dqs
            --memory_mem_dqs_n               => CONNECTED_TO_memory_mem_dqs_n,               --                        .mem_dqs_n
            --memory_mem_odt                 => CONNECTED_TO_memory_mem_odt,                 --                        .mem_odt
            --memory_mem_dm                  => CONNECTED_TO_memory_mem_dm,                  --                        .mem_dm
            --memory_oct_rzqin               => CONNECTED_TO_memory_oct_rzqin,               --                        .oct_rzqin
            m_external_connection_export   => m_chunk,                                     --   m_external_connection.export
            h_7_external_connection_export => h_7,                                         -- h_7_external_connection.export
            h_6_external_connection_export => h_6,                                         -- h_6_external_connection.export
            h_5_external_connection_export => h_5,                                         -- h_5_external_connection.export
            h_4_external_connection_export => h_4,                                         -- h_4_external_connection.export
            h_3_external_connection_export => h_3,                                         -- h_3_external_connection.export
            h_2_external_connection_export => h_2,                                         -- h_2_external_connection.export
            h_1_external_connection_export => h_1,                                         -- h_1_external_connection.export
            h_0_external_connection_export => h_0,
            memory_k_s1_address            => k_address,            --             memory_k_s1.address
            --memory_k_s1_debugaccess        => k_debugaccess,        --                        .debugaccess
            memory_k_s1_clken              => k_clken,              --                        .clken
            memory_k_s1_chipselect         => k_cs,                 --                        .chipselect
            --memory_k_s1_write              => k_write,              --                        .write
            memory_k_s1_readdata           => k_readdata,           --                        .readdata
            --memory_k_s1_writedata          => k_writedata,          --                        .writedata
            --memory_k_s1_byteenable         => k_byteenable,         --                        .byteenable
            memory_m_s2_address            => m_address,            --             memory_m_s2.address
            memory_m_s2_chipselect         => m_cs,                 --                        .chipselect
            memory_m_s2_clken              => m_clken,              --                        .clken
            --memory_m_s2_write              => m_write,              --                        .write
            memory_m_s2_readdata           => m_readdata           --                        .readdata
            --memory_m_s2_writedata          => m_writedata,          --                        .writedata
            --memory_m_s2_byteenable         => m_byteenable          --                        .byteenable
        );
    u1 : component FSM 
        port map(clk=>clk,reset=>reset,c_k=>counter_k_c,cs_k=>k_cs,rd_k=>k_clken,addr_k=>k_address,
            c_m=>counter_m_c,cs_m=>m_cs,rd_m=>m_clken,addr_m=>m_address,m=>m_chunk,sel=>mux_select,irq=> irq_system);

    u2 : component  COUNTER_K
        port map(clk=>clk,reset=>reset,enable=>enable_start,c_k=>counter_k_c);
    u3 : component COUNTER_M
        port map(clk=>clk,reset=>reset,enable=>enable_start,c_k=>counter_k_c,c_m=>counter_m_c);
    u4 : component MUX
        port map(a_1=>hh1,b_1=>hh2,c_1=>hh3,d_1=>hh4,e_1=>hh5,f_1=>hh6,g_1=>hh7,h_1=>hh8,
            a_0=>h_0,b_0=>h_1,c_0=>h_2,d_0=>h_3,e_0=>h_4,f_0=>h_5,g_0=>h_6,h_0=>h_7,sel=>mux_select);

    u5 : component Wj_gen
        port map(c_k=>counter_k_c,msg=>m_readdata,msg_all=>msg_all_sha);

    u6 : component sha256_core 
        port map(a_0=>hh1,b_0=>hh2,c_0=>hh3,d_0=>hh4,e_0=>hh5,f_0=>hh6,g_0=>hh7,h_0=>hh8,
            a_1=>h_0,b_1=>h_1,c_1=>h_2,d_1=>h_3,e_1=>h_4,f_1=>h_5,g_1=>h_6,h_1=>h_7,k=>k_readdata,w=>msg_all_sha);







end architecture ; -- rtl