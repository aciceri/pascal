program programma_voti;
	type t_studente=string[30];
	type t_voto=byte;
	type t_classe=array[1..30] of t_studente;
	type t_voti=array[1..30] of t_voto;

	var lunghezza_classe: byte;
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
			
			for i:=1 to lunghezza_classe do
			begin
				repeat
					write('Inserisci il nome del ', i, ' studente: ');
					readln(p_studenti[i]);
					write('Inserisci la valutazione del ', i, ' studente: ');
					readln(p_voti[i]);
					write(p_voti[i], '  ', p_studenti[i]);
				until ((p_studenti[i] <> '') and (p_voti[i] >= 0) and (p_voti[i] <= 10));
			end;
		end;

	function media():real;
		begin

		end;

	procedure seleziona_promossi();
		begin

		end;
		


begin	
	carica_studenti(studenti, voti, lunghezza_classe);
	{seleziona_promossi(studenti, voti, studenti_promossi, voti_promossi, lunghezza);}
end.
