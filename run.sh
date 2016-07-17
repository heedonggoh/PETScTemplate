#!/bin/bash
#########################################################################
## Sample input file by Heedong Goh <wellposed@gmail.com>              ##
#########################################################################
## PROGRAM AND ITS ARGUMENTS
EXE=./bin/run
CPUSIZE=20
TITLE=TEST
## PETSC ARGUMENTS
PETSC_DIR=/software/petsc/petsc-3.6.3
PETSC_ARCH=arch-icc-opt
MPIEXE=$PETSC_DIR/bin/petscmpiexec
## DO NOT CHANGE ########################################################
case $1 in
    nohup )
	nohup $MPIEXE -n $CPUSIZE $EXE -title $TITLE > $TITLE.log 2>&1 &
	echo $TITLE.log "is created." ;;
    * )
	$MPIEXE -n $CPUSIZE $EXE -title $TITLE ;;
esac
exit $?
#########################################################################