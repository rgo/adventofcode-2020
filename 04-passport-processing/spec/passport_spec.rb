# frozen_string_literal: true

require 'spec_helper'
require './passport'

RSpec.describe Passport do
  let(:valid_passport) {
    <<~EOS
      ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm
    EOS
  }
  let(:invalid_passport) {
    <<~EOS
      iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929
    EOS
  }

  let(:valid_passport_optional) {
    <<~EOS
      hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm
    EOS
  }
  let(:invalid_passport_optional) {
    <<~EOS
      hcl:#cfa07d eyr:2025 pid:166559648
      iyr:2011 ecl:brn hgt:59in
    EOS
  }

  it 'detect valid passport with all the fields' do
    passport = Passport.new(valid_passport)

    expect(passport.valid?).to be_truthy
  end

  it 'detect valid passport with all required fields but not the optional' do
    passport = Passport.new(valid_passport_optional)

    expect(passport.valid?).to be_truthy
  end

  it 'detect invalid passport' do
    passport = Passport.new(invalid_passport)

    expect(passport.valid?).to be_falsy
  end

  it 'detect invalid passport without optional' do
    passport = Passport.new(invalid_passport_optional)

    expect(passport.valid?).to be_falsy
  end
end
