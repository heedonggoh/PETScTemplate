#!/bin/bash
#########################################################################
## Sample input file by Heedong Goh <wellposed@gmail.com>              ##
#########################################################################
## USER PROGRAM AND ITS ARGUMENTS
EXE=./bin/run
CPUSIZE=20
TITLE=test
ARG="-title $TITLE -log_summary $TITLE.log"
## PETSC AND MPIEXE PATHS
export PETSC_DIR=/software/petsc/petsc-3.6.3
export PETSC_ARCH=arch-icc-opt
export MPIEXE=$PETSC_DIR/bin/petscmpiexec
## DO NOT CHANGE ########################################################
case $1 in
    nohup )
	nohup $MPIEXE -n $CPUSIZE $EXE $ARG > $TITLE.out 2>&1 &
	echo $TITLE.out "is created." ;;
    * )
	$MPIEXE -n $CPUSIZE $EXE $ARG ;;
esac
exit $?
#########################################################################
