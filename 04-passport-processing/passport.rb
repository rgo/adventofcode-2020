# frozen_string_literal: true

class Passport
  VALID_KEYS = %w[byr iyr eyr hgt hcl ecl pid cid].freeze
  REQUIRED_KEYS = %w[byr iyr eyr hgt hcl ecl pid].freeze

  def initialize(input)
    hashed_input = parse(input)
    hashed_input.each do |k, v|
      instance_variable_set("@#{k}", v) if VALID_KEYS.include? k
      # self.class.send(:attr_reader, k)
    end
  end

  def valid?
    REQUIRED_KEYS.all? do |k|
      !instance_variable_get("@#{k}").nil?
    end
  end

  private

  def parse(input)
    hash = {}
    input.each_line do |line|
      hash.merge!(line.chomp.scan(/(\w{3}):([^ ]+)/).to_h)
    end
    hash
  end
end
