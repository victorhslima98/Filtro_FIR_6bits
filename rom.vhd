LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY rom IS
	PORT (
		addr : IN std_logic_vector (5 DOWNTO 0);
		clk : IN std_logic;
		dout : OUT std_logic_vector (5 DOWNTO 0)
	);
END rom;

ARCHITECTURE behavior OF rom IS
	TYPE romtable IS ARRAY (0 TO 15) OF std_logic_vector (5 DOWNTO 0);
	CONSTANT romdata : romtable := (
		"000001", 
		"111111", 
		"000101", 
		"111110", 
		"000110", 
		"000101", 
		"111010", 
		"000010", 
		"000110", 
		"111101", 
		"000110", 
		"000111", 
		"000110", 
		"111101", 
		"000010", 
		"000110"
	);

BEGIN
	PROCESS (addr)
	BEGIN
		IF rising_edge (clk) THEN
			dout <= romdata(to_integer(unsigned(addr)));
		END IF;
	END PROCESS;
END behavior;