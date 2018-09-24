entity main is 
    port(
        Am : IN bit_vector(3 downto 0);
        k : IN bit_vector(1 downto 0);
        clk : IN BIT;
        Zm : OUT bit_vector(3 downto 0);
        Lm : IN BIT

    );
end main;


architecture ckt of main is 

component cirx is
	port (clkx,Cx,Dx: in BIT;
			Z: Out BIT_VECTOR(3 DOWNTO 0));
end component;

component regi4 is
	port (clk4,C4,enable: in BIT;
		A: in bit_vector(3 downto 0);
			q4: Out BIT);
end component;

    signal q : BIT;
    signal Zmp : bit_vector(3 downto 0);

    begin

        cy : regi4 port map(
            clk4  => clk,
            C4 => k(0),
            A(3) => Am(0),
	    A(2) => Am(1),
	    A(1) => Am(2),
	    A(0) => Am(1),
            q4 => q,
            enable => Lm

        );

        cx : cirx port map(
            clkx => clk,
            Cx => k(1),
            Dx => q,
            Z => Zmp
        );

        Zm <= Zmp;

end ckt;
