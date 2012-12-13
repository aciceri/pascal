Program reale_intero;
	var M, P, K: integer;
	var N: smallint;
begin
	write('Inserire il numero reale: ');
	readln(N);
	write('Inserire il numero intero: ');
	readln(M);
	P:=1;
	if M<>0 
		then
			begin
				K:=0;
				repeat
					P:=N*P;
					K:=K+1;
				until K=M;
				if M<0
					then P:=1 div P;
			end;
	writeln(P);
end.
