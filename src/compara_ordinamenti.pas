program ComparaOrdinamenti;

uses sysutils, dateutils;

const dmax=90000;
type vettore=array[1..dmax] of integer;
var
	prima: TDateTime;
	vet, vet_backup:vettore;
	delta:integer;

procedure genera_vettore(var v:vettore; l:integer);
var i: integer;
begin
	randomize();
	for i:=1 to l do
		v[i]:=random(100000);
end;

procedure scambia(var a, b: integer);
begin
	if a<>b then
	begin
		a:=a xor b;
		b:=a xor b;
		a:=a xor b;
	end;
end;

procedure quicksort(var v: vettore; s, d: integer);
var i, j, pivot :integer;
begin
	i:=s;
	j:=d;
	pivot:=v[(s+d) div 2];
	repeat
		while v[i] < pivot do   
		inc(i);
		while pivot < v[j] do   
		dec(j);
		if (i <= j) then
		begin
			scambia(v[i], v[j]);
			inc(i);
			dec(j);
		end;
	until (i > j);
	if (s < j) then quicksort(v, s, j);
	if (i < d) then quicksort(v, i, d);
end;

procedure selectionsort(var v: vettore; l: integer);
var i, j: integer;
begin
	for i:=1 to l-1 do
		for j:=i+1 to l do
			if v[i]>v[j] then
				scambia(v[i], v[j]);
		end;

procedure bubblesort(var v:vettore; l: integer);
var k, sup, i: integer;
continua: boolean;
begin
	k:=l;
	continua:= True;
	while continua do
	begin
		sup:=k;
		continua:=False;
		for i:=1 to sup-1 do
			if v[i]>v[i+1] then
			begin
				scambia(v[i], v[i+1]);
				continua:=True;
				k:=i;
			end;
		end;
	end;

begin
	write('Generazione vettore di 900000 interi casuali da 0 a 100000...');
	genera_vettore(vet, dmax);
	writeln('FATTO');
	vet_backup:=vet;

	write('Ordinamento tramite Selection Sort...');
	prima:=Now();
	selectionsort(vet, dmax);
	delta:=MilliSecondsBetween(prima, Now());
	writeln('FATTO(', delta, 'ms)');
	vet:=vet_backup;

	write('Ordinamento tramite Bubble Sort...');
	prima:=Now();
	bubblesort(vet, dmax);
	delta:=MilliSecondsBetween(prima, Now());
	writeln('FATTO(', delta, 'ms)');
	vet:=vet_backup;

	write('Ordinamento tramite Quick Sort...');
	prima:=Now();
	quicksort(vet, 0, dmax);
	delta:=MilliSecondsBetween(prima, Now());
	writeln('FATTO(', delta, 'ms)');
	vet:=vet_backup;
end.
