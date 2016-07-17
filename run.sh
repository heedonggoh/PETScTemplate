export PETSC_DIR=/software/petsc/petsc-3.6.3
export PETSC_ARCH=arch-icc-opt

cd ./bin/

/software/petsc/petsc-3.6.3/bin/petscmpiexec -n 5 ./run 
