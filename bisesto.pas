program bisesto;
	var n: integer;
	label here;
	
	function bisestile(anno: integer):boolean;
		begin
			if ((anno mod 4 = 0) and ((anno mod 100 <> 0) or (anno mod 400 = 0))) then
				bisestile:=true
			else
				bisestile:=false;
		end;

begin
	here:writeln('Spara un anno: ');
	read(n);
	if bisestile(n) then
		writeln('Anno bisesto, anno funesto!!!')
	else
		writeln('I''m sorry, non è bisesto!!!');
	goto here;
end.
