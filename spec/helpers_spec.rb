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

describe 'get_flattened_array' do
  let(:helper_wrapper) { Class.new { include Helpers } }
  let(:expected_flattened) { [1,2,3,4] }

  it 'should flatten 1 level deep' do
    result = helper_wrapper.new.get_flattened_array([1,2,3,4])
    expect(result).to match_array(expected_flattened)
  end

  it 'should get flatten 2 levels deep' do
    result = helper_wrapper.new.get_flattened_array([1,[2,3],4])
    expect(result).to match_array(expected_flattened)
  end

  it 'should get flatten many levels deep' do
    result = helper_wrapper.new.get_flattened_array([[1,2,[3]],4])
    expect(result).to match_array(expected_flattened)
  end

  it 'should flatten ludicrously deep' do
    result = helper_wrapper.new.get_flattened_array([[[1],[[2]],[3],4]])
    expect(result).to match_array(expected_flattened)
  end

  it 'should handle nil array' do
    result = helper_wrapper.new.get_flattened_array(nil)
    expect(result).to match_array([])
  end

  it 'should handle empty array' do
    result = helper_wrapper.new.get_flattened_array(nil)
    expect(result).to match_array([])
  end
end