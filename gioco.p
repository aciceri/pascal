program iterazione_precondizionale;
uses crt;
var x,y: integer;
    a: char;
begin
    clrscr;
    cursoroff;
    textcolor(red);
    x:=5;
    y:=5;
    while 1=1 do
    begin
        repeat
        until keypressed;
	a:=readkey;
        case a of
	    '9': begin x:=x+1; y:=y-1; end;
            '8': y:=y-1;
	    '7': begin x:=x-1; y:=y-1; end;
            '6': x:=x+1;
	    '3': begin x:=x+1; y:=y+1; end;
            '4': x:=x-1;
	    '1': begin x:=x-1; y:=y+1; end;
            '2': y:=y+1;
        end;
        gotoXY(x, y);
        write('#');
        delay(10);
    end;
end.

