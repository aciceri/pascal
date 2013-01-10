program pitagora;
	var i, k, n: integer;

	begin
		for i:=1 to 10 do
			begin
				for k:=1 to 10 do
					begin
						n:=i*k;
						write(n:1, ' ');			
					end;
					writeln();
			end;
	end.				
