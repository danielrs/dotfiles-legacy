:: Installs all the plugins
:: See: http://ss64.com/nt/for_d.html

@echo off
setlocal EnableDelayedExpansion

@echo on

for /F "tokens=*" %%line in (plugins.txt) do (
	git clone https://github.com/%%line
)
