entity main is
    port(
        Asf,Bsf: IN bit_vector(3 downto 0);
        Cinf : IN BIT;
        Sf: OUT  bit_vector(7 downto 0);
        Cof : OUT BIT
    );

end main;






architecture ckt2 of main is
    
    component soma4bit is
        port(
            As,Bs: IN bit_vector(3 downto 0);
            Cis: IN BIT;
            Ss: OUT  bit_vector(3 downto 0);
            C0s: OUT BIT
        );
    
    end component;

    signal Sf1,Sf2 : bit_vector(3 downto 0);
    signal cor : BIT;
    signal cout1 : BIT;
    signal cout2 : BIT;



    begin

        somaN: soma4bit port map(
            As => Asf,
            Bs => Bsf,
            Cis => Cinf,
            Ss => Sf1,
            C0s => cout1
        );

        cor <= (Sf1(1) AND Sf1(3)) OR (Sf1(2) AND Sf1(3)) OR cout1;

        soma6 : soma4bit port map(
            As => Sf1,
            Bs(3) => '0' ,
            Bs(2) => cor,
            Bs(1) => cor,
            Bs(0) => '0',
            Cis => '0',
            Ss => Sf(3 downto 0)
        );

        Sf(7 downto 5)<="000";
        Sf(4)<=cor;

end ckt2;
