entity main1 is 
	port (A2 , A1, A3, A0: in bit;
		S1,S0: out bit);
end main1;

architecture ckt of main1 is 

	begin

		S1 <= (A3 OR A2) XOR (A3 OR (A2 XOR A1));
		S0 <= (A3 OR (A2 XOR A1)) OR (A0 AND(A2 XNOR A1));

end ckt;
