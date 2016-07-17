#!/bin/bash

TITLE="TEST"
PETSC_DIR=/software/petsc/petsc-3.6.3
PETSC_ARCH=arch-icc-opt
CPUSIZE=20
EXE=./bin/run

case $1 in
    nohup )
	nohup $PETSC_DIR/bin/petscmpiexec -n $CPUSIZE $EXE -title $TITLE > $TITLE.log 2>&1 &
	echo $TITLE.log "is created." ;;
    * )
	$PETSC_DIR/bin/petscmpiexec -n $CPUSIZE $EXE -title $TITLE ;;
esac

exit $?
