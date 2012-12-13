program calcolatrice;
    uses crt; 
    var a, b, c: real;
        op: byte;
		scelta: byte;
	procedure inserisci(var a: real);
		begin
			write('Inserisci il primo numero: ');
			readln(a);
		end;
	procedure inserisci2(var b: real);
		begin
			write('Inserisci il secondo numero: ');
			readln(b);
		end;
	procedure menu(var scelta: byte);
		begin
			repeat
			writeln('Scegli quale operazione eseguire: ');
			writeln('1-Somma');
			writeln('2-Sottrazione');
			writeln('3-Moltiplicazione');
			writeln('4-Divisione');
			writeln('5-Potenza');
			writeln('6-MCD');
			write('--> ');
			readln(scelta);
			until scelta in [1,2,3,4,5,6];
		end;
	procedure somma(a, b:real; var c: real);
		begin
			c:=a+b;
		end;
	procedure sottrazione(a, b:real; var c:real);
		begin
			c:=a-b;
		end;
	procedure prodotto(a, b:real; var c:real);
		begin
			c:=a*b;
		end;
	procedure divisione(a, b:real; var c:real);
		begin
			if a <> 0 then
				c:=a/b
			else
				writeln('Errore: Impossibile dividere per 0');
		end;
	procedure risultato(a, b, ris: real; op: byte);
		begin
			case op of
				1:write('Il risultato dell''addizione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
				2:write('Il risultato della sottrazione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
				3:write('Il risultato della moltiplicazione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
				4:write('Il risultato della divisione tra ', a:5:5, ' e ', b:5:5, ' e'' ');
				5:write('Il risultato della potenza di ',a:5:5, ' alla ', b:5:5, ' e'' ');
				6:write('Il risultato dell'' MCD tra ',a:5:5, ' alla ', b:5:5, ' e'' ');
			end;
			writeln(c:5:5);
		end;
	procedure vuoicontinuare(var scelta: byte);
		begin
			repeat
			writeln('Vuoi continuare con l''operazione');
			writeln('1-Si');
			writeln('2-No');
			write('--> ');
			read(scelta);
			until scelta in [1,2];
	end;
	procedure potenza(a, b:real; var c:real);
		var d: real;
		begin
			d:=0;
			c:=1;
			repeat
				d:=d+1;
				c:=c*a;
			until b=d;
		end;
	procedure mcd(a, b:real; var c:real);
		var r, q: real;
		begin
			repeat
			q:= a / b;
			r:=a - q * b;
			a:=b;
			b:=r;
			until r<>0;
		writeln(a);
		end;
begin
	clrscr;
	inserisci(a);
	repeat;
	inserisci2(b);
    menu(op);
	case op of 
		1:somma(a, b ,c);
		2:sottrazione(a, b, c);
		3:prodotto(a, b ,c);
		4:divisione(a, b ,c);
		5:potenza(a ,b , c);
		6:mcd(a, b, c);
		end;
	risultato(a, b, c, op);
	vuoicontinuare(scelta);
	a := c;
	until scelta=2;	
end.
