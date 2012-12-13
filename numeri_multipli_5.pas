Program numeri_multipli_5;
	var n ,num ,r ,k: integer;
begin
k:=0;
writeln('Inserire la quantita dei numeri: ');
readln(n);
repeat
	writeln('Inserire il numero: ');
	readln(num);
	k:=k+1;
	r:=num mod 5;
	if r=0
		then writeln('è un numero multiplo di 5')
		else writeln('Non è un numero multiplo di 5');
until k=n;
end.
