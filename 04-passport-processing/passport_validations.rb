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
      v = instance_variable_get("@#{k}")
      !v.nil? && send("#{k}_valid?".to_sym, v)
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

  def byr_valid?(value)
    v = value.to_i
    v >= 1920 && v <= 2002
  end

  def iyr_valid?(value)
    v = value.to_i
    v >= 2010 && v <= 2020
  end

  def eyr_valid?(value)
    v = value.to_i
    v >= 2020 && v <= 2030
  end

  def hgt_valid?(value)
    /1([5-8]\d|9[0-3])cm|(59|6\d|7[0-6])in/.match? value
  end

  def hcl_valid?(value)
    /^#[a-fA-F0-9]{6}$/.match? value
  end

  def ecl_valid?(value)
    %w[amb blu brn gry grn hzl oth].include? value
  end

  def pid_valid?(value)
    value.size == 9
  end

  def cid_valid?(_value)
    true
  end
end
