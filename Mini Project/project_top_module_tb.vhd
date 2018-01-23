LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY project_top_module_tb IS
END project_top_module_tb;
 
ARCHITECTURE behavior OF project_top_module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT project_top_module
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
    END COMPONENT;

	-- Custom Types
--	type display_output is array (0 to 15) of std_logic_vector(6 downto 0);
--	type anode_output_array is array(0 to 3) of std_logic_vector(3 downto 0);

   	--Inputs
   	signal data_in      : std_logic_vector(15 downto 0);
	signal clk          : std_logic;
	signal state_change : std_logic;
	signal record_lat   : std_logic;
	signal record_long  : std_logic;
	signal push_query   : std_logic;
	signal reset 		 : std_logic;
		
   
	--Outputs
	signal update_state_indicator : std_logic;
	signal query_state_indicator  : std_logic;
	signal reset_state_indicator  : std_logic;
	signal anode                  : std_logic_vector (3 downto 0);
	signal cathode                : std_logic_vector (6 downto 0);
		
   	-- Clock period definitions
   	constant clk_period : time := 10 ns;
	
	-- Signals
	signal err_cnt_signal : integer range 0 to 50 := 0;
	--constant intToCathodeValue : display_output := ("1000000","1111001","0100100","0110000","0011001","0010010","0000010","1111000","0000000","0010000","0001000","0000011","1000110","0100001","0000110","0001110");
	--constant anodeValues : anode_output_array := ("0111","1011","1101","1110");
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	   uut: project_top_module PORT MAP (
		   	data_in => data_in,
			clk => clk,
			state_change => state_change,          
			record_lat => record_lat,
			record_long => record_long,
			push_query => push_query,
			reset => reset,
			update_state_indicator => update_state_indicator,
			query_state_indicator  => query_state_indicator,
			reset_state_indicator => reset_state_indicator,
			anode => anode,
			cathode => cathode
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
  end process;
 

   -- Stimulus process
   stim_proc: process

--		type intArray is array(0 to 3) of integer;
--		variable cathodeGroundTruth : intArray := (0,1,0,1);
		variable err_cnt : INTEGER RANGE 0 to 50 := 0;
		variable res_err_cnt : INTEGER := 0;
		variable final_err_cnt : INTEGER := 0;

   begin		
		------------------------------------------------------------
      		--------------------- pre-case 0 ---------------------------
		------------------------------------------------------------
		-- Set inputs
	
		reset <= '1';
		wait for 1*clk_period;
		reset <= '0';
		record_lat <= '1';
		data_in <= "0010001100000101";
		wait for 2*clk_period;
		record_lat <= '0';
		wait for 2*clk_period;

		record_long <= '1';
		data_in <= "0111000000011000";
		wait for 2*clk_period;
		record_long <= '0';
		push_query <= '1';
		wait for 2*clk_period;
		push_query <= '0';
		
		wait for 5*clk_period;	-- ensures completion of division


		-------------------------------------------------------------
		---------------------  case 0 -------------------------------
		-------------------------------------------------------------
		err_cnt := 0;
		res_err_cnt := 0;
		
		assert (query_state_indicator/='0' or reset_state_indicator/='1') report "Something is wrong";
		
		if(query_state_indicator/='0' or reset_state_indicator/='1') then
			final_err_cnt := final_err_cnt + 1;
			report "Final error count increased to " & integer'image(final_err_cnt);
		end if;	


		
		------------------------------------------------------------------------
		-------------------------------------------------------------------------

		state_change <= '1';
		wait for 2*clk_period;
		state_change <= '0';
		wait for 4*clk_period;

		assert (query_state_indicator/='0' or reset_state_indicator/='0') report "Something is wrong";
			
		if (query_state_indicator /= '0' and reset_state_indicator /='0') then
				final_err_cnt := final_err_cnt + 1;
			report "Final error count increased to " & integer'image(final_err_cnt);
		end if;
		--------------------------------------------------------------------------
		-------------------------------------------------------------------------


		report "Final error count increased to " & integer'image(final_err_cnt);


--		err_cnt := err_cnt + (res_err_cnt-72);
		report "Total error count " & integer'image(final_err_cnt);
		err_cnt_signal <= final_err_cnt;		
		-- summary of all the tests
		if (final_err_cnt=0) then
			 assert false
			 report "Testbench of TopModule completed successfully!"
			 severity note;
		else
			 assert false
			 report "Something wrong, try again"
			 severity error;
		end if;

      -- end of tb 
		wait for clk_period*100;

      wait;
   end process;

END;


