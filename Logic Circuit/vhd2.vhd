entity main2 is 
	port (A2 , A1, A3, A0: in bit;
		S1,S0: out bit);
end main2;

architecture ckt of main2 is 

	begin

		S1 <= (A3 XOR A2) OR (A3 AND (A2 XNOR A1));
		S0 <= (A3 AND (A2 XNOR A1)) AND (A0 XOR (A2 XNOR A1));

end ckt;
