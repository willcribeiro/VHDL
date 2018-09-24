Entity ffd is
	port (clk,D,P,C: in BIT;
			q: Out BIT);
end ffd;

architecture ckt of ffd is 
signal qS: bit;
begin
	process(clk,P,C)
	begin
		if P = '0' then qS <= '1';
		elsif C = '0' THEN qS <= '0';
		ELSIF clk ='1' AND clk'EVENT THEN
			qS <= D;
		END IF;
	END PROCESS;
	q <= qS;
end ckt;
