PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Query, Value: STRING;
  KeyBegin, Sep, ValueBegin: INTEGER;
BEGIN {GetQueryStringParameter}
  Query := GetEnv('QUERY_STRING');
  KeyBegin := POS(Key, Query);
  
  IF KeyBegin <> 0
  THEN
    BEGIN
      ValueBegin := LENGTH(Key) + 2;
      DELETE(Query, 0, KeyBegin);
      Sep := POS('&', Query);

      
      IF Sep <> 0
      THEN
          Value := COPY(Query, ValueBegin, Sep - ValueBegin)
      ELSE
          Value := COPY(Query, ValueBegin, LENGTH(Query))
    END
  ELSE
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
