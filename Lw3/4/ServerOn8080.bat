echo off
for /r %%f in (*.php) do set file=%%~nxf
start php -S localhost:8080
start Opera http:/localhost:8080/SurveySaver.php?email=Kim@yandex.ru^&first_name=Kim^&age=90100