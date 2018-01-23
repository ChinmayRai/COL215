entity mux is
	port (
		x : in bit_vector(2 downto 0);
		e : in bit;
		s : in bit_vector(1 downto 0);
		y : out bit
	);
end mux;

architecture mux_arc of mux is
begin
	process(s,e)
	begin
	if e then
		case(s) is
			when "00" => y <= x(0);
			when "01" => y <= x(1);
			when others => y <= x(2);
		end case;

	else y <= 0;
	end if;
	end process;
end architecture mux_arc;