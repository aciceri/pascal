program starwars;

type
t_parole=string[20];

var
nome,cognome,citta,madre,nomeS,cognomeS: t_parole;

procedure carica(var nome,cognome,madre,citta:t_parole);
begin
writeln('Devi rispettare quello che si dice, sennò fai male');
write('Inserisci il tuo nome: ');
readln(nome);
write('Inserisci il tuo cognome: ');
readln(cognome);
write('Inserisci il cognome di tua madre: ');
readln(madre);
write('Inserisci la città dove sei nato: ');
readln(citta);
end;

procedure nome_starwars(nome,cognome,madre,citta:t_parole; var nomeS,cognomeS:t_parole);  
begin
nomeS:=cognome[1]+ cognome[2]+ cognome[3] + nome[1] + nome[2];
cognomeS:= madre[1] + madre[2] + citta[1] + citta[2] + citta[3];
end;


begin
carica(nome,cognome,madre,citta);
nome_starwars(nome,cognome,madre,citta,nomeS,cognomeS);
writeln(' Il tuo nome di starwars e'' ', nomeS, '');
writeln(' Il tuo cognome di starwars e'' ',cognomeS, '');
end.
