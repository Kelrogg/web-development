PROGRAM SarahRevere(INPUT, OUTPUT);
USES 
  DOS;
Const IgnoreLength = 5;
VAR
  Position: INTEGER;
  Query: STRING;
BEGIN {SarahRevere}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('Hello dear,');
  Query := GetEnv('QUERY_STRING');
  IF Query <> ''
  THEN
    BEGIN
      Position := POS('name', Query);
      IF Position <> 0
      THEN
        WRITELN(COPY(Query, Position + IgnoreLength, Length(Query) - IgnoreLength))   // смещаем позицию вперёд, дабы            
      ELSE                                                          // пропустить name=
        WRITELN('Anonymous')                                        // тогда и число символов нужно корректировать
    END
  ELSE
    WRITELN('Anonymous')
END.
