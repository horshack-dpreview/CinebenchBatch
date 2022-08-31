::
:: CinebenchBatch.cd - Batch file for running Cinebench multiple times
:: and printing the results from all runs when complete
::
@echo off

:: set this variable to the location of your Cinenbech executable
set CinebenchPath="c:\miscprogs\CinebenchR23\Cinebench.exe"

:: confirm user specified arun count. print usage and exit if not
if [%1]==[] goto printUsage :: https://stackoverflow.com/a/830566

::
:: start Cinebench execution loop. we generate two files:
::   cinebench_output.txt  - our messages + STDOUT from Cinebench 
::   cinebench_results.txt - Extracted single/multi-core results
::  
set runcount=%1
echo Running Cinebench %runcount% time(s)... > cinebench_output.txt
echo:
for /L %%i IN (1,1,%runcount%) do (

  echo Cinebench Run #%%i of %runcount%...
  echo Cinebench Run #%%i of %runcount%... >> cinebench_output.txt

rem
rem Launch Cinebench. We have to launch it with start and use cmd.exe
rem in order to support redirection of CB's STDOUT
rem
rem g_CinebenchCpu1Test=true to run the single-core test
rem g_CinebenchCpuXTest=true to run the multi-core test
rem g_CinebenchMinimumTestDuration=1 to run each test in non-fixed
rem   time mode, otherwise set to number of seconds for each test
rem

  start /b /wait "CinebenchBatch Window" cmd.exe /C "%CinebenchPath% g_CinebenchCpuXTest=true g_CinebenchCpu1Test=false g_CinebenchMinimumTestDuration=1 >> cinebench_output.txt"
)

::
:: extract results from the output file - each test is
:: prefixed with "CB" - and store them in the results
:: file. we also display extracted results on console
::
echo:
echo Cinebench results: > cinebench_results.txt
echo ------------------ >> cinebench_results.txt
findstr /b "CB" cinebench_output.txt >> cinebench_results.txt
type cinebench_results.txt
exit /B 0

:: display command-line usage
:printUsage:
@echo Usage: %0 ^<run count^>
exit /B 1
