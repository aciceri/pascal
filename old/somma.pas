program somma;
uses crt;
var
a, b, c: real;
begin
        clrscr;
        writeln('Benvenuto nel programma di somma, inserisci il primo numero: ');
readln(a);
        writeln('Inserisci il secondo numero: ');
readln(b);
        c:=a+b;
writeln('La somma tra ',a,' e ',b,' e'' ',c);
end.
