program calcolatrice;
    uses crt;
    var a, b, c: real;
        op: byte;
        i, q, r: integer;

	procedure inserisci(var a, b: real);
		begin
			clrscr();
			write('Inserisci un numero(A): ');
			readln(a);
			write('Inserisci un numero(B): ');
			readln(b);
		end;

	procedure menu(var scelta: byte);
		begin
			repeat
			writeln('Scegli quale operazione eseguire: ');
			writeln('1-Somma(A + B)');
			writeln('2-Sottrazione(A - B)');
			writeln('3-Moltiplicazione(A * B)');
			writeln('4-Divisione(A / B)');
			writeln('5-Elevamento a potenza(A ^ B)');
			writeln('6-Elevamento a potenza(MCD(A, B))');
			write('--> ');
			read(scelta);
			until scelta in [1,2,3,4,5,6];
		end;

	procedure somma(a, b:real; var c: real);
		begin
			c:=a+b;
		end;

	procedure sottrazione(a, b:real; var c:real);
		begin
			c:=a-b
		end;

	procedure prodotto(a, b:real; var c:real);
		begin
			c:=a*b;
		end;

	procedure divisione(a, b:real; var c:real);
		begin
			if b <> 0 then
				c:=a/b
		end;

	procedure potenza(a, b:real; var c: real);
		begin
			if b = 0 then
				c:=1
			else
				begin
					if b > 0 then
						begin
							c:=1;
							i:=0;
							while i < b do
								begin
									i:=i+1;
									c:=c*a;
								end;
						end
					else
						begin
							c:=1;
							b:=-b;
							i:=0;
							while i < b do
								begin
									i:=i+1;
									c:=c*a;
								end;
							c:=1/c
						end;
				end;
		end;
		
	procedure mcd(a, b:real; var c: real);
		begin

		end;
	
	procedure risultato(a, b, ris: real; op: byte);
		begin
			if (b = 0) and (op = 4) then
				writeln('Errore: Impossibile dividere per 0')
			else
				begin
					case op of
						1:write('Il risultato dell''addizione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
						2:write('Il risultato della sottrazione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
						3:write('Il risultato della moltiplicazione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
						4:write('Il risultato della divisione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
						5:write('Il risultato di ', a:5:5, ' alla ',b:5:5 ,' e'' ');
						6:write('L''M.C.D tra ', a:5:5, ' e ',b:5:5 ,' e'' ');
					end;
					writeln(c:5:5);
				end;
		end;
begin
	inserisci(a, b);
    menu(op);
	case op of
		1:somma(a, b ,c);
		2:sottrazione(a, b, c);
		3:prodotto(a, b ,c);
		4:divisione(a, b ,c);
		5:potenza(a, b, c);
	end;
	risultato(a, b, c, op);
end.
