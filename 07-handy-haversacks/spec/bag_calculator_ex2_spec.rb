# frozen_string_literal: true
require 'spec_helper'
require './bag_calculator_ex2'

RSpec.describe BagCalculator do
  let(:my_bag) { 'shiny gold' }
  let(:input) {
    <<~EOD
      shiny gold bags contain 2 dark red bags.
      dark red bags contain 2 dark orange bags.
      dark orange bags contain 2 dark yellow bags.
      dark yellow bags contain 2 dark green bags.
      dark green bags contain 2 dark blue bags.
      dark blue bags contain 2 dark violet bags.
      dark violet bags contain no other bags.
    EOD
  }

  let(:input_simple) {
    <<~EOD
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    EOD
  }

  it 'count number of bags required' do
    bag_calculator = BagCalculator.new(rules: input, bag_color: my_bag)

    expect(bag_calculator.count_required_bags).to eq 126
  end

  it 'count number of bags required simple sample' do
    bag_calculator = BagCalculator.new(rules: input_simple, bag_color: my_bag)

    expect(bag_calculator.count_required_bags).to eq 32
  end
end
