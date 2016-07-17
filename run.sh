#!/bin/bash

TITLE="TEST"
PETSC_DIR=/software/petsc/petsc-3.6.3
PETSC_ARCH=arch-icc-opt
CPUSIZE=20
EXE=./bin/run

$PETSC_DIR/bin/petscmpiexec -n $CPUSIZE $EXE -title $TITLE
exit $?
