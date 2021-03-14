echo off
set /p fileName="Enter file name: "
for /r %%i in (*.cgi) do del %%i
for /r %%k in (*exe) do ren %%k %fileName%.cgi
start "" http://localhost:4001/cgi-bin/%fileName%.cgi?name