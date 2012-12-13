program perfetto;
	var n, i, som: integer;
begin
	som:=0;
	i:=0;
	write('Inserisci un numero: ');
	read(n);
	repeat
		i:=i+1;
		if n mod i = 0 then
			som:=som+i;
	until (som > n) or (i > n div 2);
	if n = som then
		writeln('Il numero ', n,' è perfetto.')
	else
		writeln('Il numero ', n,' non è perfetto.');
end.
