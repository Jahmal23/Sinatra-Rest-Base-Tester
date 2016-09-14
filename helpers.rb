
module Helpers

  def above_below_given(arry, n)
    above = 0
    below = 0

    arry.each do |x|
      above += 1 unless x <= n
      below += 1 unless x >= n
    end

    {:above => above, :below => below}
  end
end
