program elenco;
uses sysutils;

const	path_file_elenco='file_elenco.dat';

type
	t_elenco_ar=array[1..20] of string[20];
	t_elenco=record
		nome:t_elenco_ar;
		cognome:t_elenco_ar;
		sesso:array[1..20] of char;
		dataN:t_elenco_ar;
		citta:t_elenco_ar;
		end;	

	t_file_elenco=file of t_elenco;

var
	file_elenco:t_file_elenco;
	scelta:integer;

procedure inizializza(var file_elenco:t_file_elenco);
begin
	assign(file_elenco,path_file_elenco);
	if not FileExists(path_file_elenco)
		then rewrite(file_elenco);
end;

procedure carica( var file_elenco:t_file_elenco);
var elenco:t_elenco;
	i:integer;
begin
	reset(file_elenco);
	i:=0;	
	repeat
	i:=i+1;
	writeln('Digita "finito" per finire la carica');
	write('Inserisci il nome: ');
	readln(elenco.nome[i]);
	if elenco.nome[i]='finito'
		then
		else  begin
				write('Inserisci il cognome: ');
				readln(elenco.cognome[i]);
				write('Inserisci il sesso(m/f): ');
				readln(elenco.sesso[i]);
				write('Inserisci la data di nascita(GG:MM:AAAA): ');
				readln(elenco.dataN[i]);
				write('Inserisci la città resid.: ');
				readln(elenco.citta[i]);
				write(file_elenco,elenco);
		   	   end;
	until elenco.nome[i]='finito';	
	close(file_elenco); 

end;

procedure ordina(var file_elenco:t_file_elenco);
var elenco: t_elenco;
	i:integer;
	cognome: string[15];
begin
	reset(file_elenco);
	i:=1;
	while not eof(file_elenco) do
		begin
			read(file_elenco,elenco);
			i:=i+1;
			if elenco.cognome[1] < elenco.cognome[i]
				then begin
						cognome:=elenco.cognome[1];
						elenco.cognome[1]:=elenco.cognome[i];
						elenco.cognome[i]:=cognome;
					 end;
		end;
	close(file_elenco)
end;

procedure visualizza(var file_elenco:t_file_elenco);
var i:integer;
	elenco: t_elenco;
begin
reset(file_elenco);
i:=0;
	while not eof(file_elenco) do
		begin
			i:=i+1;
			read(file_elenco,elenco);
			write(elenco.cognome[i]); 
			write(' ');
			write(elenco.nome[i]);
			write(' '); 
			write(elenco.sesso[i]); 
			write(' ');
			write(elenco.dataN[i]); 
			write(' ');
			write(elenco.citta[i]);
			writeln();
		end;
	close(file_elenco);
end;

procedure menu(var scelta:integer);
begin
	writeln('Welcome to my program');
	writeln('1-Carica');
	writeln('2-Ordina');
	writeln('3-Visualizza');
	writeln('0-Esci');
	write('-> ');
	readln(scelta);
end;

begin
inizializza(file_elenco);
repeat
menu(scelta);
case scelta of
	1:carica(file_elenco);
	2:ordina(file_elenco);
	3:visualizza(file_elenco);
	end;
until scelta=0;
end.
