program file_numeri;
uses sysutils;

const
	path_file_input='numeri.dat';
	path_file_pari='pari.dat';
	path_file_dispari='dispari.dat';

type t_file_numeri=file of integer;

var file_input, file_pari, file_dispari: t_file_numeri;
	lun: integer;

function leggi_numeri(var file_input: t_file_numeri):integer;
var i, dim, num: byte;
begin
	assign(file_input, path_file_input);
	if not FileExists(path_file_input)
		then rewrite(file_input);
	reset(file_input);
	writeln('Quanti numeri vuoi inserire? ');
	readln(dim);
	for i:=1 to dim do
		begin
		write('Inserisci il ', i,' numero: ');
		readln(num);
		write(file_input, num);
		end;
	leggi_numeri:=dim;
	close(file_input);
end;

function pari(n: integer):boolean;
begin
	if ((n mod 2) = 0)
		then pari:=True
	else
		pari:=False;
end;

procedure separa(lun: integer; var file_input, file_dispari, file_pari: t_file_numeri);
var i, num: integer;
begin	
	assign(file_input, path_file_input);
	if not FileExists(path_file_input)
		then rewrite(file_input);
	reset(file_input);
	assign(file_pari, path_file_pari);
	if not FileExists(path_file_pari)
		then rewrite(file_pari);
	reset(file_pari);
	assign(file_dispari, path_file_dispari);
	if not FileExists(path_file_dispari)
		then rewrite(file_dispari);
	reset(file_dispari);
	while not eof(file_input) do
		begin
		read(file_input, num);
		if pari(num)
			then write(file_pari, num)
			else write(file_dispari, num);
		end;
	close(file_input);
	close(file_pari);
	close(file_dispari);
end;

procedure visualizza(var file_numeri: t_file_numeri);
var num: integer;
begin
	reset(file_numeri);
	while not eof(file_numeri) do
		begin
		read(file_numeri, num);
		writeln(num);
		end;
	close(file_numeri);
end;

begin
	separa(leggi_numeri(file_input), file_input, file_dispari, file_pari);	
	
	writeln('File input:');
	visualizza(file_input);
	writeln('File dispari:');
	visualizza(file_dispari);
	writeln('File pari:');
	visualizza(file_pari);
end.
