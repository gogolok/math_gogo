#!/usr/bin/env ruby

$:.unshift(File.dirname(__FILE__) + '/../ext/')

require 'math_gogo'

# iterate over all possible n!
for i in 0..Math::MAX_FACTORIAL_CACHED_VALUES_INDEX do
  printf("%d: %.128f\n", i, Math.factorial_c_gogo(i))
end
