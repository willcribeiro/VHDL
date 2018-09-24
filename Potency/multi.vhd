
entity multi is
    port(
        As,Bs: IN bit_vector(3 downto 0);
        P: OUT  bit_vector(3 downto 0)
    );

end multi;





architecture vira2 of multi is

    component somador is
        port(Ci,A,B : IN BIT;
             S,Co : OUT BIT);
        
    end component;

    signal Cout : bit_vector(5 downto 0);
    signal Si : bit_vector(5 downto 0);
    signal j : bit_vector(8 downto 0);




    begin

        j(0) <= As(1) AND Bs(0);

        j(1) <=  As(0) AND Bs(1);
        
        j(2) <= As(2) AND Bs(0);
        
        j(3) <= As(1) AND Bs(1);
        
        j(4) <= As(0) AND Bs(2);
        
        j(5) <= As(3) AND Bs(0);
        
        j(6) <= As(2) AND Bs(1);
        
        j(7) <= As(1) AND Bs(2);
        
        j(8) <= As(0) AND Bs(3);

        
        somador0: somador port map(
            Ci => '0',
            A => j(0),
            B => j(1),
            S => Si(0),
            Co => Cout(0)
        );
        somador1: somador port map(
            Ci => Cout(0),
            A => j(2),
            B => j(3),
            S => Si(1),
            Co => Cout(1));

        somador2: somador port map(
            Ci => '0', --1
            A => Si(1), -- 0 
            B => j(4), -- 0
            S => Si(2),
            Co => Cout(2));

        somador3: somador port map(
            Ci => Cout(1),
            A => j(5),
            B => j(6),
            S => Si(3),
            Co => Cout(3));

        somador4: somador port map(
            Ci => '0',
            A => j(7),
            B => j(8),
            S => Si(4),
            Co => Cout(4)
        );

        somador5: somador port map(
            Ci => '0',
            A => Si(3),
            B => Si(4),
            S => Si(5),
            Co => Cout(5)
        );
    

        P(0) <= As(0) AND Bs(0);
        
        P(1) <= Si(0);
        
        P(2) <= Si(2);
        
        P(3) <= Si(5);

end vira2;