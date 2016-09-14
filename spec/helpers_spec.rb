require 'spec_helper'
require './helpers'

describe 'above_given' do
  let(:helper_wrapper) { Class.new { include Helpers } }
  let(:val_list) { [1, 5, 2, 1, 10] }

  it 'should count members greater than n' do
    results_a = helper_wrapper.new.above_below_given(val_list, 5)

    expect(results_a).to include(:above => 1, :below => 3)
  end

  it 'should count members lower than n' do

  end

  it 'should handle nil array' do

  end

  it 'should handle empty array' do

  end

end