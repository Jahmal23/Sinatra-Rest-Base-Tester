module Helpers

  def above_below_given(arry, n)
    above = 0
    below = 0

    arry.each do |x|
      above += 1 unless x <= n
      below += 1 unless x >= n
    end unless arry.nil?

    {:above => above, :below => below}
  end

  # Flattens an array of arbitrarily nested arrays of integers
  # into a flat array of integers. e.g. [[1,2,[3]],4] -> [1,2,3,4].
  def get_flattened_array(arry)
    flattened = []

    unless arry.nil?
      arry.each do |x|
        # we are explicitly only supporting arrays for now, otherwise we could check for responds to 'each'
        if x.kind_of?(Array)
          # we need to ensure that the previous flattened values are appended to
          # the results of the recursion
          flattened += get_flattened_array(x)
        else
          flattened << x
        end
      end
    end
    flattened
  end
end
