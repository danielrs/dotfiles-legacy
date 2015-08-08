:: Updates each of the plugins
:: See: http://ss64.com/nt/for_d.html

for /D %%s in (.\*) do (cd "%%s" && git pull origin master && cd ..)
