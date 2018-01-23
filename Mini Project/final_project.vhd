library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity project_top_module is
	port (
		data_in                : in std_logic_vector(15 downto 0);
		clk                    : in std_logic;
		state_change           : in std_logic;
		record_lat             : in std_logic;
		record_long            : in std_logic;
		push_query             : in std_logic;
		reset 		           : in std_logic;
		update_state_indicator : out std_logic;
		query_state_indicator  : out std_logic;
		reset_state_indicator  : out std_logic;
		anode                  : out std_logic_vector (3 downto 0);
		cathode                : out std_logic_vector (6 downto 0)
	);
end project_top_module;

architecture project_top_arc of project_top_module is
	component display
		port ( 
			in_data         : in  std_logic_vector (15 downto 0); 
	        show_lat		: in  std_logic;
	        show_long		: in  std_logic;
	        show_digit		: in  std_logic;
	        clk    			: in  std_logic; 
	        anode      		: out std_logic_vector (3 downto 0); 
	        cathode    		: out std_logic_vector (6 downto 0));
    end component;

    component project is
    	port (
			data_in                : in std_logic_vector(15 downto 0);
			clk                    : in std_logic;
			state_change           : in std_logic;
			record_lat             : in std_logic;
			record_long            : in std_logic;
			push_query             : in std_logic;
			reset 		           : in std_logic;
			update_state_indicator : out std_logic;
			query_state_indicator  : out std_logic;
			reset_state_indicator  : out std_logic;
			show_lat 			   : out std_logic;
			show_long 			   : out std_logic;
			show_digit             : out std_logic;
			data_out	 		   : out std_logic_vector(15 downto 0)

		);
    end component project;


    signal data_out : std_logic_vector(15 downto 0);
    signal anode1 : std_logic;
    signal cathode1 : std_logic;
    signal show_lat1, show_long1, show_digit1 : std_logic;
begin

	display_map : display
    	port map 
      	(
			in_data    => data_out,
			clk        => clk,
			show_lat   => show_lat1,
			show_long  => show_long1,
			show_digit => show_digit1,
			anode      => anode,
			cathode    => cathode
	 	);

    proj: project
	    port map (
	    	data_in                => data_in,
			clk                    => clk,
			state_change           => state_change,
			record_lat             => record_lat,
			record_long            => record_long,
			push_query             => push_query,
			reset 		           => reset,
			update_state_indicator => update_state_indicator,
			query_state_indicator  => query_state_indicator,
			reset_state_indicator  => reset_state_indicator,
			data_out	 		   => data_out,
			show_lat			   => show_lat1,
			show_long              => show_long1,
			show_digit             => show_digit1
	    );

end project_top_arc;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions


entity project is
	port (
		data_in                : in std_logic_vector(15 downto 0);
		clk                    : in std_logic;
		state_change           : in std_logic;
		record_lat             : in std_logic;
		record_long            : in std_logic;
		push_query             : in std_logic;
		reset 		           : in std_logic;
		update_state_indicator : out std_logic;
		query_state_indicator  : out std_logic;
		reset_state_indicator  : out std_logic;
		show_lat 			   : out std_logic;
		show_long 			   : out std_logic;
		show_digit             : out std_logic;
		data_out	 		   : out std_logic_vector(15 downto 0)
	);
end project;

architecture project_arc of project is
	--function sine (val: integer range 0 to 10000) return integer is
	--	type ARRAY_TYPE2 is array (0 to 91) of integer range 0 to 10000;
	--	constant sine_table : ARRAY_TYPE2 :=(0,174,349,523,697,871,1045,1218,1391,1564,1736,1908,2079,2249,2419,2588,2756,2923,3090,3255,3420,3583,3746,3907,4067,4226,4383,4539,4694,4848,5000,5150,5299,5446,5591,5735,5877,6018,6156,6293,6427,6560,6691,6820,6946,7071,7193,7313,7431,7547,7660,7771,7880,7986,8090,8191,8290,8386,8480,8571,8660,8746,8829,8910,8987,9063,9135,9205,9271,9335,9396,9455,9510,9563,9612,9659,9703,9743,9781,9816,9848,9876,9902,9925,9945,9961,9975,9986,9993,9998,10000,9998);
		--variable right : integer range 0 to 100;
		--variable left : integer range 0 to 100;
		--variable final_val : integer range 0 to 10000;
	--begin
	--	right 			:= (val) mod 100;
	--	left  			:= (val-right)/100;
	--	final_val 		:= sine_table(left) + (right*(sine_table(left+1)-sine_table(left)))/100;
	----	return final_val;
	--end sine;
	
	type ARRAY_TYPE is array (0 to 50) of integer range 0 to 10000;
	type ARRAY_TYPE2 is array (0 to 91) of integer range 0 to 10000;
	type state_type is (update, query, do_nothing);
	signal state                  : state_type;	
	signal a                      : integer range 0 to 100;
	signal array_dist			  : ARRAY_TYPE;
	signal latitude               : ARRAY_TYPE;
	signal longitude              : ARRAY_TYPE;
	signal index                  : integer range 1 to 55;
	signal user_lat, user_long, lat, long    : integer range 0 to 10000;
	signal d_lat_sig, d_long_sig  : integer range 0 to 10000;
	signal counter1sec 			  : integer range 0 to 100000000;
	signal query_signal, done_inst: std_logic;
	signal min_index, m_index, min_value     : integer range 0 to 50;
	signal record_long_prev, inst : std_logic;
	signal state_change_prev,done_query,done_index : std_logic;
	signal get_index, start1sec, clear_counter : std_logic;
	signal sig1, sig2, q_index, data : integer range 0 to 50;
	constant sine_table : ARRAY_TYPE2 :=(0,174,349,523,697,871,1045,1218,1391,1564,1736,1908,2079,2249,2419,2588,2756,2923,3090,3255,3420,3583,3746,3907,4067,4226,4383,4539,4694,4848,5000,5150,5299,5446,5591,5735,5877,6018,6156,6293,6427,6560,6691,6820,6946,7071,7193,7313,7431,7547,7660,7771,7880,7986,8090,8191,8290,8386,8480,8571,8660,8746,8829,8910,8987,9063,9135,9205,9271,9335,9396,9455,9510,9563,9612,9659,9703,9743,9781,9816,9848,9876,9902,9925,9945,9961,9975,9986,9993,9998,10000,9998);
	signal array_dist_sig : integer range 0 to 100000000;
	signal enable : std_logic;
begin
	process(clk, reset, state_change)
	begin
		if (reset = '1') then
				latitude(0)   <= 2383;longitude(0)  <= 9126;
				latitude(1)   <= 2718;longitude(1)  <= 7801;
				latitude(2)   <= 2303;longitude(2)  <= 7258;
				latitude(3)   <= 3163;longitude(3)  <= 7486;
				latitude(4)   <= 1296;longitude(4)  <= 7756;
				latitude(5)   <= 3075;longitude(5)  <= 7678;
				latitude(6)   <= 1308;longitude(6)  <= 8026;
				latitude(7)   <= 2748;longitude(7)  <= 9500;
				latitude(8)   <= 2733;longitude(8)  <= 8861;
				latitude(9)   <= 2618;longitude(9)  <= 9173;
				latitude(10)  <= 1736;longitude(10) <= 7848;
				latitude(11)  <= 2693;longitude(11) <= 7581;
				latitude(12)  <= 2305;longitude(12) <= 7108;
				latitude(13)  <= 2646;longitude(13) <= 8033;
				latitude(14)  <=  996;longitude(14) <= 7628;
				latitude(15)  <= 2256;longitude(15) <= 8836;
				latitude(16)  <= 2531;longitude(16) <= 7963;
				latitude(17)  <= 2685;longitude(17) <= 8095;
				latitude(18)  <= 3091;longitude(18) <= 7585;
				latitude(19)  <= 1898;longitude(19) <= 7283;
				latitude(20)  <= 2113;longitude(20) <= 7908;
				latitude(21)  <= 2861;longitude(21) <= 7721;
				latitude(22)  <= 2561;longitude(22) <= 8515;
				latitude(23)  <= 1166;longitude(23) <= 9276;
				latitude(24)  <= 1851;longitude(24) <= 7385;
				latitude(25)  <= 2556;longitude(25) <= 9188;
				latitude(26)  <= 3110;longitude(26) <= 7716;
				latitude(27)  <= 2671;longitude(27) <= 8843;
				latitude(28)  <= 3408;longitude(28) <= 7478;
				latitude(29)  <= 2116;longitude(29) <= 7283;
				latitude(30)  <= 2663;longitude(30) <= 9280;
				latitude(31)  <=  848;longitude(31) <= 7695;
				latitude(32)  <= 1768;longitude(32) <= 8321;
				reset_lat_lon : for i in 33 to 50 loop
					latitude(i)  <= 0;
					longitude(i) <= 0;
				end loop;
				index 		  <= 33;
				state         <= query;
				reset_state_indicator <= '1';
				query_state_indicator <= '1';
				update_state_indicator <= '0';
				show_lat <= '1';
				show_long <= '0';
				show_digit <= '0';
				start1sec <= '0';
				clear_counter<= '1';
		elsif (done_inst = '1') then
			inst <= '0';
		elsif (clk = '1' and clk'event) then
			state_change_prev <= state_change;
			if (start1sec = '1') then
				if (clear_counter/='1') then
					counter1sec   <= counter1sec + 1;
					if (counter1sec >= 100000000) then
						start1sec <='0';
						show_digit <= '0';
						show_long  <= '1'; 
						show_lat   <= '0';
					end if;
				elsif (clear_counter = '1') then
					counter1sec <= 0;
					clear_counter <= '0';
				else
					start1sec <= '0';
				end if;
				data_out <= data_in;
			elsif (state_change = '1' and state_change_prev/=state_change ) then
			  		reset_state_indicator <= '0';
			  		if (state = update) then
			  			state <= query;
			  			query_state_indicator <= '1';
						update_state_indicator <= '0';
			  		else
			  			state <= update;
			  			query_state_indicator <= '0';
						update_state_indicator <= '1';
			  		end if;
			  		show_lat <= '1';
					show_long <= '0';
					show_digit <= '0';
			elsif (state = update) then
				record_long_prev <= record_long;
				if (record_lat = '1') then
					latitude(index) <= to_integer(unsigned(data_in(15 downto 12)))*1000 + to_integer(unsigned(data_in(11 downto 8)))*100 + to_integer(unsigned(data_in(7 downto 4)))*10 + to_integer(unsigned(data_in(3 downto 0)));
					show_lat <= '0';
					show_long <= '0';
					show_digit <= '1';
					data_out <= data_in;
					start1sec <= '1';
					clear_counter <= '1';
				end if;
				if (record_long = '1' and record_long/=record_long_prev) then
					longitude(index) <= to_integer(unsigned(data_in(15 downto 12)))*1000 + to_integer(unsigned(data_in(11 downto 8)))*100 + to_integer(unsigned(data_in(7 downto 4)))*10 + to_integer(unsigned(data_in(3 downto 0)));
					index <= index + 1;
					state <= do_nothing;
					update_state_indicator <= '0';
					show_lat <= '0';
					show_long <= '0';
					show_digit <= '1';
					data_out <= data_in;
				end if;
			elsif (state = query) then
				if (record_lat = '1') then
					user_lat 	 <= to_integer(unsigned(data_in(15 downto 12)))*1000 + to_integer(unsigned(data_in(11 downto 8)))*100 + to_integer(unsigned(data_in(7 downto 4)))*10 + to_integer(unsigned(data_in(3 downto 0)));
					show_lat <= '0';
					show_long <= '0';
					show_digit <= '1';
					data_out <= data_in;
					start1sec <= '1';
					clear_counter <= '1';
				elsif (record_long = '1') then
					user_long 	 <= to_integer(unsigned(data_in(15 downto 12)))*1000 + to_integer(unsigned(data_in(11 downto 8)))*100 + to_integer(unsigned(data_in(7 downto 4)))*10 + to_integer(unsigned(data_in(3 downto 0)));
					state <= do_nothing;
					query_signal <= '1';
					inst <= '1';
					query_state_indicator <= '1';
					show_lat <= '0';
					show_long <= '0';
					show_digit <= '1';
					data_out <= data_in;
				end if;
			elsif (state = do_nothing) then
				if (push_query = '1') then
					get_index <= '1';
				elsif (done_query = '1') then
					query_signal <= '0';
				elsif (done_index = '1') then
					get_index <= '0';
					query_state_indicator <= '0';
					show_long <= '0';
					show_lat <= '0';
					show_digit <= '1';
					data_out(3 downto 0) <= std_logic_vector(to_unsigned(sig1, 4));
					data_out(7 downto 4) <= std_logic_vector(to_unsigned(sig2, 4));
					data_out(15 downto 8) <= "00000000";
				elsif (done_inst = '1') then
					inst <= '0';
				end if;
			end if;
		end if;
	end process;
		
	process(clk, push_query)
	begin
		if (clk = '1' and clk'event) then
			if (get_index = '1' and reset /= '1') then
				for i in 0 to 50 loop
					if (i<index) then
						if (array_dist(i)<array_dist(m_index)) then
							m_index <= i;
							data <= i;
						    sig1 <= i mod 10;
							sig2 <= (i-(i mod 10))/10;
						end if;
					end if;
				end loop;
				done_index <= '1';
			else
				m_index <= 0;	
				done_index <= '0';
			end if;
		end if;
	end process;

	query_resolver : process( clk, reset )
	--variable dlat, dlong : integer range 0 to 10000;
	--variable val, right, left, final_val, sine_d_lat_halved, sine_lat_q, sine_user_lat, sine_d_long_halved : integer range 0 to 10000;
	begin
		done_inst <= '0';
		if (reset = '1') then
			q_index <= 0;
			done_query <= '0';
		elsif (clk = '1' and clk'event) then
			if (query_signal = '1' and done_query /= '1' and inst/='1') then
				q_index <= q_index + 1;
				if (q_index < index) then
					array_dist(q_index) <= abs(user_lat-latitude(q_index)) + abs(user_long-longitude(q_index));
				else
					q_index <= 0;
					done_query <= '1';
					enable <= '0';
				end if;
			elsif (inst='1') then
				q_index <= 0;
				done_query <= '0';
				lat <= latitude(0);
				long <= longitude(0);
				done_inst <= '1';
				enable <= '1';
			else
				done_query <= '0';
			end if;
		end if;
	end process ; -- query_resolver

end project_arc;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity display is
port(
	in_data : in std_logic_vector(15 downto 0);
	show_digit,show_long,show_lat,clk : in std_logic;
	anode : out std_logic_vector(3 downto 0);
	cathode : out std_logic_vector(6 downto 0)	
);
end display;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


architecture arch of display is

component digit_display
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0)
         );
end component;

component seven_segment_display
port(
	clk: in std_logic;
	lat_long : in std_logic;
	anode : out std_logic_vector(3 downto 0);
	cathode : out std_logic_vector(6 downto 0)
);
end component;

signal zero : std_logic;
signal one :  std_logic;
signal anode1,anode2,anode3 : std_logic_vector (3 downto 0); 
signal cathode1,cathode2,cathode3 : std_logic_vector (6 downto 0);

begin
zero <= '0';
one <='1';

lat : seven_segment_display
port map(clk,zero,anode1(3 downto 0),cathode1(6 downto 0));

long : seven_segment_display
port map(clk,one,anode2(3 downto 0),cathode2(6 downto 0));

digit : digit_display
port map(in_data,clk,anode3(3 downto 0),cathode3(6 downto 0));

process(clk)
begin
if clk='1' and clk'event then
    if show_lat='1' then
    anode <= anode1; cathode<=cathode1;

    elsif show_long='1' then
    anode <= anode2; cathode<=cathode2;

    else
    anode <= anode3; cathode<=cathode3;
    end if;
end if;
end process;
end architecture;

-------------------------------------------------------------ssd-lat-long------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity seven_segment_display is
port(
	clk: in std_logic;
	lat_long : in std_logic;
	anode : out std_logic_vector(3 downto 0);
	cathode : out std_logic_vector(6 downto 0)
);
end entity seven_segment_display;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture ssd of seven_segment_display is

signal clock : std_logic;
signal flag  : integer range 1 to 4;
signal cathode1, cathode2, cathode3, cathode4, cath : std_logic_vector (6 downto 0);
signal counter : integer range 0 to 1000000;

begin

with lat_long select 
cathode1<= "0111000" when '0',
	   "0111000" when '1',
	   "0000000" when others;
with lat_long select
cathode2 <= "1110111" when '0',
	    "1011100" when '1',
	    "0000000" when others;
with lat_long select 
cathode3<= "1111000" when '0',
           "1010100" when '1',
           "0000000" when others;
with lat_long select
cathode4 <= "0000000" when '0',
	    "1101111" when '1',
	    "0000000" when others;

process(clk)
    --variable counter : integer range 0 to 10000;
    begin
        if ((clk'event) and (clk='1')) then
            if(counter >= 100000) then
                counter <= 0;
                if(clock = '0') then
                    clock <= '1';
                else
                    clock <= '0';
                end if;
            else
            	counter <= counter + 1;
            end if;
            
        end if;
    end process;		    

process(clock)
begin

if(clock='1' and clock'event) then
    if flag=4 then flag <=1; 
    else flag <= flag+1 ;
    end if;

    case flag is
    when 1 => 
    		anode <= "0111";
            cath <= cathode1;
    when 2 => 
    		anode <= "1011";
            cath <= cathode2;
    when 3 => 
    		anode <= "1101";
            cath <= cathode3;
    when 4 => 
    		anode <= "1110";
            cath <= cathode4;
    when others => 
    		anode <= "1111";
    		flag <= 1;
    end case; 
end if;                  
end process;

cathode <= not(cath);         
         
end architecture ;

--------------------------------------------------------------------------------
---------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity digit_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0)
         );
end entity digit_display;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture ssd of digit_display is

signal clock : std_logic;
signal flag  : integer range 1 to 4;
signal cathode1, cathode2, cathode3, cathode4, cath : std_logic_vector (6 downto 0);
signal counter : integer range 0 to 1000000;

begin

with b(15 downto 12) select 
cathode1<= "0111111" when "0000",
		   "0000110" when "0001",
		   "1011011" when "0010",
		   "1001111" when "0011",
		   "1100110" when "0100",
		   "1101101" when "0101",
		   "1111101" when "0110",
		   "0000111" when "0111",
		   "1111111" when "1000",
		   "1101111" when "1001",
	   	   "1000000" when others;
with b(11 downto 8) select
cathode2 <= "0111111" when "0000",
		   "0000110" when "0001",
		   "1011011" when "0010",
		   "1001111" when "0011",
		   "1100110" when "0100",
		   "1101101" when "0101",
		   "1111101" when "0110",
		   "0000111" when "0111",
		   "1111111" when "1000",
		   "1101111" when "1001",
	   	   "1000000" when others;
with b(7 downto 4) select 
cathode3<= "0111111" when "0000",
		   "0000110" when "0001",
		   "1011011" when "0010",
		   "1001111" when "0011",
		   "1100110" when "0100",
		   "1101101" when "0101",
		   "1111101" when "0110",
		   "0000111" when "0111",
		   "1111111" when "1000",
		   "1101111" when "1001",
	   	   "1000000" when others;
with b(3 downto 0) select
cathode4 <= "0111111" when "0000",
		   "0000110" when "0001",
		   "1011011" when "0010",
		   "1001111" when "0011",
		   "1100110" when "0100",
		   "1101101" when "0101",
		   "1111101" when "0110",
		   "0000111" when "0111",
		   "1111111" when "1000",
		   "1101111" when "1001",
	   	   "1000000" when others;
process(clk)
    --variable counter : integer range 0 to 10000;
    begin
        if ((clk'event) and (clk='1')) then
            if(counter >= 100000) then
                counter <= 0;
                if(clock = '0') then
                    clock <= '1';
                else
                    clock <= '0';
                end if;
            else
            	counter <= counter + 1;
            end if;
            
        end if;
    end process;		    

process(clock)
begin

if(clock='1' and clock'event) then
    if flag=4 then flag <=1; 
    else flag <= flag+1 ;
    end if;

    case flag is
    when 1 => 
    		anode <= "0111";
            cath <= cathode1;
    when 2 => 
    		anode <= "1011";
            cath <= cathode2;
    when 3 => 
    		anode <= "1101";
            cath <= cathode3;
    when 4 => 
    		anode <= "1110";
            cath <= cathode4;
    when others => 
    		anode <= "1111";
    		flag <= 1;
    end case; 
end if;                  
end process;

cathode <= not(cath);         
         
end architecture ;


