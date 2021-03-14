PROGRAM SarahRevere(INPUT, OUTPUT);
USES 
  DOS;
VAR
  GetQueryString: STRING;
BEGIN {SarahRevere}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  GetQueryString := GetEnv('QUERY_STRING');
  IF GetQueryString = '1'
  THEN
    WRITELN('The British are coming by land.')
  ELSE
    IF GetQueryString = '2'
    THEN
      WRITELN('The British are coming by sea.')
    ELSE
      WRITELN('Sarah didn''t say.')
END. {SarahRevere}
