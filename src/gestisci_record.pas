program gestisci_record;

type
	t_fattura=record
		numero:integer;
		data:string[8];
		impresa:string[20];
	end;

var 
	fatture:array[0..100] of t_fattura;
	n, i:byte;

begin
	writeln('Quante fatture vuoi inserire? ');
	readln(n);
	for i:=1 to n do
		begin
			write('Inserisci il numero della ',i , ' fattura: ');
			readln(fatture[i].numero);
			write('Inserisci la data: ');
			readln(fatture[i].data);
			write('Inserisci l'' impresa: ');
			readln(fatture[i].impresa);
		end;

	for i:=1 to n do
		begin
			writeln(fatture[i].numero);
			writeln(fatture[i].data);
			writeln(fatture[i].impresa);
		end;
end.
