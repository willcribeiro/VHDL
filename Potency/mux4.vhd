entity multiplexador4 is
 port( Am, Bm: in bit_vector(3 downto 0);
	Sm: in bit;
	Qm: out bit_vector(3 downto 0));

end multiplexador4;

architecture ckt of multiplexador4 is

component multiplexador is
 port( I1,I0, Ai: in bit;
	Q: out bit);

end component;

signal fio: bit_vector(3 downto 0);

begin 

	box0: multiplexador port map(
		I1 => Am(0),
		I0 => Bm(0),
		Ai => Sm,
		Q => fio(0));

	box1: multiplexador port map(
		I1 => Am(1),
		I0 => Bm(1),
		Ai => Sm,
		Q => fio(1));

	box2: multiplexador port map(
		I1 => Am(2),
		I0 => Bm(2),
		Ai => Sm,
		Q => fio(2));

	box3: multiplexador port map(
		I1 => Am(3),
		I0 => Bm(3),
		Ai => Sm,
		Q => fio(3));

	Qm <= fio;
	
end ckt;
