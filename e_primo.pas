program e_primo;
    uses crt;
	
	function eprimo(n: integer):boolean;
		var d, r: integer;
		begin
		
			eprimo:=true;
			d:=2;
			repeat
				r:=n mod d;
				d:=d + 1;
				if r = 0 then begin
					eprimo:=false;
					d:=n div 2;
				end;
			until (d = (n div 2) + 2) or (not eprimo);
		end;

begin
	clrscr();
	
end.
