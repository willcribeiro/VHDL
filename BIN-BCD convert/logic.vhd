entity basiclogic is 
	port (	A: in bit_vector(3 downto 0);
		S: out bit_vector(3 downto 0)
		);

end basiclogic;

architecture ckt of basiclogic is 

	begin
		S(3) <= A(3) OR ( A(0) AND A(2)) OR (A(1) AND A(2));		
		S(2) <= (A(3) AND A(0)) OR (A(2) AND (not A(1)) AND (not A(0)));
		S(1) <= ((NOT A(0)) AND A(3)) OR (A(1) AND A(0)) OR (A(1) AND (NOT A(2)));
		S(0) <= ((not A(3)) AND (NOT A(2)) AND A(0)) OR (A(1) AND (NOT A(0)) AND A(2)) OR ((NOT A(0)) AND A(3));
		
		

	end ckt;
