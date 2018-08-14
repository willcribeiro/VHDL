entity main3 is 
	port (A2 , A1, A3, A0: in bit;
		S1,S0: out bit);
end main3;

architecture ckt of main3 is 

	begin

		S1 <= (A3 OR A2) XNOR (A3 XNOR (A2 AND A1));
		S0 <= (A3 XNOR (A2 AND A1)) OR ((A2 AND A1) OR A0);

end ckt;
