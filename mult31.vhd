library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi31 is PORT (
a: in std_logic_vector(5 downto 0);
s: out std_logic_vector(11 downto 0));
end entity;

architecture behaviour OF multi31 is

signal x : std_logic_vector(11 downto 0);

begin

x <= a(5)&a(5)&a(5)&a(5)&a(5)&a(5)&a;

s <= std_logic_vector(signed(x)+signed(x(10 downto 0)&'0')+signed(x(9 downto 0)&"00")+signed(x(8 downto 0)&"000")+signed(x(7 downto 0)&"0000"));

end architecture;