#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Program name: disttest
// Author: Robert Sinkovits
//

// For set of random points in unit square, determine number of pairs
// separated by less than a specified distance. Program accepts two
// command line arguments

// n    number of points
// del  cutoff distance for interacting points

int main(int argc, char **argv) {

  struct timeval tv_start, tv_end;
  int i, j, n, count=0;
  double *x, *y, elapsed, r2, del;

  if(argc < 3) {
    printf("Program requires two command line arguments\n");
    printf("n     number of points\n");
    printf("del   cutoff distance for interacting points\n");
    exit(0);
  }

  n   = atoi(argv[1]);
  del = atof(argv[2]);


  x = (double *) malloc(sizeof(double) * n);
  y = (double *) malloc(sizeof(double) * n);

  srand48(1);
  for (i=0; i<n; i++) {
    x[i] = drand48();
    y[i] = drand48();
  }

  gettimeofday(&tv_start, NULL);
  for (i=0; i<n-1; i++) {
    for (j=i+1; j<n; j++) {
      r2 = (x[i]-x[j])*(x[i]-x[j]) + (y[i]-y[j])*(y[i]-y[j]);
      if (sqrt(r2) < del) {
	count++;
      }
    }
  }
  gettimeofday(&tv_end, NULL);
  elapsed = (tv_end.tv_sec - tv_start.tv_sec) +
    (tv_end.tv_usec - tv_start.tv_usec) / 1000000.0;

  printf("n     = %d\n", n);
  printf("del   = %f\n", del);
  printf("Count = %d\n", count);
  printf("Time  = %f\n", elapsed);

}
