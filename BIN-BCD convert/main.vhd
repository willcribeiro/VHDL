
entity main is 
	port (	SW: IN bit_vector(7 downto 0);
		bcd: OUT bit_vector(11 downto 0)
		);

end main;

architecture ckt of main is 

 
component basiclogic is
        port(
            A: IN bit_vector(3 downto 0);
            S: OUT  bit_vector(3 downto 0)
        );
    
end component;

signal BX0,BX1,BX2,BX3,BX4,BX5,BX6 : bit_vector(3 downto 0);
signal HEX0,HEX1,HEX2 : bit_vector(3 downto 0);

	begin
		
		box0: basiclogic port map(
			A(3) => '0',
			A(2 downto 0) => SW( 7 downto 5),
			S => BX0);

		box1: basiclogic port map(
			A(3 downto 1) => BX0(2 downto 0),
			A(0) => SW(4),
			S => BX1);

		box2: basiclogic port map(
			A(3 downto 1) => BX1(2 downto 0),
			A(0) => SW(3),
			S => BX2);

		box3: basiclogic port map(
			A(3) => '0',
			A(2) => BX0(3),
			A(1) => BX1(3),
			A(0) => BX2(3),
			S => BX3);
		
		box4: basiclogic port map(
			A(3 downto 1) => BX2(2 downto 0),
			A(0) => SW(2),
			S => BX4);

		box5: basiclogic port map(
			A(3 downto 1) => BX3(2 downto 0),
			A(0) => BX4(3),
			S => BX5);

		box6: basiclogic port map(
			A(3 downto 1) => BX4(2 downto 0),
			A(0) => SW(1),
			S => BX6);

		
		bcd(11) <= '0';
		bcd(10) <= '0';
		bcd(9) <= BX3(3);
		bcd(8 downto 5) <= BX5(3 downto 0);
		bcd(4 downto 1) <= BX6(3 downto 0);
		bcd(0) <= SW(0);


		HEX2(3) <= '0';
		HEX2(2) <= '0';
		HEX2(1) <= BX3(3);
		HEX2(0) <= BX5(3);
		HEX1(3 downto 1) <= BX5(2 downto 0);
		HEX1(0) <= BX6(3);
		HEX0(3 downto 1) <= BX6(2 downto 0);
		HEX0(0) <= SW(0);

		

end ckt;