start C:\server2go\Server2Go
echo off
set /p fileName="Enter file name: "
for /r %%k in (*exe) do ren %%k %fileName%.cgi
start "" http://localhost:4001/cgi-bin/Lw2/1/%fileName%.cgi?name=ęCopyright