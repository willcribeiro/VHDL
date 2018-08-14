entity main4 is 
	port (A2 , A1, A3, A0: in bit;
		S1,S0: out bit);
end main4;

architecture ckt of main4 is 

	begin

		S1 <= (A3 or A2) XNOR (A3 XOR (A2 XOR A1));
		S0 <= (A3 XOR (A2 XOR A1)) OR ((A2 XOR A1) OR A0);

end ckt;