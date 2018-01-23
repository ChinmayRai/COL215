library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity gcd_calculator is
	port (
			a_i : in std_logic_vector(7 downto 0);
			b_i : in std_logic_vector(7 downto 0);
			push_i: in std_logic;
			clk : in std_logic;
			d_o : out std_logic_vector(15 downto 0);
			load : out std_logic;
			sub : out std_logic;
			op_valid : out std_logic
		);    
end entity gcd_calculator;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
architecture gcd_calculator_arc of gcd_calculator is

signal clock   : std_logic;
signal first_num : std_logic_vector(7 downto 0);
signal second_num : std_logic_vector(7 downto 0);
signal a1 : std_logic_vector(3 downto 0);
signal a0 : std_logic_vector(3 downto 0);
signal b1 : std_logic_vector(3 downto 0);
signal b0: std_logic_vector(3 downto 0);
signal temp_load, temp_load_last, temp_sub, temp_sub_last, temp_op_valid : std_logic;
signal flag : std_logic;
--signal do_first : std_logic(15 downto 0);


begin
	process(a_i, b_i)
	begin
	if ((a_i(7 downto 4) > "1001") or (a_i(3 downto 0) > "1001") or (a_i(7 downto 0)="00000000") or (b_i(7 downto 4) > "1001") or (b_i(3 downto 0) > "1001") or (b_i(7 downto 0)="00000000")) then
		temp_op_valid <= '0';
	else 
		temp_op_valid <= '1';
	end if;
	d_o <= a_i&b_i;
	end process;
	--load <= '1' when temp_load = '1' else '0';
	
	process( temp_op_valid, push_i)
	begin
		if (temp_op_valid='0' and push_i='1') then
			temp_load<='0';
			temp_sub <= '0';
		elsif (temp_op_valid='1' and push_i='1') then
			temp_load<='1';
			temp_sub <= '0';
	end if;
	end process ; 
	
	sub <= temp_sub or temp_sub_last;
	load <= temp_load_last or (temp_load and temp_load_last);

	--process(temp_op_valid, temp_load, temp_sub, push_i, temp_load_last, temp_sub_last)
	--begin
	--	if(temp_sub='0' or temp_sub='1') then
	--		sub <= temp_sub;
	--		temp_sub_last<=temp_sub;
	--	elsif (temp_load='1' or temp_load='0') then
	--		load <= temp_load;
	--		temp_load_last<=temp_load;
	--	elsif (temp_op_valid='1' or temp_op_valid='0') then
	--		op_valid <= temp_op_valid;
	--	end if;
	--	if(temp_sub_last='1' or temp_sub_last='0') then
	--		sub<=temp_sub_last;
	--		temp_sub<=temp_sub_last;
	--	elsif (temp_load_last='1' or temp_load_last='0') then
	--		load <= temp_load_last;
	--		temp_load<=temp_load_last;
	--	end if;
	--end process ; 

	process(clk)
	variable counter : integer range 0 to 200000000;
	begin
		if ((clk'event) and (clk='1')) then
			if(counter >= 200) then
				counter := 0;
				if(clock = '0') then
					clock <= '1';
				else
					clock <= '0';
				end if;
			end if;
			counter := counter + 1;
		end if;
	end process;


------------- THIS LAST PROCESS CAUSES SOME ERROR REMOVING THIS EVERYTHING WORKS FINE ----------
	process(clock)
	begin
		if (clock'event and clock='1') then
			if (temp_load='1') then
				first_num <= a_i;
				second_num <= b_i;
				temp_sub_last <= '1';
				temp_load_last<= '0';
			end if;
	
			if (temp_sub_last = '1') then
				a0 <= first_num(3 downto 0);
				a1 <= first_num(7 downto 4);
				b0 <= second_num(3 downto 0);
				b1 <= second_num(7 downto 4);
				if ((a1=b1)and(a0=b0))  then
					temp_sub_last<= '0';
				else

					if ((a1>b1) or ((a1=b1)and(a0>b0))) then
						if (a0>=b0) then
							first_num <= (a1-b1)&(a0-b0);
						else
							first_num <= (a1-b1-1)&(10+a0-b0);
						end if;
					else
						if (b0>=a0) then
							second_num <= (b1-a1)&(b0-a0);
						else
							second_num <= (b1-a1-1)&(10+b0-a0);
						end if;
					end if;
				
				d_o(15 downto 8) <= first_num(7 downto 0);
				d_o(7 downto 0) <= second_num(7 downto 0);
				end if;
			end if;
		end if;


	end process ;


end gcd_calculator_arc;