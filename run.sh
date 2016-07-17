#!/bin/bash

PETSC_DIR=/software/petsc/petsc-3.6.3
PETSC_ARCH=arch-icc-opt
CPUSIZE=4
EXE=./bin/run

$PETSC_DIR/bin/petscmpiexec -n $CPUSIZE $EXE
exit $?
