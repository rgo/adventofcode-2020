# frozen_string_literal: true

class BagCalculator
  def initialize(rules:, bag_color:)
    @rules = {}
    parse_rules(rules)
    @bag_color = bag_color
  end

  def combinations_count
    containers = [@bag_color]
    combinations = []

    until containers.empty?
      container = containers.shift
      @rules.each do |rule, bags|
        if bags.any? { |bag| bag.match(container) } && !combinations.include?(rule)
          containers << rule
          combinations << rule
        end
      end
    end

    combinations.size
  end

  private

  def parse_rules(rules)
    rules.split("\n").each do |rule|
      parsed_rule = rule.match(/(?<bag>^\w+ \w+) bags contain (?<inner_bags>no other bags|.+?[.])/)
      @rules[parsed_rule[:bag]] = parse_inner_bags(parsed_rule[:inner_bags])
    end
  end

  def parse_inner_bags(bags)
    bags.split(',').map { |bag| bag.gsub(/bags?/, '').delete('.').strip }
  end
end
