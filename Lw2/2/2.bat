echo off
set /p fileName="Enter file name: "
set /p number="Enter message from Sarah:"
for /r %%k in (*exe) do ren %%k %fileName%.cgi
start "" http://localhost:4001/cgi-bin/Lw2/2/%fileName%.cgi?lanterns=%number%