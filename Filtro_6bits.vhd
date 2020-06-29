LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Filtro_6bits IS
	PORT (
		clk : IN std_logic;
		y : OUT std_logic_vector (11 DOWNTO 0)
	);
END Filtro_6bits;
ARCHITECTURE behavior OF Filtro_6bits IS
	SIGNAL s0 : std_logic_vector (5 DOWNTO 0);
	SIGNAL s1 : std_logic_vector (5 DOWNTO 0);
	SIGNAL s2 : std_logic_vector (5 DOWNTO 0);
	SIGNAL s3 : std_logic_vector (5 DOWNTO 0);
	SIGNAL s4 : std_logic_vector (5 DOWNTO 0);
	SIGNAL s5 : std_logic_vector (5 DOWNTO 0);
	SIGNAL s6 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s7 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s8 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s9 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s10 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s11 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s12 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s13 : std_logic_vector (11 DOWNTO 0);
	SIGNAL s14 : std_logic_vector (11 DOWNTO 0) := "000000000000";
	SIGNAL addr : std_logic_vector (5 DOWNTO 0) := "000000";

	-------My Components-----------------------------------------------------

	COMPONENT reg
		PORT (
			d : IN std_logic_vector (5 DOWNTO 0);
			clk : IN std_logic;
			q : OUT std_logic_vector (5 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT multi31 IS
		PORT (
			a : IN std_logic_vector(5 DOWNTO 0);
			s : OUT std_logic_vector(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT multi_32 IS
		PORT (
			a : IN std_logic_vector(5 DOWNTO 0);
			s : OUT std_logic_vector(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT multi_22 IS
		PORT (
			a : IN std_logic_vector(5 DOWNTO 0);
			s : OUT std_logic_vector(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT multi21 IS
		PORT (
			a : IN std_logic_vector(5 DOWNTO 0);
			s : OUT std_logic_vector(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT multi_14 IS
		PORT (
			a : IN std_logic_vector(5 DOWNTO 0);
			s : OUT std_logic_vector(11 DOWNTO 0)
		);
	END COMPONENT;
 
	COMPONENT multi_1 IS
		PORT (
			a : IN std_logic_vector(5 DOWNTO 0);
			s : OUT std_logic_vector(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT rom IS
		PORT (
			addr : IN std_logic_vector (5 DOWNTO 0);
			clk : IN std_logic;
			dout : OUT std_logic_vector (5 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT soma IS
		PORT (
			a : IN std_logic_vector(11 DOWNTO 0);
			b : IN std_logic_vector(11 DOWNTO 0);
			clk : IN std_logic;
			s : OUT std_logic_vector(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT soma6bits IS
		PORT (
			a : IN std_logic_vector(5 DOWNTO 0);
			b : IN std_logic_vector(5 DOWNTO 0);
			clk : IN std_logic;
			s : OUT std_logic_vector(5 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT soma3 IS 
		PORT (
			a: in std_logic_vector(11 downto 0);
			b: in std_logic_vector(11 downto 0);
			c: in std_logic_vector(11 downto 0);
			clk: in std_logic;
			s: out std_logic_vector(11 downto 0)
		);
	END COMPONENT;

BEGIN
	step1 : rom PORT MAP(addr, clk, s0);
	step2 : reg	PORT MAP(s0, clk, s1);
	step3 : reg	PORT MAP(s1, clk, s2);
	step4 : reg	PORT MAP(s2, clk, s3);
	step5 : reg	PORT MAP(s3, clk, s4);
	step6 : reg	PORT MAP(s4, clk, s5);
	
	step7 : multi_32  PORT MAP(s0, s6);
	step8 : multi31	  PORT MAP(s1, s7);
	step9 : multi21	  PORT MAP(s2, s8);
	step10 : multi_1  PORT MAP(s3, s9);
	step11 : multi_14 PORT MAP(s4, s10);
	step12 : multi_22 PORT MAP(s5, s11);
	
	step13 : soma PORT MAP(s6, s7, clk, s12);
	step14 : soma PORT MAP(s8, s9, clk, s13);
	step15 : soma PORT MAP(s10, s11, clk, s14);
	
	step16 : soma3 PORT MAP(s12, s13, s14, clk, y);
	
	step17 : soma6bits PORT MAP(addr, "000001", clk, addr);
END ARCHITECTURE;