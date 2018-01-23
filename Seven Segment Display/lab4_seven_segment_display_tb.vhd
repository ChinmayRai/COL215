----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/15/2017 05:14:28 AM
-- Design Name: 
-- Module Name: seven_segment_display_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--USE ieee.numeric_std.ALL;
library std;
use std.textio.all;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab4_seven_segment_display_tb is
end lab4_seven_segment_display_tb;

architecture Behavioral of lab4_seven_segment_display_tb is

   component lab4_seven_segment_display
   port ( b : in  STD_LOGIC_VECTOR (15 downto 0);
				  pushbutton : in STD_LOGIC;
              cathode : out  STD_LOGIC_VECTOR (6 downto 0);
              anode : out  STD_LOGIC_VECTOR (3 downto 0);
              clk : in  STD_LOGIC);
   end component;

    signal b : STD_LOGIC_VECTOR (15 downto 0);
	 signal pushbutton : STD_LOGIC;
    signal cathode : STD_LOGIC_VECTOR (6 downto 0);
    signal anode : STD_LOGIC_VECTOR (3 downto 0);
    signal clk : STD_LOGIC := '0';
    
    signal err_cnt_signal : INTEGER;
    constant clk_period : time := 10 ns;

	 signal an_num: STD_LOGIC_VECTOR (4 downto 0) := (others => '1');

	 type display_output is array (0 to 7) of STD_LOGIC_VECTOR (6 downto 0);
	 type bin_type is array (0 to 7) of STD_LOGIC_VECTOR (15 downto 0);
	 type error_type is array (0 to 7) of INTEGER;

begin

   UUT: lab4_seven_segment_display port map(
		b => b, 
		pushbutton => pushbutton,
		cathode => cathode, 
		anode => anode, 
		clk => clk
   );
	
	clk_process :process
   begin

	  wait for 5 ns;
      clk <= not clk;
   end process;

	
-- *** Test Bench - User Defined Section ***
  tb : process (clk)

   variable err_cnt : INTEGER := 0;
	variable s : line;
	
	variable b_input : bin_type := (others => (others=>'0'));
	variable cathode0 : display_output := (others => (others=>'0'));
	variable cathode1 : display_output := (others => (others=>'0'));
	variable cathode2 : display_output := (others => (others=>'0'));
	variable cathode3 : display_output := (others => (others=>'0'));
	variable first_cycle : INTEGER := 0;
	variable input_index : INTEGER := 0;
	variable error_printed : INTEGER := 0;
	variable error_testcase : error_type := (others => 0);
	
--			when "0000" => display <= "1000000";	--0
--			when "0001" => display <= "1111001";	--1
--			when "0010" => display <= "0100100";	--2
--			when "0011" => display <= "0110000";	--3
--			when "0100" => display <= "0011001";	--4
--			when "0101" => display <= "0010010";	--5
--			when "0110" => display <= "0000010";	--6
--			when "0111" => display <= "1111000";	--7
--			when "1000" => display <= "0000000";	--8
--			when "1001" => display <= "0010000";	--9
--			when "1010" => display <= "0001000";	--A
--			when "1011" => display <= "0000011";	--b
--			when "1100" => display <= "1000110";	--C
--			when "1101" => display <= "0100001";	--d
--			when "1110" => display <= "0000110";	--E
--			when others => display <= "0001110";	--F

--			NOTE
--			begin (at time 0) with displaying the digit corresponding to anode AN3 (0111)
--			after 10 ns, display the digit corresponding to anode AN0 (1110)
--			henceforth, after every 10 ns (1 clock cycles), change the display in this order: AN0 -> AN1 -> AN2 -> AN3 -> AN0 ...

    begin
	-- b_input = (1234, 1001, 0204, E7A3, 5b6d, C89F, 9F35, FFFE)
	b_input := ("0001001000110100","0001000000000001","0000001000000100","1110011110100011","0101101101101101","1100100010011111","1001111100110101","1111111111111110");
   cathode3 :=  ("1111001","1111001","1000000","0000110","0010010","1000110","0010000","0001110");
   cathode2 :=  ("0100100","1000000","0100100","1111000","0000011","0000000","0001110","0001110");
   cathode1 :=  ("0110000","1000000","1000000","0001000","0000010","0010000","0110000","0001110");
   cathode0 :=  ("0011001","1111001","0011001","0110000","0100001","0001110","0010010","0000110");
   pushbutton <= '1';
	--signal bin : STD_LOGIC_VECTOR (15 downto 0);

                                                   
if ((clk'event and clk = '1') and input_index <= 7) then
-- initial check
b <= b_input(input_index);	
	if(first_cycle = 0) then	
		first_cycle := 1;
		report "Spending 1 cycle (10ns) idle";

	 --testcase1
         elsif(an_num = "00000") then		
		assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase1 an_num=00000"; 
		if(cathode/=cathode0(input_index) or anode/="1110") then
			error_testcase(0) := 1;
		end if;
		elsif(an_num = "00001") then							  	
			assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase1 an_num=00001";
			if(cathode/=cathode1(input_index) or anode/="1101") then
				error_testcase(0) := 1;
			end if;
		elsif(an_num = "00010") then
			assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase1 an_num=00010";
			if(cathode/=cathode2(input_index) or anode/="1011") then
				error_testcase(0) := 1;
			end if;
			input_index := input_index + 1;
		elsif(an_num = "00011") then
			assert (cathode=cathode3(input_index-1) and anode="0111") report "Error in testcase1 an_num=00011";	
			if(cathode/=cathode3(input_index-1) or anode/="0111") then
				error_testcase(0) := 1;
			end if;
											
                --testcase2
					 elsif(an_num = "00100") then
                    assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase2 an_num=00100";						  
						  if(cathode/=cathode0(input_index) or anode/="1110") then
								error_testcase(1) := 1;
							end if;
                elsif(an_num = "00101") then
                    assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase2 an_num=00101";
						  if(cathode/=cathode1(input_index) or anode/="1101") then
								error_testcase(1) := 1;
							end if;
                elsif(an_num = "00110") then
                    assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase2 an_num=00110";
						  if(cathode/=cathode2(input_index) or anode/="1011") then
								error_testcase(1) := 1;
							end if;
						  	input_index := input_index + 1;
                elsif(an_num = "00111") then
                    assert (cathode=cathode3(input_index-1) and anode="0111") report "Error in testcase2 an_num=00111";
						  if(cathode/=cathode3(input_index-1) or anode/="0111") then
								error_testcase(1) := 1;
							end if;
               
					--testcase3
					 elsif(an_num = "01000") then
                    assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase3 an_num=01000";
						  if(cathode/=cathode0(input_index) or anode/="1110") then
								error_testcase(2) := 1;
							end if;
                elsif(an_num = "01001") then
                    assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase3 an_num=01001";
						  if(cathode/=cathode1(input_index) or anode/="1101") then
								error_testcase(2) := 1;
							end if;
                elsif(an_num = "01010") then
                    assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase3 an_num=01010";
						  if(cathode/=cathode2(input_index) or anode/="1011") then
								error_testcase(2) := 1;
							end if;
						  	input_index := input_index + 1;
                elsif(an_num = "01011") then
                    assert (cathode=cathode3(input_index-1) and anode="0111") report "Error in testcase3 an_num=01011";
						  if(cathode/=cathode3(input_index-1) or anode/="0111") then
								error_testcase(2) := 1;
							end if;
					
					--testcase4
					 elsif(an_num = "01100") then
                    assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase4 an_num=01100";
						  if(cathode/=cathode0(input_index) or anode/="1110") then
								error_testcase(3) := 1;
							end if;
                elsif(an_num = "01101") then
                    assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase4 an_num=01101";
						  if(cathode/=cathode1(input_index) or anode/="1101") then
								error_testcase(3) := 1;
							end if;
                elsif(an_num = "01110") then
                    assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase4 an_num=01110";
						  if(cathode/=cathode2(input_index) or anode/="1011") then
								error_testcase(3) := 1;
							end if;
							input_index := input_index + 1;
                elsif(an_num = "01111") then
                    assert (cathode=cathode3(input_index-1) and anode="0111") report "Error in testcase4 an_num=01111";
						  if(cathode/=cathode3(input_index-1) or anode/="0111") then
								error_testcase(3) := 1;
							end if;
					
					--testcase5
					 elsif(an_num = "10000") then
                    assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase5 an_num=10000";
						  if(cathode/=cathode0(input_index) or anode/="1110") then
								error_testcase(4) := 1;
							end if;
                elsif(an_num = "10001") then
                    assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase5 an_num=10001";
						  if(cathode/=cathode1(input_index) or anode/="1101") then
								error_testcase(4) := 1;
							end if;
                elsif(an_num = "10010") then
                    assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase5 an_num=10010";
						  if(cathode/=cathode2(input_index) or anode/="1011") then
								error_testcase(4) := 1;
							end if;
						  	input_index := input_index + 1;
                elsif(an_num = "10011") then
                    assert (cathode=cathode3(input_index-1) and anode="0111") report "Error in testcase5 an_num=10011";
						  if(cathode/=cathode3(input_index-1) or anode/="0111") then
								error_testcase(4) := 1;
							end if;
					
					--testcase6
					 elsif(an_num = "10100") then
                    assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase6 an_num=10100";
						  if(cathode/=cathode0(input_index) or anode/="1110") then
								error_testcase(5) := 1;
							end if;
                elsif(an_num = "10101") then
                    assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase6 an_num=10101";
						  if(cathode/=cathode1(input_index) or anode/="1101") then
								error_testcase(5) := 1;
							end if;
                elsif(an_num = "10110") then
                    assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase6 an_num=10110";
						  if(cathode/=cathode2(input_index) or anode/="1011") then
								error_testcase(5) := 1;
							end if;
						  	input_index := input_index + 1;
                elsif(an_num = "10111") then
                    assert (cathode=cathode3(input_index-1) and anode="0111") report "Error in testcase6 an_num=10111";
						  if(cathode/=cathode3(input_index-1) or anode/="0111") then
								error_testcase(5) := 1;
							end if;
					
					--testcase7
					 elsif(an_num = "11000") then
                    assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase7 an_num=11000";
						  if(cathode/=cathode0(input_index) or anode/="1110") then
								error_testcase(6) := 1;
							end if;
                elsif(an_num = "11001") then
                    assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase7 an_num=11001";
						  if(cathode/=cathode1(input_index) or anode/="1101") then
								error_testcase(6) := 1;
							end if;
                elsif(an_num = "11010") then
                    assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase7 an_num=11010";
						  if(cathode/=cathode2(input_index) or anode/="1011") then
								error_testcase(6) := 1;
							end if;
						  	input_index := input_index + 1;
                elsif(an_num = "11011") then
                    assert (cathode=cathode3(input_index-1) and anode="0111") report "Error in testcase7 an_num=11011";
						  if(cathode/=cathode3(input_index-1) or anode/="0111") then
								error_testcase(6) := 1;
							end if;
					
					--testcase8
					 elsif(an_num = "11100") then
                    assert (cathode=cathode0(input_index) and anode="1110") report "Error in testcase8 an_num=11100";
						  if(cathode/=cathode0(input_index) or anode/="1110") then
								error_testcase(7) := 1;
							end if;
                elsif(an_num = "11101") then
                    assert (cathode=cathode1(input_index) and anode="1101") report "Error in testcase8 an_num=11101";
						  if(cathode/=cathode1(input_index) or anode/="1101") then
								error_testcase(7) := 1;
							end if;
                elsif(an_num = "11110") then
                    assert (cathode=cathode2(input_index) and anode="1011") report "Error in testcase8 an_num=11110";
						  if(cathode/=cathode2(input_index) or anode/="1011") then
								error_testcase(7) := 1;
							end if;
						  	--input_index := input_index + 1;
                elsif(an_num = "11111") then
                	assert (cathode=cathode3(input_index) and anode="0111") report "Error in testcase8 an_num=11111";
			if(cathode/=cathode3(input_index) or anode/="0111") then
				error_testcase(7) := 1;
			end if;
			input_index := input_index + 1;
					  if(error_printed = 0) then
						report "printing errors";
							for i in 0 to error_testcase'LENGTH-1 loop
								err_cnt := err_cnt + error_testcase(i);									
							end loop;
							report "err_cnt is " & integer'image(err_cnt);
							err_cnt_signal <= err_cnt; 
							-- summary of all the tests
							if (err_cnt=0) then
								assert false
								report "Testbench of Lab 4 completed successfully!"
								severity note;
							else
								assert false
								report "Something wrong, try again"
								severity error;
							end if;
							error_printed := 1;
						end if;
					 end if;
					 an_num <= an_num + 1;
            end if;
 end process;
   
-- *** End Test Bench - User Defined Section ***

end Behavioral;

