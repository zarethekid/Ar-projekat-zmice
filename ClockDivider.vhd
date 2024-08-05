library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ClockDivider is

	generic (
		period_in_MHz: natural := 50;
		period_out_ms: natural := 1
	);

	port (
		CLK_IN : in std_logic;
		RST : in std_logic;
		PAUSE : in std_logic;
		CLK_OUT : out std_logic
	);

end entity;

architecture rtl of ClockDivider is

	constant range_from : natural := (period_out_ms) * (period_in_MHz * 1000) / 2 - 1;
	
begin

	process (CLK_IN)
		variable cnt : natural range range_from downto 0;
		variable clk_out_next : std_logic := '0';
	begin
	
		if (rising_edge(CLK_IN)) then

			if RST = '1' then
				cnt := range_from;
			else	   
				if PAUSE = '0' then
					cnt := cnt - 1;
				end if;
			end if;
			
			if cnt=0 then
				clk_out_next := not clk_out_next;
			end if;
			
		end if;
		
		CLK_OUT <= clk_out_next;
		
	end process;

end rtl;
