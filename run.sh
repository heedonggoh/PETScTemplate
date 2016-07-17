#!/bin/bash

TITLE="TEST"
CPUSIZE=20

PETSC_DIR=/software/petsc/petsc-3.6.3
PETSC_ARCH=arch-icc-opt

MPIEXE=$PETSC_DIR/bin/petscmpiexec
EXE=./bin/run

case $1 in
    nohup )
	nohup $MPIEXE -n $CPUSIZE $EXE -title $TITLE > $TITLE.log 2>&1 &
	echo $TITLE.log "is created." ;;
    * )
	$MPIEXE -n $CPUSIZE $EXE -title $TITLE ;;
esac

exit $?
