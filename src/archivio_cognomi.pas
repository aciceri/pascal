program archivio_cognomi;
uses sysutils;

type
	t_cognome=string[30];
	t_file_cognomi=file of t_cognome;

var
	cognome: t_cognome;
	archivio: t_file_cognomi;

procedure carica(var archivio: t_file_cognomi);
	var continua: char;
begin
	assign(archivio, 'archivio.dat');
	if not FileExists('archivio.dat') then
		rewrite(archivio);
	reset(archivio);
	repeat
		write('Inserisci il cognome: ');
		readln(cognome);
		write(archivio, cognome);
		writeln('Vuoi inserire un altro cognome(S/N)? ');
		readln(continua);
	until continua='n';
end;

procedure visualizza(var archivio: t_file_cognomi);
begin
	reset(archivio);
end;

begin
	carica(archivio);
	visualizza(archivio);
end.
