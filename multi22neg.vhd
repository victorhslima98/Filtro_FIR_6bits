library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi_22 is PORT (
a: in std_logic_vector(5 downto 0);
s: out std_logic_vector(11 downto 0));
end entity;

architecture behaviour OF multi_22 is

signal x : std_logic_vector(11 downto 0);

begin

x <= a(5)&a(5)&a(5)&a(5)&a(5)&a(5)&a;

s <= std_logic_vector(signed(x(10 downto 0)&'0')+signed(x(8 downto 0)&"000")+signed(not(x(6 downto 0)&"00000"))+1);

end architecture;