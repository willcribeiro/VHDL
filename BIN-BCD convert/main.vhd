
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
signal SD0,SD1,SD2 : bit_vector(6 downto 0);

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

		
		
		SD0(0) <= ((not HEX0(0)) and (not HEX0(2))) or HEX0(1) or HEX0(3) or (HEX0(2) and HEX0(0));
		SD0(1) <= (not HEX0(2)) or HEX0(3) or ((not HEX0(1)) and (not HEX0(0))) or (HEX0(1) and HEX0(0));
		SD0(2) <= (not HEX0(1)) or HEX0(0) or ((not HEX0(3)) and HEX0(2));
		SD0(3) <= ((not HEX0(2)) and (not HEX0(0))) or ((not HEX0(2)) and HEX0(1)) or (HEX0(1) and (not HEX0(0))) or (HEX0(2) and (not HEX0(1)) and HEX0(0));
		SD0(4) <= (HEX0(1) and (not HEX0(0))) or ((not HEX0(2)) and (not HEX0(0)));
		SD0(5) <= HEX0(3) or ((not HEX0(1)) and (not HEX0(0))) or (HEX0(2) and (not HEX0(1))) or (HEX0(2) and (not HEX0(0)));
		SD0(6) <= (HEX0(2) and (not HEX0(1))) or (HEX0(1) and (not HEX0(0))) or HEX0(3) or ((not HEX0(2)) and HEX0(1));

		SD1(0) <= ((not HEX1(0)) and (not HEX1(2))) or HEX1(1) or HEX1(3) or (HEX1(2) and HEX1(0));
		SD1(1) <= (not HEX1(2)) or HEX1(3) or ((not HEX1(1)) and (not HEX1(0))) or (HEX1(1) and HEX1(0));
		SD1(2) <= (not HEX1(1)) or HEX1(0) or ((not HEX1(3)) and HEX1(2));
		SD1(3) <= ((not HEX1(2)) and (not HEX1(0))) or ((not HEX1(2)) and HEX1(1)) or (HEX1(1) and (not HEX1(0))) or (HEX1(2) and (not HEX1(1)) and HEX1(0));
		SD1(4) <= (HEX1(1) and (not HEX1(0))) or ((not HEX1(2)) and (not HEX1(0)));
		SD1(5) <= HEX1(3) or ((not HEX1(1)) and (not HEX1(0))) or (HEX1(2) and (not HEX1(1))) or (HEX1(2) and (not HEX1(0)));
		SD1(6) <= (HEX1(2) and (not HEX1(1))) or (HEX1(1) and (not HEX1(0))) or HEX1(3) or ((not HEX1(2)) and HEX1(1));

		SD2(0) <= ((not HEX2(0)) and (not HEX2(2))) or HEX2(1) or HEX2(3) or (HEX2(2) and HEX2(0));
		SD2(1) <= (not HEX2(2)) or HEX2(3) or ((not HEX2(1)) and (not HEX2(0))) or (HEX2(1) and HEX2(0));
		SD2(2) <= (not HEX2(1)) or HEX2(0) or ((not HEX2(3)) and HEX2(2));
		SD2(3) <= ((not HEX2(2)) and (not HEX2(0))) or ((not HEX2(2)) and HEX2(1)) or (HEX2(1) and (not HEX2(0))) or (HEX2(2) and (not HEX2(1)) and HEX2(0));
		SD2(4) <= (HEX2(1) and (not HEX2(0))) or ((not HEX2(2)) and (not HEX2(0)));
		SD2(5) <= HEX2(3) or ((not HEX2(1)) and (not HEX2(0))) or (HEX2(2) and (not HEX2(1))) or (HEX2(2) and (not HEX2(0)));
		SD2(6) <= (HEX2(2) and (not HEX2(1))) or (HEX2(1) and (not HEX2(0))) or HEX2(3) or ((not HEX2(2)) and HEX2(1));



		

end ckt;