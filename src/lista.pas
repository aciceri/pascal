program lista;

uses sysutils;

const path_file_studenti='studenti.dat';

type t_studente=record
		cognome, nome: string[20];
		sesso: char;
		nascita: string[6];
		residenza: string[20];
	end;
	t_file_studenti=file of t_studente;
	t_punt=^t_elemento;
	t_elemento=record
		studente: t_studente;
		p: t_punt;
	end;
	
var file_studenti: t_file_studenti;
	p_init: t_punt;
	scelta: byte;


function menu():byte;
begin	
	writeln('-------------------------');
	writeln('Cosa vuoi fare?');
	writeln('	0 - Esci');
	writeln('	1 - Resetta file');
	writeln('	2 - Inserisci record nel file');
	writeln('	3 - Crea lista ordinata da file');
	writeln('	4 - Visualizza lista');
	write('->  ');
	readln(menu);
	writeln('-------------------------');
end;

procedure crea_file(var file_studenti: t_file_studenti);
	var n, i: integer;
		studente: t_studente;
begin
	if not FileExists(path_file_studenti) then
		rewrite(file_studenti);
	reset(file_studenti);
	while not eof(file_studenti) do read(file_studenti, studente);

	write('Quanti studenti vuoi inserire? ');
	readln(n);
	for i:=1 to n do
	begin
		with studente do
		begin
			write('Inserisci il cognome: ');
			readln(cognome);	
			write('Inserisci il nome: ');
			readln(nome);
			write('Inserisci il sesso(M/F): ');
			readln(sesso);	
			write('Inserisci la data di nascita(GGMMAA): ');
			readln(nascita);	
			write('Inserisci la residenza: ');
			readln(residenza);
		end;
		write(file_studenti, studente);
	end;
end;

function ricerca(studente: t_studente; p: t_punt):t_punt;
begin
	if ((studente.cognome < p^.p^.studente.cognome) or (p = nil))
		then ricerca:=p
		else ricerca:=ricerca(studente, p^.p);
end;

function crea_lista_ordinata(var file_studenti: t_file_studenti):t_punt;
	var p_init, p_att: t_punt;
		studente: t_studente;
begin
	if not FileExists(path_file_studenti) then
		rewrite(file_studenti);
	reset(file_studenti);
	
	if not eof(file_studenti) then { Se il file non è vuoto }
	begin
		read(file_studenti, studente);
		new(p_att);
		p_init:=p_att;
		p_att^.studente:=studente;
		p_att^.p:=nil;

		while not eof(file_studenti) do { Scorri i record nel file }
		begin
			read(file_studenti, studente);
			new(p_att);
			if studente.cognome < p_init^.studente.cognome then
			begin
				p_att^.p:=p_init;
				p_init:=p_att;
			end
			else
			begin
				p_att^.p:=ricerca(studente, p_init);
				ricerca(studente, p_init)^.p:=p_att;
			end;
		end;

		writeln('Lista creata con successo :)');
	end
	else begin
		writeln('Il file è vuoto, la lista non è stata creata');
	end;

	crea_lista_ordinata:=p_init; { Ritorna puntatore iniziale della lista }
end;

procedure visualizza_studente(studente: t_studente);
begin
	with studente do
	begin
		writeln('Cognome: ', cognome);
		writeln(' Nome: ', nome);
		writeln(' Sesso: ', sesso);
		writeln(' Data di nascita: ', nascita);
		writeln(' Residenza: ', residenza);
	end;
end;

function visualizza_lista(p: t_punt):t_punt;
begin
	visualizza_studente(p^.studente);
	if p^.p <> nil then
		visualizza_lista(p^.p);
end;

begin
	assign(file_studenti, path_file_studenti);
	p_init:=nil;
	repeat	
		scelta:=menu();
		case scelta of
			0: writeln('Grazie per avermi usato');
			1: rewrite(file_studenti);
			2: crea_file(file_studenti);
			3: p_init:=crea_lista_ordinata(file_studenti);
			4: if p_init <> nil then visualizza_lista(p_init) else writeln('Lista vuota');
			else writeln('Input non valido, ritenta, sarai più fortunato ;)');
		end;
	until scelta=0;
end.
