program numero_perfetto;
	uses crt;
	var n, i, som :integer;
		s : reaL;
begin
	writeln('inserisci il numero: ');
	readln(n);
	som:=0;
	i:=0;
	repeat
	i:=i+1;

	s := n mod i;
	
	if s = 0
		then som=som+1;

	until (som>n)
	if som=n 
		then writeln('è un numero perfetto: ');
end.
