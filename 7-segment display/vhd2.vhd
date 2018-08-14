entity vhdl2 is
 port( sw: in bit_vector(3 downto 0);
	hex: out bit_vector(6 downto 0));
end vhdl2;

architecture ckt of vhdl2 is

	begin 

		hex(6) <= ((not sw(3) and not sw(2)) or (not sw(3) and not sw(2)) or (not sw(2) and not sw(0)) or (sw(3) and sw(1)) or (sw(2) and not sw(1) and sw(3)));
		hex(5) <= ((not sw(2) and not sw(0)) or (not sw(1) and not sw(0)) or (sw(1) and sw(0)) or (sw(3) and sw(2) and not sw(1)));
		hex(4) <= ((not sw(3) and sw(0)) or (sw(1) and sw(0)) or (not sw(3) and not sw(2) and sw(1)) or (not sw(3) and sw(2) and not sw(1)) or (sw(3) and not sw(1) and not sw(0)));
		hex(3) <= (not sw(3) and not sw(2) and not sw(1)) or (not sw(3) and not sw(2) and not sw(0)) or (not sw(2) and not sw(1) and not sw(0)) or (not sw(3) and sw(2) and sw(0)) or (sw(3) and sw(1) and sw(0)) or (sw(3) and sw(2) and not sw(0));
		hex(2) <= (sw(3) or (not sw(2) and not sw(1)) or (not sw(2) and sw(0)) or (sw(2) and sw(1) and not sw(0)));
		hex(1) <= (not sw(1) and sw(0)) or (sw(3) and not sw(0)) or (not sw(3) and not sw(2) and sw(0)) or (sw(2) and sw(1) and not sw(0));
		hex(0) <= (sw(2) and not sw(1)) or (sw(3) and not sw(1)) or (not sw(3) and not sw(2) and not sw(0)) or (not sw(3) and sw(1) and sw(0)) or (not sw(2) and sw(1) and sw(0)) or (sw(3) and sw(2) and not sw(0));

	end ckt;



