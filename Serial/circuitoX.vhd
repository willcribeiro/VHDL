Entity cirx is
	port (clkx,Cx,Dx: in BIT;
			Z: Out BIT_VECTOR(3 DOWNTO 0));
end cirx;

architecture ckt of cirx is 

component ffd is
	port (clk,D,P,C: in BIT;
			q: Out BIT);
end component;

signal sZ: bit_vector(3 downto 0);
begin

	
	x0: ffd port map(
	clk => clkx,
	P => '1',
	C => Cx,
	D => Dx,
	q => sZ(3));

	x1: ffd port map(
	clk => clkx,
	P => '1',
	C => Cx,
	D => sZ(3),
	q => sZ(2));

	x2: ffd port map(
	clk => clkx,
	P => '1',
	C => Cx,
	D => sZ(2),
	q => sZ(1));

	x3: ffd port map(
	clk => clkx,
	P => '1',
	C => Cx,
	D => sZ(1),
	q => sZ(0));

	
Z<=sZ;

end ckt;
