entity div is
	port (
		clock : in std_logic;
		dvdnd : in std_logic_vector(7 downto 0);
		dvsr  : in std_logic_vector(7 downto 0);
		reset : in std_logic;
		done_tick : out std_logic
	);
end div;

architecture div_arc of div is

begin
	process(reset)
	begin
		
	end process ; 

end div_arc;