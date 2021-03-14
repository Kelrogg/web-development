PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;  
  WRITELN('Query String: ', GetEnv('QUERY_STRING'));
  WRITELN('Request Method: ', GetEnv('REQUEST_METHOD'));
  WRITELN('Content LENGTH: ', GetEnv('CONTENT_LENGTH'));
  WRITELN('Http user agent: ', GetEnv('HTTP_USER_AGENT'));
  WRITELN('Http Host: ', GetEnv('HTTP_HOST'))
END. {WorkWithQueryString}
