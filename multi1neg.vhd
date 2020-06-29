library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi_1 is PORT (
a: in std_logic_vector(5 downto 0);
s: out std_logic_vector(11 downto 0));
end entity;

architecture behaviour OF multi_1 is
begin

s <= std_logic_vector(signed(not(a(5)&a(5)&a(5)&a(5)&a(5)&a(5)&a))+1);

end architecture;