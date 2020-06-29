LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg IS
	PORT (
		D : IN std_logic_vector (5 DOWNTO 0);
		CLK : IN std_logic;
		Q : OUT std_logic_vector (5 DOWNTO 0)
	);
END ENTITY;
ARCHITECTURE behaviour OF reg IS
BEGIN
	PROCESS (CLK)
	BEGIN
		IF rising_edge(clk) THEN
			Q <= D;
		END IF;
	END PROCESS;
END ARCHITECTURE;