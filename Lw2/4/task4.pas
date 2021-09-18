PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Query, Value: STRING;
  KeyBegin, Sep, ValueOffset, Index: INTEGER;
BEGIN {GetQueryStringParameter}
  Query := GetEnv('QUERY_STRING');
  KeyBegin := POS(Key, Query);
  IF KeyBegin <> 0
  THEN
    BEGIN
      Value := '';
      Index := KeyBegin;
      ValueOffset := LENGTH(Key)+1;
      Sep := 0;
      WHILE (Index < Length(Query)) AND (Sep=0)
      DO
        BEGIN
          IF (Query[Index] = '&')
          THEN
            Sep := Index;
          Index := Index + 1
        END;
      IF Sep <> 0
      THEN
          Value := COPY(Query, KeyBegin + ValueOffset, Sep - KeyBegin - ValueOffset);
      IF Sep = 0
      THEN
        Value := COPY(Query, KeyBegin + ValueOffset)
    END;
  IF KeyBegin = 0
  THEN
    Value := 'No!';
  GetQueryStringParameter := Value
END; {GetQueryStringParameter}
BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))  
END. {WorkWithQueryString}
