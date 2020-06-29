library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity soma3 is PORT (
a: in std_logic_vector(11 downto 0);
b: in std_logic_vector(11 downto 0);
c: in std_logic_vector(11 downto 0);
clk: in std_logic;
s: out std_logic_vector(11 downto 0));
END entity;
ARCHITECTURE behaviour OF soma3 is
begin
process(clk)
variable s0 : std_logic_vector(11 downto 0) := a;
variable s1 : std_logic_vector(11 downto 0) := b;
variable s2 : std_logic_vector(11 downto 0) := "000000000000";
variable s3 : std_logic_vector(11 downto 0) := c;
variable s4 : std_logic_vector(11 downto 0) := "000000000000";

variable carry : std_logic :='0';
variable carry1 : std_logic :='0';
variable i : natural range 0 to 11 := 0;

begin
s0 := a;
s1 := b;
s2 := "000000000000";
s3 := c;
s4 := "000000000000";
carry :='0';
carry1 :='0';

if rising_edge(clk) then
for i in 0 to 11 loop
	s2(i) := (s0(i) xor s1(i)) xor carry;
	carry := ((s0(i) xor s1(i)) and carry)or(s0(i)and s1(i));
end loop;
for i in 0 to 11 loop
	s4(i) := (s2(i) xor s3(i)) xor carry1;
	carry1 := ((s2(i) xor s3(i)) and carry1)or(s2(i)and s3(i));
end loop;
s <= s4;
end if;
end process;
end architecture;