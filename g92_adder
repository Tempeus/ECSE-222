library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g92_adder is
	port( A,	B				: in std_logic_vector(0 to 4); -- 5 inputs
			decoder_A		: out std_logic_vector(0 to 13); -- 14 outputs since two hexadecimals (7 segments)
			decoder_B		: out std_logic_vector(0 to 13);
			decoder_AplusB	: out std_logic_vector(0 to 13));
end g92_adder;

architecture aO of g92_adder is 
		component g92_7_segment_decoder is
			port ( code					: in std_logic_vector (0 to 3); -- Can only take 4 bits, since input is 5, we need to take part of the input and make another temporary variable
						segments		: out std_logic_vector (0 to 6)
						);
		end component;
		
		signal Ai 			: std_logic_vector(0 to 3) := (others => '0');
		signal Bi 			: std_logic_vector(0 to 3) := (others => '0');
		signal A_plus_B 	: std_logic_vector(0 to 5) := (others => '0');
		signal A_plus_Bi	: std_logic_vector(0 to 3) := (others => '0');
		signal A_resized	: std_logic_vector(0 to 5) := (others => '0'); -- Changing it to 6 bit so it will prevent overload
		signal B_resized	: std_logic_vector(0 to 5) := (others => '0');
		
		begin
					Ai(3) <= A(0); -- Assigning the first bit of A to the fouth position of Ai
					Bi(3) <= B(0);
					A_resized(1 to 5) <= A(0 to 4); -- Appending A stuff to the 6 bit A
					B_resized(1 to 5) <= B(0 to 4);
					
					segment7_A1: g92_7_segment_decoder port map (A(1 to 4), decoder_A(7 to 13));
					segment7_A2: g92_7_segment_decoder port map (Ai(0 to 3), decoder_A(0 to 6));
					segment7_B1: g92_7_segment_decoder port map (B(1 to 4), decoder_B(7 to 13));
					segment7_B2: g92_7_segment_decoder port map (Bi(0 to 3), decoder_B(0 to 6));
					A_plus_B <= std_logic_vector(unsigned(A_resized) + unsigned(B_resized));
					A_plus_Bi (2 to 3) <= A_plus_B (0 to 1);
 					segment7_sum1: g92_7_segment_decoder port map (A_plus_B(2 to 5), decoder_AplusB(7 to 13));
					segment7_sum2: g92_7_segment_decoder port map (A_plus_Bi(0 to 3), decoder_AplusB(0 to 6));
end aO;
