program archivio_cognomi;
uses sysutils;

const percorso='cognomi.dat';

type
	t_cognome=string[30];
	t_file_cognomi=file of t_cognome;

var
	cognome: t_cognome;
	archivio: t_file_cognomi;

procedure inizializza(var archivio: t_file_cognomi);
begin
	assign(archivio, percorso);
	if not FileExists(percorso) 
		then rewrite(archivio);
end;

procedure carica(var archivio: t_file_cognomi);
	var i, num: integer;
		tmp: t_cognome;
begin
	reset(archivio);
	write('Quanti cognomi vuoi inserire? ');
	readln(num);
	while not eof(archivio) do read(archivio, tmp);
	for i:=1 to num do
		begin
		write('Inserisci il ', i,' cognome: ');
		readln(cognome);
		write(archivio, cognome);
	end;
end;

procedure visualizza(var archivio: t_file_cognomi);
	var pippo: t_cognome;
begin
	reset(archivio);
	while not eof(archivio) do
		begin
		read(archivio, pippo);
		writeln(pippo);
		end;
end;

begin
	inizializza(archivio);
	carica(archivio);
	visualizza(archivio);
end.
