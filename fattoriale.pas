program fattoriale;
	var k: integer;

	function fattoriale(n: integer):real;
		var f: real;
		var k: integer;
		begin
			f:=1;
			if n <> 0 then
				begin
					for k:=n downto 1 do
						begin
							f:=f*k;
						end;
					fattoriale:=f;	
				end;
		end;

begin
	for k:=0 to 100 do
		begin
			writeln(k:2, ': ', fattoriale(k):200:0);
		end;
end.
