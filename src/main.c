#include <unistd.h>
#include <sys/types.h>
#include "macros.h"
#include "variables.h"

static char help[] = 
"\n--------------------------------------------------------------------------\n\
 A template for PETSc by Heedong Goh <wellposed@gmail.com> \n\
--------------------------------------------------------------------------\n";

ecode GetSysInfo();

#undef __FUNCT__
#define __FUNCT__ "main"
int main(int argc, char **args)
{
  ierr = PetscInitialize(&argc,&args,(char*)0,help); CHKERRQ(ierr);
  ierr = GetSysInfo();                               CHKERRQ(ierr);
  ierr = PetscFinalize();                            CHKERRQ(ierr);
  return 0;
}

ecode GetSysInfo()
{
  ierr = MPI_Comm_size(PETSC_COMM_WORLD,&cpuSize);          CHKERRQ(ierr);
  ierr = MPI_Comm_rank(PETSC_COMM_WORLD,&cpuRank);          CHKERRQ(ierr);
  ierr = wprintf("\n" BLUE "pid = %ld, ppid = %ld" RESET "\n",
		  (long)getpid(),(long)getppid());          CHKERRQ(ierr); 
  ierr = wprintf(BLUE "cpu size = %ld" RESET "\n",cpuSize); CHKERRQ(ierr);
  return 0;
}
