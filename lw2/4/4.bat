echo off
set /p fileName="Enter file name: "
for /r %%k in (*exe) do ren %%k %fileName%.cgi
start "" "http://localhost:4001/cgi-bin/4/%fileName%.cgi?first_name=Kim&last_name=Lin&age=16"