module Math
  
  # Returns factorial of n
  #
  #    Math.factorial_ruby(0)   #=> 1
  #    Math.factorial_ruby(1)   #=> 1
  #    Math.factorial_ruby(2)   #=> 2
  #    Math.factorial_ruby(3)   #=> 6
  #    Math.factorial_ruby(4)   #=> 24
  # 
  # Very slow ruby implementation.
  def Math.factorial_ruby(n)
    return 1 if n == 0
    total = n
    
    while n > 1
      total *= (n - 1)
      n -= 1
    end
  
    return total
  end

  # Returns binomial coefficient n over k
  #
  #    Math.nchoosek_ruby(7,3)   #=> 35.0
  #
  def Math.nchoosek_ruby(n,k)
    if (k < 0 or k > n)
      0.0
    else
      Math.factorial_ruby(n) / ( Math.factorial_ruby(n-k) * Math.factorial_ruby(k)).to_f
    end
  end

end
