Entity regi4 is
	port (clk4,C4,enable: in BIT;
		A: in bit_vector(3 downto 0);
			q4: Out BIT);
end regi4;

architecture ckt of regi4 is 

component ffd is
	port (clk,D,P,C: in BIT;
			q: Out BIT);
end component;

signal sQ4: bit_vector(3 downto 0);
signal Pre0,Pre1,Pre2,Pre3: bit;
begin

	Pre0 <=  A(0) nand enable;
	Pre1 <=  A(1) nand enable;
	Pre2 <=  A(2) nand enable;
	Pre3 <=  A(3) nand enable;

	reg0: ffd port map(
	clk => clk4,
	P => Pre0,
	C => C4,
	D => '0',
	q => sQ4(3));

	reg1: ffd port map(
	clk => clk4,
	P => Pre1,
	C => C4,
	D => sQ4(3),
	q => sQ4(2));

	reg2: ffd port map(
	clk => clk4,
	P => Pre2,
	C => C4,
	D => sQ4(2),
	q => sQ4(1));

	reg3: ffd port map(
	clk => clk4,
	P => Pre3,
	C => C4,
	D => sQ4(1),
	q => sQ4(0));

q4<=sQ4(0);
	
end ckt;
