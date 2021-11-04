@echo off
title %~n0 ^| %DATE% %TIME%
setlocal enabledelayedexpansion
for /f usebacktokens^=2delims^=^=0 %%i in (`wmic os get localdatetime -value`) do set dt=%%i
