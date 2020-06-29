library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity soma6bits is PORT (
a: in std_logic_vector(5 downto 0);
b: in std_logic_vector(5 downto 0);
clk: in std_logic;
s: out std_logic_vector(5 downto 0));
END entity;
architecture behavior OF soma6bits is
begin
process(clk)
variable s0 : std_logic_vector(5 downto 0) := a;
variable s1 : std_logic_vector(5 downto 0) := b;
variable s2 : std_logic_vector(5 downto 0) := "000000";
variable carry : std_logic :='0';
variable i : natural range 0 to 5 := 0;
begin

if rising_edge(clk) then
for i in 0 to 5 loop
s2(i) := (s0(i) xor s1(i)) xor carry;
carry := ((s0(i) xor s1(i)) and carry)or(s0(i)and s1(i));
end loop;
s <= s2;
end if;
end process;
end architecture;