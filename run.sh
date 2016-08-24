#!/bin/bash
#########################################################################
## Sample input file by Heedong Goh <wellposed@gmail.com>              ##
#########################################################################
## USER PROGRAM AND ITS ARGUMENTS
EXE=./bin/run
CPUSIZE=2
TITLE=test
#ARG="-title $TITLE -log_summary $TITLE.log"
ARG="-title $TITLE -log_view :$TITLE.log"
## PETSC AND MPIEXE PATHS
export PETSC_DIR=/opt/petsc/petsc-3.7.3
export PETSC_ARCH=arch-gcc-opt
export MPIEXE=$PETSC_DIR/bin/petscmpiexec
## DO NOT CHANGE ########################################################
case $1 in
    --help )
	echo "Usage: bash run.sh [OPTION]"
	echo " "
	echo "  --nohup   ignore HUP signal"
	echo "  --help    display this help and exit" ;;
    --nohup )
	echo "nohup $MPIEXE -n $CPUSIZE $EXE $ARG > $TITLE.out 2>&1 &"
	nohup $MPIEXE -n $CPUSIZE $EXE $ARG > $TITLE.out 2>&1 &
	echo "$TITLE.out is created." ;;
    * )
	echo "$MPIEXE -n $CPUSIZE $EXE $ARG"
	$MPIEXE -n $CPUSIZE $EXE $ARG ;;
esac
exit $?
#########################################################################
