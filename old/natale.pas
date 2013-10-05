program natale;
	var i, j, lar: integer;

procedure triangolo(lar: integer);
	begin
	for i:=0 to lar do
		begin
			write(' ');
		end;
	writeln('*');
	for i:=0 to lar do
		begin
			for j:=i to lar do
				begin
					write(' ');
				end;
			for j:=0 to i do
				begin
					write('**');
				end;
			writeln();	
		end;
	end;

begin
	triangolo(11);

end. 
