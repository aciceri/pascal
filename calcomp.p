program calcomp;
    uses crt;
    var r1, i1, r2, i2, ris: real;
        op: integer;
begin
    write('primo numero reale');
    readln(r1);
    write('primo numero immaginario');
    readln(i1);
    write('secondo numero reale');
    readln(r2);
    write('secondo numero immaginario');
    readln(i2);
    repeat
        writeln('Scegli che operazione effettuare: (1=somma - 2=sottrazione - 3=moltiplicazione - 4=divisione)'); 
        readln(op);
        case op of
            1: writeln('s');
            2: writeln('S');
            3: writeln('p');
            4: writeln('d');
            else writeln('err');
        end;
    until ((op=1) or (op=2) or (op=3) or (op=4));
    readln;
end.
