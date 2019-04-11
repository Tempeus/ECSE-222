LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity g92_clock_divider is
		Generic (
		
		-- T was found using 50 mghz and the internal clock of the altera board
					T: integer:= 500000);
					
		Port (enable		:in	std_logic;
				reset			:in	std_logic;
				clk			:in	std_logic;
				en_out		:out	std_logic);
end g92_clock_divider;


architecture behaviour of g92_clock_divider is


signal count : integer:= T-1;

begin
	process(clk, reset)
	
		begin
		
		-- if reset is performed then reset to 499999
		if (reset = '0') then
			count <= T-1;
			en_out <= '0';
			
			
		elsif (rising_edge(clk)) then
			if (enable = '1') then
				count <= count - 1;
				case count is
					when 0 => en_out <= '0'; count <= T-1;
					when 1 => en_out <= '1';
					when others => en_out <= '0';
				end case;
			
			
			else
				count <= count;
			end if;
		end if;
		
	end process;
end behaviour;
