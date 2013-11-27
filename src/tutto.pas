program tutto;

uses sysutils;

const
path_file_numeri='file_numeri.dat';

type
t_n=record
	numero:integer;
	esiste:boolean;
	end;

t_file_numeri=file of t_n;

var
	file_numeri:t_file_numeri;
	

procedure carica(var file_numeri:t_file_numeri);
var n,i:integer;
	num: t_n;

begin
	assign(file_numeri, path_file_numeri);
	if not FileExists(path_file_numeri)
		then rewrite(file_numeri);
	reset(file_numeri);
	{while not eof(file_numeri) do read(file_numeri, num);}
	seek(file_numeri, filesize(file_numeri));
	write('Inserisci il numero dei numeri: ');
	readln(n);
	for i:=1 to n do
		begin
		writeln('Inserisci il numero: ');
		readln(num.numero);
		num.esiste:=true;
		write(file_numeri, num);
		end;
	close(file_numeri);
end;

procedure visualizza(var file_numeri:t_file_numeri);
var num: t_n;

begin
reset(file_numeri);
	while not eof(file_numeri) do
		begin
		read(file_numeri, num);
		if num.esiste=true
		then writeln(num.numero);
		end;
end;

begin
carica(file_numeri);
visualizza(file_numeri);
end.
