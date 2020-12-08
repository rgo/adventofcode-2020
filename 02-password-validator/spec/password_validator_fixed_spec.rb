# frozen_string_literal: true

require 'spec_helper'
require './password_validator_fixed'

# Exercise 2
RSpec.describe PasswordValidatorFixed do
  let(:valid_password) { '1-3 a: abcde' }

  let(:invalid_passwords) do
    [
      '1-3 b: cdefg',
      '2-9 c: ccccccccc'
    ]
  end
  it 'detect number of valid passwords' do
    expect(PasswordValidatorFixed.validate(valid_password).size).to eq 1
    expect(PasswordValidatorFixed.validate(invalid_passwords).size).to eq 0
  end
end
