library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

--entity lab7_divider is
--port(divisor,divident :in std_logic_vector(7 downto 0);
	-- load_inputs,sim_mode : in std_logic;
	 --clk : in std_logic;
	-- output_valid,input_invalid : out std_logic;
	-- anode : out std_logic_vector(3 downto 0);
	-- cathode : out std_logic_vector(6 downto 0)
--);
--end entity lab7_divider
entity divider is
port(divisor :in std_logic_vector(7 downto 0);
     divident : in std_logic_vector(7 downto 0);
	 load_inputs,clk : in std_logic;
	 output_valid,input_invalid : out std_logic;
	 done_tick : out std_logic;
	 output : out std_logic_vector (15 downto 0)
);
end entity divider;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
architecture dd of divider is
type state_type is (change, op, done);
signal state, state_next: state_type;

signal rsign : std_logic;
signal qsign : std_logic;
signal a : unsigned(14 downto 0);
signal b : unsigned(14 downto 0);
signal a_temp : unsigned(14 downto 0);
signal b_temp : unsigned(14 downto 0);
signal x : std_logic_vector(7 downto 0);
signal y : std_logic_vector(7 downto 0);
signal q : std_logic_vector(7 downto 0);
signal r : std_logic_vector(7 downto 0);
signal i : natural range 0 to 7 := 7;
begin
 process(divisor,divident)
begin

	if divisor="00000000" then
		input_invalid <= '1';
	else
	    input_invalid <= '0';
	end if;

	if (divident(7)='1') then
		x <= ("11111111") XOR ((divident(7 downto 0)-"00000001"));
		rsign <= '1';
	else
		x <= '0' & divident(6 downto 0);
		rsign <= '0';
	end if;

	if divisor(7)='1' then
		y <= "11111111" XOR (divisor(7 downto 0)-"00000001");
	else
		y <= '0' & divisor(6 downto 0);
	end if;

	if (divisor(7) XOR divident(7))='1' then
		qsign <='1';
	else
		qsign <= '0';
	end if;

end process;

process(clk)
begin
	
end process;

process(load_inputs)
begin
	b <= unsigned(y) & "0000000";
	a <= "0000000" & unsigned(x);
--	--b(14 downto 7) <= "0000000" & unsigned (y(7 downto 0));
--	--b(6 downto 0) <= "0000000";
--	--a(14 downto 8) <= "0000000";
--	--a (7 downto 0) <= unsigned (x(7 downto 0));	
--	state_reg <= change;
end process;

process(load_inputs, a_temp, b_temp)
begin
	if (load_inputs='1') then
		state <= change;
	end if;
	case state is
		when change=>
			a_temp <= a;
			b_temp <= b;
			state  <= op;
		when op =>
			if (load_inputs='0') then
			if(b_temp <= a_temp)then
				a_temp <= a_temp - b_temp; 	
				q(i) <= '1';
			else
				q(i) <= '0';
			end if;
			
			i <= i-1;
				
			end if;
			b_temp <= shift_right(b_temp, 1);
			
			if (i=0) then
				state <= done;
			end if;
		when done =>
			done_tick <= '1';
	end case;

end process;

end architecture dd;