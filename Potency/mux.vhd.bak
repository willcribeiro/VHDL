entity multiplexador is
 port( I1,I0, Ai: in bit;
	Q: out bit);

end multiplexador;

architecture ckt of multiplexador is

begin 
	
	Q <= ((not Ai) and I1)  or (Ai and I0);

end ckt;

