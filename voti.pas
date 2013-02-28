program programma_voti;
	const lunghezza_classe=3;
	type studente=string[30];
	type voto=0..10;
	type t_classe=array[1..lunghezza_classe] of studente;
	type t_voti=array[1..lunghezza_classe] of voto;

	var studenti: t_classe;
	var voti: t_voti;
	var promossi: t_classe;

	procedure carica_studenti(var p_studenti: t_classe; var p_voti: t_voti);
		var i: byte;
		begin
			for i:=1 to lunghezza_classe do
			begin
				repeat
					write('Inserisci il nome del ', i, ' studente: ');
					readln(p_studenti[i]);
					write('Inserisci la valutazione del ', i, ' studente: ');
					readln(p_voti[i]);
				until ((p_studenti[i] <> '') or ((p_voti[i] > 0) or (p_voti[i] < 10)));
			end;
		end;

	


begin
	carica_studenti(studenti, voti);
end.
