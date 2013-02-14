program potenza;
	var b, e: integer;

	function potenza(b, e: integer):real;
		var pote: real;
		begin
			pote:=1;
			if e > 0 then
				begin
					repeat
						pote:=b*pote;
						e:=e-1;
					until e=0;
				end;
			if e < 0 then
				begin
					repeat
						pote:=b*pote;
						e:=e+1;
					until e=0;
					pote:=1/pote;
				end;
			potenza:=pote;
		end;

begin
	writeln('Spara un number: ');
	readln(b);
	for e:=-10 to 10 do
		begin
			writeln(b, '^', e, ': ', potenza(b, e):25:10);
		end;	
end.
