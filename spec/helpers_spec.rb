require 'spec_helper'
require './helpers'

describe 'above_given' do
  let(:helper_wrapper) { Class.new { include Helpers } }
  let(:val_list) { [1, 5, 2, 1, 10] }

  it 'should count members greater and lower than n' do
    results_a = helper_wrapper.new.above_below_given(val_list, 5)
    expect(results_a).to include(:above => 1, :below => 3)

    results_b = helper_wrapper.new.above_below_given(val_list, 3)
    expect(results_b).to include(:above => 2, :below => 3)

    results_c = helper_wrapper.new.above_below_given(val_list, 11)
    expect(results_c).to include(:above => 0, :below => 5)

    results_d = helper_wrapper.new.above_below_given(val_list, 0)
    expect(results_d).to include(:above => 5, :below => 0)

    results_e = helper_wrapper.new.above_below_given(val_list, -8)
    expect(results_e).to include(:above => 5, :below => 0)
  end

  it 'should handle nil array' do
    results_a = helper_wrapper.new.above_below_given(nil, 5)
    expect(results_a).to include(:above => 0, :below => 0)
  end

  it 'should handle empty array' do
    results_a = helper_wrapper.new.above_below_given([], 5)
    expect(results_a).to include(:above => 0, :below => 0)
  end

end