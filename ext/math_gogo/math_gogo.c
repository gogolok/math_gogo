#include "ruby.h"
#include "math_gogo.h"

#define MAX_NR_N_VALUE 10000

static VALUE factorial_c_gogo(VALUE self, VALUE n)
{
  VALUE ret;

  int i = NUM2INT(n);

  // check boundaries
  if(i < 0 || i > MAX_FACTORIAL_CACHED_VALUES_INDEX)
    rb_raise(rb_eRangeError, "argument out of range");

  ret = rb_float_new( factorial_cached_values[i] );

  return ret;
}

static VALUE nchoosek_c_gogo(VALUE self, VALUE _n, VALUE _k)
{
  VALUE ret;
  double val;

  int n = NUM2INT(_n);
  int k = NUM2INT(_k);

  // check boundaries
  if(n > MAX_FACTORIAL_CACHED_VALUES_INDEX)
    rb_raise(rb_eRangeError, "first argument out of range");

  if(n < 0 || k > n)
    ret = INT2NUM(1);
  else if(k < 0)
    ret = INT2NUM(0);
  else {
    val = factorial_cached_values[n] / (factorial_cached_values[n-k] * factorial_cached_values[k]);
    ret = rb_float_new( val );
  }

  return ret;
}

static VALUE nchoosek_c_nr(VALUE self, VALUE _n, VALUE _k)
{
  VALUE ret;
  float val;

  int n = NUM2INT(_n);
  int k = NUM2INT(_k);

  // check boundaries
  if(n > MAX_NR_N_VALUE)
    rb_raise(rb_eRangeError, "first argument out of range");

  if(n < 0 || k > n)
    ret = INT2NUM(1);
  else if(k < 0)
    ret = INT2NUM(0);
  else {
    val = bico(n,k);
    ret = rb_float_new( val );
  }

  return ret;
}
VALUE rb_mMath;

void Init_math_gogo()
{
  rb_mMath = rb_define_module("Math");
  
  /* factorial */
  rb_define_module_function(rb_mMath, "factorial_c_gogo", factorial_c_gogo, 1);
  rb_define_const(rb_mMath, "MAX_FACTORIAL_CACHED_VALUES_INDEX", INT2NUM(MAX_FACTORIAL_CACHED_VALUES_INDEX));

  /* binomial coefficient */
  rb_define_module_function(rb_mMath, "nchoosek_c_gogo", nchoosek_c_gogo, 2);

  /* binomial coefficient by Numerical Recipes */
  rb_define_module_function(rb_mMath, "nchoosek_c_nr", nchoosek_c_nr, 2);
  rb_define_const(rb_mMath, "MAX_NR_N_VALUE", INT2NUM(MAX_NR_N_VALUE));
}
