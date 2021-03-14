echo off
set /p fileName="Enter file name: "
set /p wrotename="Enter your name: "
for /r %%k in (*exe) do ren %%k %fileName%.cgi
start "" http://localhost:4001/cgi-bin/3/%fileName%.cgi?name=%wrotename%