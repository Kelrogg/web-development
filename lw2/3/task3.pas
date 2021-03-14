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
        WRITELN(COPY(Query, Position + IgnoreLength, Length(Query) - IgnoreLength))   // ������� ������� �����, ����            
      ELSE                                                          // ���������� name=
        WRITELN('Anonymous')                                        // ����� � ����� �������� ����� ��������������
    END
  ELSE
    WRITELN('Anonymous')
END.
