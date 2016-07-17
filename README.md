# PETSc template in C
A PETSc template in C

* **Structure**
  - src : a directory contains source files
  - bin : a directory contains binaries
  - run.sh : a bash script executes the program 
  - Makefile : a generic makefile for PETSc
* **Source Files**
  - main.c : main file
  - macros.h : contains common macros
  - variables.h, variables.c : contain global variables
* **Notes**
  - Makefile and run.sh contain paths to PETSC_DIR and PETSC_ARCH.
