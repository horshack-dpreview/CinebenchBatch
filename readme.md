# CinebenchBatch
Windows batch file for running Cinenbech multiple times and collecting/displaying the results. 

## Installation
Download the batch file by right-clicking [here](https://raw.githubusercontent.com/horshack-dpreview/CinebenchBatch/main/CinebenchBatch.cmd). Edit the `CinebenchBatch` at the top of the script so that it points to where you've placed the Cinebench executable. Example:

` set CinebenchPath="c:\miscprogs\CinebenchR23\Cinebench.exe"`

## Sample Output
	C:\>CinebenchBatch 3
	
	Cinebench Run #1 of 3...
	Cinebench Run #2 of 3...
	Cinebench Run #3 of 3...
	
	Cinebench results:
	------------------
	CB 6258.00 (0.00)
	CB 6351.49 (0.00)
	CB 6334.17 (0.00)

## Command Line Options
    <runcount>    - Number of times to run Cinebench.

## Output
    cinebench_output.txt - Full STDOUT from Cinebench runs
    cinebench_results.txt - Extracted single/multi-core results
    
## Batch Options
By default the batch file runs only the multi-core test. To run the single-core test set the `g_CinebenchCpu1Test=true`.

