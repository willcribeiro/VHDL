
entity soma4bit is
 port( As,Bs: in bit_vector(3 downto 0);
	Ss: out bit_vector(3 downto 0);
	C0s: out bit;
	Cis: in bit);
end soma4bit;

architecture ckt of soma4bit is

component soma1bit is
	 port( A,B,Ci: in bit;
		Co,S: out bit);
end component;

signal Si,So: bit;
signal soma,Cout: bit_vector(3 downto 0);


	begin 

		box0: soma1bit port map(
			A => As(0),
			B => Bs(0),
			Ci => '0',
			S => soma(0),
			Co => Cout(0));
	
		box1: soma1bit port map(
			A => As(1),
			B => Bs(1),
			Ci => Cout(0),
			S => soma(1),
			Co => Cout(1));
		
		box2: soma1bit port map(
			A => As(2),
			B => Bs(2),
			Ci => Cout(1),
			S => soma(2),
			Co => Cout(2));
		
		box3: soma1bit port map(
			A => As(3),
			B => Bs(3),
			Ci => Cout(2),
			S => soma(3),
			Co => Cout(3));

		Ss <= soma;
		C0s <= Cout(3);

		
	end ckt;