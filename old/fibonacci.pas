program fibonacci;
	uses crt;
	var a, b, som: longint;
	begin
		a:=1;
		b:=1;
		writeln(a);
		writeln(b);
		repeat
			som:=a+b;
			writeln(som);
			a:=b;
			b:=som;
		until som>1000000000;
	end.
