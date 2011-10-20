require 'abstract_unit'                                                                                              
                                                                                                                     
class MathGogoTest < Test::Unit::TestCase #:nodoc:                                                                  
                                                                                                                     
  # factorial only defined for non-negative integer
  def test_factorial_negative_integer
    assert_raise RangeError do
      Math.factorial_c_gogo(-1)
    end
  end

  def test_factorial_out_of_range_integer
    assert_raise RangeError do
      Math.factorial_c_gogo(Math::MAX_FACTORIAL_CACHED_VALUES_INDEX+1)
    end
  end

  def test_nchoosek_gogo_range
    assert_raise RangeError do
      Math.nchoosek_c_gogo(Math::MAX_FACTORIAL_CACHED_VALUES_INDEX + 1, 0)
    end

    assert_equal 1.0, Math.nchoosek_c_gogo(1,2)

    assert_equal 1.0, Math.nchoosek_c_gogo(-1,0)

    assert_equal 0.0, Math.nchoosek_c_gogo(1,-1)
  end

  def test_nchoosek_gogo_range
    assert_raise RangeError do
      Math.nchoosek_c_nr(Math::MAX_NR_N_VALUE + 1, 0)
    end

    assert_equal 1.0, Math.nchoosek_c_nr(1,2)

    assert_equal 1.0, Math.nchoosek_c_nr(-1,0)

    assert_equal 0.0, Math.nchoosek_c_nr(1,-1)
  end


end
