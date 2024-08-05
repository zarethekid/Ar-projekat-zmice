library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MultiplexerX is

	generic (
		size : natural := 16
	);

	port (
		I0 : in std_logic_vector(size - 1 downto 0);
		I1 : in std_logic_vector(size - 1 downto 0);
		S : in std_logic;
		Y : out std_logic_vector(size - 1 downto 0)
	);

end entity;

architecture rtl of MultiplexerX is
begin

	process (S, I0, I1)
	begin
	
		if S = '0' then
			Y <= I0;
		else
			Y <= I1;
		end if;
		
	end process;
	
end rtl;
