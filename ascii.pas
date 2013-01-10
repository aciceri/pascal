program ascii;
	var i: integer;
	
	begin
		for i:=0 to 255 do
			begin
				writeln(i, ' - ', chr(i));
			end;
	end.
