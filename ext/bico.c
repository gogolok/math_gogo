#include <math.h>

#include "factorial_ln.h"

#include "bico.h"

float bico(int n, int k)
{
  return floor( 0.5 + exp(factorial_ln(n) - factorial_ln(k) - factorial_ln(n-k)) );
}
