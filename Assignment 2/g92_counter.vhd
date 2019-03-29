LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY g92_counter IS
	PORT ( clk, reset, enable  : IN  STD_LOGIC;
			count							: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0));
END g92_counter;

ARCHITECTURE a0 OF g92_counter IS
	SIGNAL counter: unsigned(3 DOWNTO 0);
BEGIN 
	PROCESS ( clk, reset )
	BEGIN 
		IF reset = '0' THEN
			counter <= "0000";
		ELSIF (rising_edge(clk)) THEN
			IF (enable = '1') THEN
				counter <= counter + 1;
			
			ELSE
				counter <= counter;
			END IF;
		END IF;
	END PROCESS;
	count <= std_logic_vector(counter);
END a0;