#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Program name: logsum
// Author: Robert Sinkovits
//
// Illustration of fast method for calculating sum of logarithms 

int main(int argc, char **argv) {

  struct timeval tv_start, tv_end;
  double *z, logsum, elapsed;
  double s, sprod, c=1.358858;
  int i, j, xsum, x, n=500000, m=400; // Alter n and m keeping n*m constant
  FILE *FP1, *FP2;
 
  FP1 = fopen("logsum_slow.txt", "w");
  FP2 = fopen("logsum_fast.txt", "w");

  z = (double *) malloc(sizeof(double) * n);

  // ***** Timing sum over logs - method 1 *****

  // Initialize seed and reset elapsed time
  srand48(123456);
  elapsed = 0.0;
  
  for (j=0; j<m; j++) {
    // Fill array of random numbers
    for (i=0; i<n; i++)
      z[i] = drand48();

    // Time logsum calculation
    gettimeofday(&tv_start, NULL);
    logsum = 0.0;
    for (i=0; i<n; i++)
      logsum += log(z[i]);
    gettimeofday(&tv_end, NULL);
    elapsed += (tv_end.tv_sec - tv_start.tv_sec) +
      (tv_end.tv_usec - tv_start.tv_usec) / 1000000.0;

    // Print to confirm that two methods give same results
    fprintf(FP1, "Sum over logs = %14.5f\n", logsum);
  }
  printf("Run time sum over logs (original)= %f\n", elapsed);



  // ***** Timing sum over logs - method 2 *****

  // Initialize seed and reset elapsed time
  srand48(1);
  elapsed = 0.0;

  for (j=0; j<m; j++) {
    // Fill array of random numbers
    for (i=0; i<n; i++)
      z[i] = drand48();
    
    // Time logsum calculation
    gettimeofday(&tv_start, NULL);
    sprod = 1.0;
    xsum = 0.0;
    for (i=0; i<n; i++) {
      s = frexp(z[i], &x);
      sprod *= (s * c);
      xsum += x;
    }
    logsum = log(sprod) + log(2.0)*xsum - n*log(c);
    gettimeofday(&tv_end, NULL);
    elapsed += (tv_end.tv_sec - tv_start.tv_sec) +
      (tv_end.tv_usec - tv_start.tv_usec) / 1000000.0;

    // Print to confirm that two methods give same results
    fprintf(FP2, "Sum over logs = %14.5f\n", logsum);
  }
  printf("Run time sum over logs (modified) = %f\n", elapsed);

  free(z);  
}
