program frasom;
	uses crt;
var n1, d1, n2, d2, n3, d3: integer;
	
	procedure carica(var n1, d1, n2, d2 :integer); {Inizializza le frazioni}
		begin
			repeat
				clrscr();
				write('Inserisci il numeratore del primo numero: ');
				read(n1);			
				write('Inserisci il denominatore del primo numero: ');
				read(d1);
				write('Inserisci il numeratore del secondo numero: ');
				read(n2);
				write('Inserisci il denominatore del secondo numero: ');
				read(d2);
			until (d1 <> 0) and (d2 <> 0);
		end;
	
	procedure mcd(a, b: integer; var c: integer); {Calcola l'M.C.D tra due numeri}
		var r: integer;
		begin
		r:= a mod b;	
		while r <> 0 do
			begin;
				a:=b;
				b:=r;
				r:=a mod b;
			end;
		c:=b;
		end;

	procedure mcm(a, b: integer; var c: integer);
		var m: integer;
		begin
			mcd(a, b, m);
			c:=(a * b) div m;
		end;

	procedure somma(n1, d1, n2, d2: integer; var n3, d3: integer);
		var m: integer;
		begin
			mcm(d1, d2, m);
			d1:=m div d1;
			d2:=m div d2;
			n1:=d1 * n1;
			n2:=d2 * n2;
			n3:=n1 + n2;
			d3:=m;
		end;

	procedure riduci(var n, d: integer);
		var m: integer;		
		begin
			mcd(n, d, m);
			n:=n div m;
			d:=d div m;
		end;

	procedure visualizza(n1, d1, n2, d2, n3, d3: integer);
		begin
			writeln('La somma tra ', n1, '/', d1, ' e ', n2, '/', d2, ' è ', n3, '/', d3);
		end;
begin
	carica(n1, d1, n2, d2);
	somma(n1, d1, n2, d2, n3, d3);
	riduci(n3, d3);
	visualizza(n1, d1, n2, d2, n3, d3);
end.
