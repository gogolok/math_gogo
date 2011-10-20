#include <stdio.h>
#include <stdlib.h>

#include "error_and_exit.h"

void error_and_exit(char error_text[])
{
  fprintf(stderr, "Runtime error!\n"); 
  fprintf(stderr, "%s\n", error_text);
  fprintf(stderr, "Now exiting!\n");
  exit(1);
}
