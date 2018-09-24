entity soma1bit is
 port( A,B,Ci: in bit;
	Co,S: out bit);
end soma1bit;

architecture ckt of soma1bit is

	begin 
	
	Co <= (A and B) or (A and Ci) or (B and Ci);
	S <= A xor B xor Ci;
	
	

	end ckt;
