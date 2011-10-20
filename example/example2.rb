#!/usr/bin/env ruby

$:.unshift(File.dirname(__FILE__) + '/../ext/')

require 'math_gogo'

for n in 0..Math::MAX_FACTORIAL_CACHED_VALUES_INDEX do
  for k in 0..n
    STDOUT.puts "n = #{n} k = #{k}: #{Math.nchoosek_c_gogo(n,k)}"
    STDOUT.puts "n = #{n} k = #{k}: #{Math.nchoosek_c_nr(n,k)}"
  end
end
