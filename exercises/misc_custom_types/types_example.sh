#!/bin/bash

echo -e "Compiling"
cd misc_custom_types
rm -rf type_example
mpicxx -o type_example type_example.cpp 2> err_log

rc=$?
if [[ $rc != 0 ]]; then
    echo -e "Error : mpicxx returned"
    cat err_log
    echo "TECHIO> success false"
    rm -rf out
    exit $rc
fi
echo "Compilation is OK"
mkdir out
rc=0

echo -e "Execution ... "

mpirun -mca btl sm,tcp,self -np 2 ./type_example < input
rm -rf out




