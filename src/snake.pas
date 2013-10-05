program snake;

uses crt, sysutils, dateutils;

type t_direzione=(alto, basso, destra, sinistra);

type t_punto=record {Un punto è caratterizzato da due coordinate}
		x: integer;
		y: integer;
end;

type t_serpente=record
		corpo: array[0..1000] of t_punto; {Tutti i punti del corpo}
		lunghezza: integer;
		direzione: t_direzione;
		vivo: boolean;
end;

procedure CreaSerpente(var serpente: t_serpente);
	var i: integer;
	begin
	with serpente do
		begin
		vivo:=True;
		direzione:=destra;
		lunghezza:=10;
		for i:=1 to lunghezza do {Per ogni punto del corpo}
			begin
			corpo[i].x:=(ScreenWidth div 2)-5-i; {In posizione centrale}
			corpo[i].y:=ScreenHeight div 2; {In posizione centrale}
			end;
		end;
	end;

procedure CreaCibo(var cibo: t_punto);	
	begin
		cibo.x:=(ScreenWidth div 2) + 15; {In posizione centrale}
		cibo.y:=ScreenHeight div 2; {In posizione centrale}
	end;

procedure DisegnaSerpente(var serpente: t_serpente);
	var i: integer;
	begin
		with serpente do
			begin			
			TextBackground(LightGreen);
			for i:=2 to lunghezza do {Per ogni punto del corpo tranne la testa}
				begin
				GotoXY(corpo[i].x, corpo[i].y);
				write(' ');
				end;
			TextColor(Blue);
			GotoXY(corpo[1].x, corpo[1].y); {Disegna la testa}
			write('X');
			TextColor(White);
			TextBackground(Black);
			end;
	end;

procedure DisegnaCibo(var cibo: t_punto);
	begin
	gotoXY(cibo.x, cibo.y);
	TextBackground(Red);
	write(' ');
	TextColor(White);
	TextBackground(Black);
	gotoXY(ScreenWidth, ScreenHeight); {Isola il cursore in basso a destra(per Linux)}
	end;

procedure MuoviSerpente(var serpente: t_serpente);
	var i: integer;
	begin
	with serpente do
		begin
		for i:=lunghezza downto 2 do {Ogni punto si sposta dove si trova il successivo}
			corpo[i]:=corpo[i-1];
		case direzione of {La testa si sposta a seconda della direzione}
			alto: corpo[1].y:=corpo[1].y-1;
			sinistra: corpo[1].x:=corpo[1].x-1;
			destra: corpo[1].x:=corpo[1].x+1;
			basso: corpo[1].y:=corpo[1].y+1;	
			end;
		end;
	end;

procedure VerificaIncidenti(var serpente: t_serpente);
	var i: integer;
	begin
	with serpente do
		begin
		if ((corpo[1].y=0) or (corpo[1].y=ScreenHeight+1) or {Se il serpente esce dai margini}
			(corpo[1].x=0) or (corpo[1].x=ScreenWidth+1)) then
			vivo:=False;
		for i:=2 to lunghezza do
			begin
			if ((corpo[1].x=corpo[i].x) and {Se il serpente si tocca}
				(corpo[1].y=corpo[i].y)) then
			vivo:=False;
			end;
		end;
	end;

procedure VerificaCibo(var serpente: t_serpente; var cibo: t_punto);
	var i: integer;
	begin
	with serpente do
		begin
		if ((corpo[1].x=cibo.x) and (corpo[1].y=cibo.y)) then {Se il serpente mangia il cibo}
			begin
			randomize();
			cibo.x:=random(ScreenWidth)+1; {Genere il cibo in un punto casuale}
			cibo.y:=random(ScreenHeight)+1;
			lunghezza:=lunghezza+5;
			for i:=lunghezza-5 to lunghezza do {Allunga il serpente}
				begin
				corpo[i].x:=corpo[lunghezza-5].x; {Tutti i punti si sovrappongono sulla coda}
				corpo[i].y:=corpo[lunghezza-5].y; {(Quando il serpente si muove si srotolano)}
				end;
			end;
		end;
	end;

procedure Avvia(framerate:integer);
	var gioco: boolean;
		ch: char;
		inizio: tdatetime;
		serpente: t_serpente;
		cibo: t_punto;
	begin
	clrscr();
	cursoroff(); {Non funziona su Linux}
	CreaSerpente(serpente); {Inizializza parametri del serpente}
	CreaCibo(cibo); {Inizializza parametri del cibo}
	gioco:=True;
	while (gioco and serpente.vivo) do {Loop di gioco}
		begin
		inizio:=Now(); {Per il framerate}
		MuoviSerpente(serpente); {Aggiorna posizione serpente in base alla direzione}
		VerificaIncidenti(serpente); {Se il serpente tocca i margini o se stesso}
		VerificaCibo(serpente, cibo); {Se il serpente mangia del cibo}
		clrscr(); {Pulisci lo schermo prima di disgnarci}
		DisegnaSerpente(serpente);
		DisegnaCibo(cibo);
		while (MillisecondsBetween(inizio, Now()) < (1000/framerate)) do
			if KeyPressed() then
				case ReadKey() of
			   		#27: gioco:=False; {Se premi ESC esci dal gioco}
					#72: serpente.direzione:=alto; {FRECCIA SU}
					#75: serpente.direzione:=sinistra; {FRECCIA SINISTRA}
					#77: serpente.direzione:=destra; {FRECCIA DESTRA}
					#80: serpente.direzione:=basso; {FRECCIA BASSO}
					' ': repeat until ReadKey=' '; {Se premi SPAZIO metti in pausa}
				end;
		end;
	clrscr(); {Pulisci lo schermo quando finisci la partita}
	NormVideo();
	writeln('Hai fatto ', serpente.lunghezza-10, ' punti!');
	end;

begin
	if ((ScreenWidth>=80) and (ScreenHeight>=24)) then
		Avvia(10) {Avvia gioco dato il framerate}
	else
		writeln('Il terminale deve essere almeno 80X24!');
end.
