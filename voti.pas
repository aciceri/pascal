program programma_voti;
	type t_studente=string[30];
	type t_voto=byte;
	type t_classe=array[1..30] of t_studente;
	type t_voti=array[1..30] of t_voto;

	var lunghezza_classe: byte;
	var lunghezza_classe_promossi: byte;
	var studenti: t_classe;
	var voti: t_voti;
	var studenti_promossi: t_classe;
	var voti_promossi: t_voti;

	procedure carica_studenti(var p_studenti: t_classe; var p_voti: t_voti; var p_lunghezza_classe: byte);
		var i: byte;
		begin
			repeat
				write('Quanti studenti ci sono nella classe? ');
				readln(p_lunghezza_classe);
			until ((p_lunghezza_classe > 0) and (p_lunghezza_classe <= 30));
			
			for i:=1 to p_lunghezza_classe do
			begin
				repeat
					write('Inserisci il nome del ', i, ' studente: ');
					readln(p_studenti[i]);
					write('Inserisci la valutazione del ', i, ' studente: ');
					readln(p_voti[i]);
				until ((p_studenti[i] <> '') and (p_voti[i] >= 0) and (p_voti[i] <= 10));
			end;
		end;

	function media(p_voti: t_voti; p_lunghezza_classe: byte):real;
		var i: byte;
		var m: real;
		begin
			m:=0;
			for i:=1 to p_lunghezza_classe do
			begin
				m:=m + p_voti[i];
			end;
			media:=m / p_lunghezza_classe;
		end;

	procedure seleziona_promossi(p_studenti: t_classe; p_voti: t_voti; p_lunghezza_classe: byte;
var p_studenti_promossi: t_classe; var p_voti_promossi: t_voti; var p_lunghezza_classe_promossi: byte);
		var i, j: byte;
		var media_voti: real;
		begin
			media_voti:=media(p_voti, p_lunghezza_classe);
			j:=1;
			writeln('La media vale ', media_voti:2:2);
			for i:=1 to p_lunghezza_classe do
			begin
				if (p_voti[i] > media_voti) then
				begin
					p_studenti_promossi[j]:=p_studenti[i];
					p_voti_promossi[j]:=p_voti[i];
					inc(j);
				end;
			end;
			p_lunghezza_classe_promossi:=j-1;
		end;
		
	procedure stampa_classe(p_studenti: t_classe; p_voti: t_voti; p_lunghezza: byte);
		var i: byte;
		begin
			for i:=1 to p_lunghezza do
			begin
				writeln(p_studenti[i], ': ', p_voti[i]);
			end;
		end;

begin	
	carica_studenti(studenti, voti, lunghezza_classe);
	seleziona_promossi(studenti, voti, lunghezza_classe, studenti_promossi, voti_promossi, lunghezza_classe_promossi);
	stampa_classe(studenti_promossi, voti_promossi, lunghezza_classe_promossi);
end.
