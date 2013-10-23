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
		i, num: integer;
begin
	assign(archivio, 'cognomi.dat');
	if not FileExists('cognomi.dat') then
		rewrite(archivio);
	reset(archivio);
	write('Quanti cognomi vuoi inserire? ');
	readln(num);
	for i:=1 to num do
		begin
		write('Inserisci il ', i,' cognome: ');
		readln(cognome);
		write(archivio, cognome);
	end;
end;

procedure visualizza(var archivio: t_file_cognomi);
begin
	reset(archivio);
end;

begin
	carica(archivio);
	visualizza(archivio);
end.
