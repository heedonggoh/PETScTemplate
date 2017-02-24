#include <unistd.h>
#include <sys/types.h>
#include "macros.h"
#include "variables.h"

static char help[] = 
"\n--------------------------------------------------------------------------\n\
 A template for PETSc by Heedong Goh <wellposed@gmail.com> \n\
--------------------------------------------------------------------------\n";

ecode GetProcInfo();

#undef __FUNCT__
#define __FUNCT__ "main"
int main(int argc, char **args)
{
  ierr = PetscInitialize(&argc,&args,(char*)0,help); CHKERRQ(ierr);
  ierr = GetProcInfo();                              CHKERRQ(ierr);
  ierr = PetscFinalize();                            CHKERRQ(ierr);
  return 0;
}

ecode GetProcInfo()
{
  ierr = MPI_Comm_size(PETSC_COMM_WORLD,&cpuSize);                           CHKERRQ(ierr);
  ierr = MPI_Comm_rank(PETSC_COMM_WORLD,&cpuRank);                           CHKERRQ(ierr);
  ierr = wprintf("\n" BLUE "cpu size = %ld" RESET "\n",cpuSize);             CHKERRQ(ierr);
  ierr = syprintf(BLUE "cpu %d:\tpid = %ld, ppid = %ld" RESET "\n",
		  cpuRank,(long)getpid(),(long)getppid());                   CHKERRQ(ierr); 
  ierr = sypflush();                                                         CHKERRQ(ierr); 
  ierr = PetscOptionsGetString(NULL,NULL,"-title",title,sizeof(title),&flg); CHKERRQ(ierr); 
  if(!flg) strcat(title,"noname");
  ierr = wprintf("\n" BOLD "title:\t%s" RESET "\n",title);                   CHKERRQ(ierr);
  return 0;
}
