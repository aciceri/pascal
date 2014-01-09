program puntatore;

type 
	t_nome = string[20];
	t_punt = ^t_nome;

var p: t_punt; { 1 Creazione puntatore }


begin
	{ 2 Allocazione variabile dinamica }
	{ 3 Scrittura indirizzo in p }
	new(p);
	{ 4 Scrivere contenuto }
	p^:='pippo';
	writeln(p^);
	{ 5 Rendere disponibile area di memoria per altro }
	dispose(p);
	writeln(p^);
end.
