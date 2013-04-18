program sort;
const dmax=20;
type vector=array[1..dmax] of integer;
var pippo: vector;
    n, i: integer;

procedure selectionSort(var v: vector; len: integer);
	var i, j, tmp: integer;
	begin
		for i:=1 to len-1 do
			for j:=i+1 to len do
				if (v[i] > v[j]) then
					begin
					tmp:=v[i];
					v[i]:=v[j];
					v[j]:=tmp;
					end;
	end;

procedure bubbleSort(var v: vector; len: integer);
	var k, max, tmp, i: integer;
	    go: boolean;
	begin
		k:=len;
		go:=true;
		while go do
			begin
			max:=k;
			go:=false;
			for i:=1 to max-1 do
				if (v[i] > v[i+1]) then
					begin
						tmp:=v[i];
						v[i]:=v[i+1];
						v[i+1]:=tmp;
						go:=true;
						k:=i;
					end;
			end;
	end;

begin
	write('Quanti elementi contiene il vettore? ');
	readln(n);
	
	for i:=1 to n do
		begin
		write('Inserisci il ', i, ' elemento: ');
		readln(pippo[i]);
		end;
	
	{selectionSort(pippo, n);}
	bubbleSort(pippo, n);

	
	for i:=1 to n do
		begin
		writeln(pippo[i]);
		end;
end.
