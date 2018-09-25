entity mux is
    port(A,B : IN bit_vector(3 downto 0);
         S : IN BIT;
         Z : OUT bit_vector(3 downto 0)
    );

end mux;

architecture luiz of mux is

    begin
        Z(0) <= (A(0) AND not S) OR (B(0) AND S);
        Z(1) <= (A(1) AND not S) OR (B(1) AND S);
        Z(2) <= (A(2) AND not S) OR (B(2) AND S);
        Z(3) <= (A(3) AND not S) OR (B(3) AND S);
    
end luiz;
