autocompile
===========

A quick way to monitor a folder for modification and recompile contents within using just a shellscript

## How to use

`MONITOR` holds an egrep pattern to match files to be monitored

`MONITOR_EXCLUDE` holds an egrep pattern to match files not to be monitored

`APPLICATION` holds the name of the binary that's to be started after a rebuild

Rebuild is currently triggered as `make clean && make all`
