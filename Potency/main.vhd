entity main is
    port(
        Am: IN bit_vector(3 downto 0);
        Bm: IN bit_vector(1 downto 0);
        Cm: OUT bit_vector(3 downto 0)
    );

end main;






architecture felipe of main is
    
    component multi is
        port(
            As,Bs: IN bit_vector(3 downto 0);
            P: OUT  bit_vector(3 downto 0)
        );
    
    end component;

    component mux2 is
        port(
            A2,B2,C2,D2 : IN bit_vector(3 downto 0);
             S2 : IN bit_vector(1 downto 0);
             Z2 : OUT bit_vector(3 downto 0)
        );
    
    end component;

    signal A2 : bit_vector(3 downto 0);
    signal A3 : bit_vector(3 downto 0);
    signal mr : bit_vector(3 downto 0);



    begin

        multi0: multi port map(
            As => Am,
            Bs => Am,
            P => A2
        );

        multi1: multi port map(
            As => A2,
            Bs => Am,
            P => A3
        );

        mux0: mux2 port map(
            A2 => "0001",
            B2 => Am,
            C2 => A2,
            D2 => A3,
            S2 => Bm,
            Z2 => mr

        );
         Cm <= mr;



end felipe;

  
