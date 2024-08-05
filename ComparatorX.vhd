library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComparatorX is

	generic (
		size : natural := 16
	);

	port (
		A : in  std_logic_vector(size - 1 downto 0);
		B : in std_logic_vector(size - 1 downto 0);
		EQ : out std_logic;
		LS : out std_logic;
		GR : out std_logic
	);

end entity;

architecture rtl of ComparatorX is
begin

	process (A, B)
	begin
		if A = B then
			EQ <= '1';
		else
			EQ <= '0';
		end if;
		
		if unsigned(A) > unsigned(B) then
			GR <= '1';
		else
			GR <= '0';
		end if;
		
		if unsigned(A) < unsigned(B) then
			LS <= '1';
		else
			LS <= '0';
		end if;
		
	end process;

end rtl;
