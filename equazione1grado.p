program equazioni_1_grado; {Programma per risolvere equazioni di primo grado, realizzato da Apo e Ciceri}
uses crt;
	var a, b, x: real;	
begin
        clrscr;
	writeln('Benvenuto sul nostro programma(Apo e Ciceri) di risoluzione di equazioni di primo grado.');
	write('Inserisci il termine incognito dell''equazione: ');
	readln(a);
	write('Inserisci il termine noto dell''equazione: ');
	readln(b);
	if a=0
		then if b=0
			then writeln('L''equazione è indeterminata.')
			else writeln('L''equazione è impossibile.')
		else
			begin
				x:=-(b/a);
				writeln('La soluzione dell''equazione è ', x);
			end;
	readln;	
end.
