
entity somador is
    port(Ci,A,B : IN BIT;
         S,Co : OUT BIT);

end somador;

architecture soma of somador is
    
    
    begin
       S <= (not Ci AND ((not A AND B) OR (A AND not B)))   OR    (Ci AND ((not A AND not B) OR (A AND B)));

       Co <= (not Ci AND A AND B)   OR (Ci AND ((not A AND B) OR (A AND not B) OR (A AND B)));
    
end soma;