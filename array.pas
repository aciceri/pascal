program vettore;
	uses crt;

	const dmax=30;
	type nome=string[20];	
	type classe=array[1..24] of nome;
	var info3a: classe;
	var nome_da_cercare: nome;
	var lunghezza: integer;
	var trovato: boolean;
	var continua: boolean;
	var scelta: integer;
	var posizione: integer;

	procedure carica(var arr: classe; var lunghezza: integer);
		var i: integer;
		begin
			repeat
				write('Quanti studenti ci sono nella classe? ');
				readln(lunghezza);
			until lunghezza <= dmax;
			for i:=1 to lunghezza do
				begin
					write('Inserisci il nome del ', i, ' alunno: ');
					readln(arr[i]);
				end;
		end;
	
	procedure visualizza(var arr: classe; lunghezza: integer);
		var i: integer;
		begin
			for i:=1 to lunghezza do
				begin
					writeln('Alunno n. ', i, ': ', arr[i]);
				end;
		end;

	function primo(var arr: classe; lunghezza: integer):nome;
		var i: integer;
		var minore: nome;
		begin
			minore:=arr[1];
			for i:=2 to lunghezza do
			begin
				if arr[i] < minore then
					minore:=arr[i];
			end;
			primo:=minore;
		end;

	function cerca(stringa: nome; arr: classe; lunghezza: integer; var posizione: integer):boolean;
		var i: integer;
		begin
			cerca:=False;
			i:=0;
			while (stringa <> arr[i]) and (i <= 24) do
				begin
					i:=i+1;
						if arr[i] = stringa then 
							begin
								posizione:=i;		
								cerca:=True;
							end;
				end;
		end;	

begin
	continua:=True;
	while continua do
		begin
			writeln('Menu di gestione del vettore:');
			writeln('1- Carica il vettore');
			writeln('2- Visualizza tutto il vettore');
			writeln('3- Visualizza il primo elemento');
			writeln('4- Cerca un elemento');
			writeln('0- Esci');
			write('Cosa vuoi fare? ');
			readln(scelta);
			case scelta of
				0: continua:=False;
				1: carica(info3a, lunghezza);
				2: visualizza(info3a, lunghezza);
				3: writeln('Il primo elemento e'' ', primo(info3a, lunghezza));
				4:
					begin
						write('Inserisci il nome da cercare: ');
						readln(nome_da_cercare);
						if cerca(nome_da_cercare, info3a, lunghezza, posizione) then
							writeln('Il nome "', nome_da_cercare, '" si trova in ', posizione, ' posizione.')
						else
							writeln('Il nome "', nome_da_cercare, '" non e'' presente.')
					end;
			end;
		end;
end.
