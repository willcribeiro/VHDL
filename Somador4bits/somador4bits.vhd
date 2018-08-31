
entity soma4bit is
 port( As: in bit_vector(4 downto 0);
	Ss: out bit_vector(4 downto 0);
	C0s: out bit;
	Cis: in bit);
end soma4bit;

architecture ckt of soma4bit is

component soma1bit is
	 port( A,B,Ci: in bit;
		Co,S: out bit);
end component;

signal Si,So: bit;
signal soma,Cout,As2: bit_vector(4 downto 0);


	begin 
		As2(4) <= As(4);
		As2(3 downto 0) <= not As(3 downto 0); 
		box0: soma1bit port map(
			A => As2(0),
			B => '1',
			Ci => '0',
			S => soma(0),
			Co => Cout(0));
	
		box1: soma1bit port map(
			A => As2(1),
			B => '0',
			Ci => Cout(0),
			S => soma(1),
			Co => Cout(1));
		
		box2: soma1bit port map(
			A => As2(2),
			B => '0',
			Ci => Cout(1),
			S => soma(2),
			Co => Cout(2));
		
		box3: soma1bit port map(
			A => As2(3),
			B => '0',
			Ci => Cout(2),
			S => soma(3),
			Co => Cout(3));


		Ss(3 downto 0)<= soma(3 downto 0);
		Ss(4) <= As2(4);
		C0s <= Cout(3);

		
	end ckt;