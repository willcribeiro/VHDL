entity mux2 is
    port(
        A2,B2,C2,D2 : IN bit_vector(3 downto 0);
         S2 : IN bit_vector(1 downto 0);
         Z2 : OUT bit_vector(3 downto 0)
    );

end mux2;





architecture vira of mux2 is
    
    component mux is
        port(A,B : IN bit_vector(3 downto 0);
         S : IN BIT;
         Z : OUT bit_vector(3 downto 0)
    );

    end component;

    signal muxO1,muxO2,muxO3 : bit_vector(3 downto 0);

    begin
        
       
        mux0: mux port map(
            A => A2,
            B => B2,
            S => S2(0),
            Z => muxO1
        );
        mux1: mux port map(
            A => C2,
            B => D2,
            S => S2(0),
            Z => muxO2
        );
        
        mux2: mux port map(
            A => muxO1,
            B => muxO2,
            S => S2(1),
            Z => muxO3
        );
    
        Z2 <= muxO3;

end vira;
