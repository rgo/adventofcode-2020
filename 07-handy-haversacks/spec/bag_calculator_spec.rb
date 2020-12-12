# frozen_string_literal: true
require 'spec_helper'
require './bag_calculator'

RSpec.describe BagCalculator do
  let(:my_bag) { 'shiny gold' }
  let(:input_direct) {
    <<~EOD
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
    EOD
  }
  let(:input_full) {
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
  it 'count direct bags' do
    bag_calculator = BagCalculator.new(rules: input_direct, bag_color: my_bag)

    expect(bag_calculator.combinations_count).to eq 2
  end

  it 'count direct+indirect bags' do
    bag_calculator = BagCalculator.new(rules: input_full, bag_color: my_bag)

    expect(bag_calculator.combinations_count).to eq 4
  end
end
