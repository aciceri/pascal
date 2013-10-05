program potenza;
	uses crt;
	var r, n: real;
		m, i: integer;
	begin
		clrscr();
		write('Inserisci la base: ');
		readln(n);
		write('Inserisci l''esponente: ');
		readln(m);	
		r:=1;
		i:=0;
		while i<m do
		begin
			r:=r*n;
			i:=i+1;
		end;
		if m<=0 then
			r:=1/r;
		writeln(r);
	end.
