-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/12/2019 14:16:48"
                                                            
-- Vhdl Test Bench template for design  :  g92_7_segment_decoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
use IEEE.NUMERIC_STD.ALL;                              

ENTITY g92_7_segment_decoder_vhd_tst IS
END g92_7_segment_decoder_vhd_tst;
ARCHITECTURE g92_7_segment_decoder_arch OF g92_7_segment_decoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL segments : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT g92_7_segment_decoder
	PORT (
	code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	segments : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g92_7_segment_decoder
	PORT MAP (
-- list connections between master ports and signals
	code => code,
	segments => segments
	);
generate_test : PROCESS                                                                                    
BEGIN                                                         
	FOR i IN 0 to 15 LOOP
	code <= std_logic_vector(to_unsigned(i,4));
	WAIT FOR 10 ns;
	END LOOP;
	WAIT;                                                        
END PROCESS generate_test;                                          
END g92_7_segment_decoder_arch;
