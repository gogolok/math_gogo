#include "gammaln.h"

#include "factorial_ln.h"

float factorial_ln(int n)
{
  static float a[101];
  if (n < 0) return error_and_exit("Negative factorial in routine factorial_ln"); 
  if (n <= 1) return 0.0; 
  if (n <= 100) return a[n] ? a[n] : ( a[n] = gammaln(n + 1.0) );
  else return gammaln(n + 1.0);
}
