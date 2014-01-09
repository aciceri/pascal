program lista;

uses sysutils; { Per verificare l'esistenza del file }

const path_file_studenti='studenti.dat';

type
    t_studente=record
        cognome, nome: string[20];
        sesso: char;
        nascita: string[6];
        residenza: string[30];
    end;
    t_file_studenti=file of t_studente;
    t_punt=^t_nodo;
    t_nodo=record
        studente: t_studente;
        p: t_punt;
    end;

var file_studenti: t_file_studenti;
    p_init: t_punt;
    scelta: byte;

function menu(): byte;
begin
    writeln('------------------------');
    writeln('Cosa vuoi fare?');
    writeln('  0 - Esci');
    writeln('  1 - Crea lista degli studenti da tastiera');
    writeln('  2 - Salva la lista in un file');
    writeln('  3 - Carica la lista da un file');
    writeln('  4 - Cancella il contenuto del file');
    writeln('  5 - Stampa la lista');
    write('>>> ');
    readln(menu);
    writeln('------------------------');
end;


function leggi_studente: t_studente;
begin
    with leggi_studente do
    begin
        write('Inserisci il cognome: ');
        readln(cognome);
        write('Inserisci il nome: ');
        readln(nome);
        write('Inserisc il sesso(M/F): ');
        readln(sesso);
        write('Inserisci la data di nascita(GGMMAA): ');
        readln(nascita);
        write('Inserisci la residenza: ');
        readln(residenza);
    end;
end;

procedure resetta_file(var file_studenti: t_file_studenti);
begin
    rewrite(file_studenti);
    writeln('File resettato');
end;

procedure lista_a_file(p_init: t_punt; var file_studenti: t_file_studenti);
    var p_att: t_punt;

begin
    if not FileExists(path_file_studenti)
        then rewrite(file_studenti);
    reset(file_studenti);

    if p_init <> nil then
    begin
        p_att:=p_init;

        while p_att <> nil do
        begin
            write(file_studenti, p_att^.studente);
            p_att:=p_att^.p;
        end;
    
        writeln('La lista e'' stata salvata su file');
    end
    else begin
        writeln('La lista è vuota');
    end;
end;

function file_a_lista(var file_studenti: t_file_studenti): t_punt;
    var p_att: t_punt;
        studente: t_studente;

begin
    if not FileExists(path_file_studenti)
        then rewrite(file_studenti);
    reset(file_studenti);

    if not eof(file_studenti) then
    begin
        read(file_studenti, studente);
        new(p_init);
        p_att:=p_init;
        p_att^.studente:=studente;
        p_att^.p:=nil;

        while not eof(file_studenti) do
        begin
            read(file_studenti, studente);
            new(p_att^.p);
            p_att:=p_att^.p;
            p_att^.studente:=studente;
            p_att^.p:=nil;
        end;

        writeln('Il file è stato caricato');
        file_a_lista:=p_init;
    end
    else begin
        writeln('Il file e'' vuoto');
        file_a_lista:=nil;
    end;
end;

function crea_lista(): t_punt; { Crea lista ordinata da tastiera}
    
    function ricerca(studente: t_studente; p: t_punt):t_punt;
    begin
        if studente.cognome > p^.studente.cognome
            then ricerca:=p
            else ricerca:=ricerca(studente, p^.p);
    end;

    var p_init, p_att, p_prec: t_punt;
        studente: t_studente;
        i, n: byte;

begin
    write('Quanti studenti vuoi inserire? ');
    readln(n);
    
    if n > 1
    then begin
        new(p_init);
        p_att:=p_init;
        p_att^.studente:=leggi_studente();
        p_att^.p:=nil;
    
        for i:=1 to n-1 do
        begin
            new(p_att);
            studente:=leggi_studente();
            p_att^.studente:=studente;
        
            if p_att^.studente.cognome < p_init^.studente.cognome { Primo elemento }
            then begin
                p_att^.p:=p_init;
                p_init:=p_att;
            end
            else begin { Non primo elemento }
                p_prec:=ricerca(studente, p_init);
                p_att^.p:=p_prec^.p;
                p_prec^.p:=p_att;
            end;
        end;

        crea_lista:=p_init;
    end
    else begin
        writeln('Devi inserire almeno uno studente');
        crea_lista:=nil;
    end;
end;

procedure stampa_lista(p: t_punt);
    procedure stampa_studente(studente: t_studente);
    begin
        with studente do
        begin
            writeln('Cognome: ', cognome);
            writeln(' Nome: ', nome);
            writeln(' Sesso: ', sesso);
            writeln(' Nascita: ', nascita);
            writeln(' Residenza: ', residenza);
        end;
    end;

begin
    if p = nil then writeln('La lista e'' vuota')
    else begin
        stampa_studente(p^.studente);
        if p^.p <> nil then stampa_lista(p^.p);
    end;
end;

begin
    assign(file_studenti, path_file_studenti); { Inizializza il file }
    p_init:=nil; { Inzializza la lista }
    repeat
        scelta:=menu();
        case scelta of
            0: writeln('Grazie per avermi usato, alla prossima ;)');
            1: p_init:=crea_lista();
            2: lista_a_file(p_init, file_studenti);
            3: p_init:=file_a_lista(file_studenti);
            4: resetta_file(file_studenti);
            5: if p_init <> nil then stampa_lista(p_init) else writeln('Lista vuota');
            else writeln('Input non valido. Ritenta, sarai più fortunato.');
        end;
    until scelta = 0;
end.
