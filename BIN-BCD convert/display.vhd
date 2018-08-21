entity display is
	port(A: in bit_vector(3 downto 0);
		SD: out bit_vector(6 downto 0));
end display;

architecture fluxo of display is
 
component main is
        port(
        	SW: IN bit_vector(7 downto 0);
		bcd: OUT bit_vector(11 downto 0)
        );
    
end component;

begin

SD(0) <= ((not A(0)) and (not A(2))) or A(1) or A(3) or (A(2) and A(0));
SD(1) <= (not A(2)) or A(3) or ((not A(1)) and (not A(0))) or (A(1) and A(0));
SD(2) <= (not A(1)) or A(0) or ((not A(3)) and A(2));
SD(3) <= ((not A(2)) and (not A(0))) or ((not A(2)) and A(1)) or (A(1) and (not A(0))) or (A(2) and (not A(1)) and A(0));
SD(4) <= (A(1) and (not A(0))) or ((not A(2)) and (not A(0)));
SD(5) <= A(3) or ((not A(1)) and (not A(0))) or (A(2) and (not A(1))) or (A(2) and (not A(0)));
SD(6) <= (A(2) and (not A(1))) or (A(1) and (not A(0))) or A(3) or ((not A(2)) and A(1));

end fluxo;