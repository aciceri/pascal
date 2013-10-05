program equazioni_2_grado; {Programma per risolvere equazioni di secondo grado, realizzato da Apo e Ciceri}
uses crt;
	var a, b, c, d, x1, x2: real;
begin
        clrscr;
	writeln('Benvenuto sul nostro programma(Apo e Ciceri) di risoluzione di equazioni di secondo grado.');
	repeat
		write('Inserisci il termine di secondo grado dell''equazione: ');
		readln(a);
	until a<>0;
	write('Inserisci il termine di primo grado dell''equazione: ');
	readln(b);
	write('Inserisci il termine noto dell''equazione: ');
	readln(c);
	d:= b*b-4*a*c;
	if d>=0
		then
			begin
				x1:=(-b+sqrt(d))/(2*a);
				x2:=(-b-sqrt(d))/(2*a);
				writeln('S={',x1:10:7,',',x2:10:7,'}');

			end
		else
			writeln('S={}');
	readln;	
end.
