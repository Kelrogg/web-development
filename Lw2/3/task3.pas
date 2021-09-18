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
  WRITE('Hello dear, ');
  Query := GetEnv('QUERY_STRING');
  IF Query <> ''
  THEN
    BEGIN
      Position := POS('name', Query);
      IF (Position <> 0)
      THEN
        WRITE(COPY(Query, Position + IgnoreLength, Length(Query) - IgnoreLength))      
    END;
  IF (Query = '') OR (Position + IgnoreLength > Length(Query))
  THEN
    WRITELN('Anonymous')                                                                      
END.
