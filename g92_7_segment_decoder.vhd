library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g92_7_segment_decoder is
	Port( code		: in std_logic_vector(0 to 3);
			segments	: out std_logic_vector (0 to 6)
			);
end g92_7_segment_decoder;

architecture lab1 of g92_7_segment_decoder is

begin
process (code)
begin
	case code is
	when "0000" => segments <= "0000001"; -- 0
	when "0001" => segments <= "1001111"; -- 1
	when "0010" => segments <= "0010010"; -- 2
	when "0011" => segments <= "0000110"; -- 3
	when "0100" => segments <= "1001100"; -- 4
	when "0101" => segments <= "0100100"; -- 5
	when "0110" => segments <= "0100000"; -- 6
	when "0111" => segments <= "0001111"; -- 7
	when "1000" => segments <= "0000000"; -- 8
	when "1001" => segments <= "0000100"; -- 9
	when "1010" => segments <= "0001000"; -- 10(A)
	when "1011" => segments <= "1100000"; -- 11(B)
	when "1100" => segments <= "0110001"; -- 12(C)
	when "1101" => segments <= "1000010"; -- 13(D)
	when "1110" => segments <= "0110000"; -- 14(E)
	when "1111" => segments <= "0111000"; -- 15(F)
	when others => segments <= "1111111"; -- Nothing
	end case;
end process;
end lab1;
