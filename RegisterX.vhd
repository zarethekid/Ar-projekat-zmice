library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterX is

	generic (
		size : natural := 16;
		default_value : natural := 0
	);

	port  (
		CLK : in std_logic;
		LD : in std_logic := '0';
		CL : in std_logic := '0';
		INC : in std_logic := '0';
		DEC : in std_logic := '0';
		DATA_IN : in std_logic_vector(size - 1 downto 0);
		DATA_OUT : out std_logic_vector(size - 1 downto 0)
	);

end entity;

architecture rtl of RegisterX is
	signal data, data_next : std_logic_vector(size - 1 downto 0) := std_logic_vector(to_unsigned(default_value, size));
begin
	
	DATA_OUT <= data;
	
	process (CLK)
	begin
	
		if (rising_edge(CLK)) then
			data <= data_next;
		end if;
		
	end process;

	process (LD, INC, DEC, CL, DATA_IN, data)
	begin
	
		if CL = '1' then
			data_next <= (others => '0');
		elsif LD = '1' then
			data_next <= data_in;
		elsif INC ='1' then
			data_next <= std_logic_vector(to_unsigned(to_integer(unsigned(data )) + 1, size));
		elsif DEC ='1' then
			data_next <= std_logic_vector(to_unsigned(to_integer(unsigned(data )) - 1, size));
		else
			data_next <= data;
		end if;
		
	end process;

end rtl;
