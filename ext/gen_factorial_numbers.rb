#!/usr/bin/env ruby

require 'math_ruby'

# Generate precalculated values for C header.

MAX_FACTORIAL_CACHED_VALUES_INDEX = 61

result = []
for n in 0..MAX_FACTORIAL_CACHED_VALUES_INDEX
  result << "#{Math.factorial_ruby(n)}.0, /* #{n} */"
end

File.open("math_gogo.h","w+") do |f|

f.puts <<EOF
#ifndef MATH_GOGO_H
#define MATH_GOGO_H

#define MAX_FACTORIAL_CACHED_VALUES_INDEX #{MAX_FACTORIAL_CACHED_VALUES_INDEX}

double factorial_cached_values[] = {
#{result.join("\n")}
};

#endif
EOF

end
