#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
#include <mkl.h>

// Program name: lineq_top
// Author: Robert Sinkovits
//
//
// Calls DGESV to solve system of linear equations

void solver (int n) {
  int i, lda, ldb, nrhs, info, *ipiv;
  double *a, *b;

  // Get matrix dimension and allocate arrays
  lda = n;
  ldb = n;
  nrhs = 1;
  a    = (double *) malloc(sizeof(double) * n * n);
  b    = (double *) malloc(sizeof(double) * n);
  ipiv = (int *) malloc(sizeof(int) * n);

  // Fill matrix a and vector b with random values
  for (i=0; i<n*n; i++)
    a[i] = drand48();
  for (i=0; i<n; i++)
    b[i] = drand48();
  
  dgesv(&n, &nrhs, a, &lda, ipiv, b, &ldb, &info);

  //  free(a);
  //  free(b);
  //  free(ipiv);

  return;
}


int main(int argc, char **argv) {
  struct timeval tv_start, tv_end;
  double elapsed;
  int i, n;

  n = atoi(argv[1]);
  srand48(1); // Intialize random number generator

  if (n > 75000) {
    printf("Capping problem size at 75000\n");
    n = 75000;
  }

  printf("Times to solve linear sets of equations for n = %d\n", n);

  gettimeofday(&tv_start, NULL);
  for (i=1; i<10; i++) {
    solver(n);
  }
  gettimeofday(&tv_end, NULL);
  
  elapsed = (tv_end.tv_sec - tv_start.tv_sec) +
    (tv_end.tv_usec - tv_start.tv_usec) / 1000000.0;
  
  printf("t = %f\n", elapsed);
}
