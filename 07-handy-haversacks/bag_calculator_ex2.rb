# frozen_string_literal: true

class BagCalculator
  def initialize(rules:, bag_color:)
    @rules = {}
    parse_rules(rules)
    @bag_color = bag_color
  end

  def count_required_bags(bag_color = @bag_color)
    return 0 if @rules[bag_color].nil?

    counter = 0

    @rules[bag_color].each do |key, value|
      counter += value + (value * count_required_bags(key))
    end

    counter
  end

  private

  def parse_rules(rules)
    rules.split("\n").each do |rule|
      parsed_rule = rule.match(/(?<bag>^\w+ \w+) bags contain (?<inner_bags>no other bags|.+?[.])/)

      next if parsed_rule[:inner_bags] == 'no other bags'

      @rules[parsed_rule[:bag]] = parse_inner_bags(parsed_rule[:inner_bags])
    end
  end

  def parse_inner_bags(bags)
    bags.split(',').each_with_object({}) do |bag, inner_bag|
      parsed_bag = bag.gsub(/bags?/, '').delete('.').strip.match(/(?<amount>\d+) (?<name>\w+ \w+)/)

      inner_bag[parsed_bag[:name]] = parsed_bag[:amount].to_i
    end
  end
end
