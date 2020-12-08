# frozen_string_literal: true

require 'spec_helper'
require './password_validator'

RSpec.describe PasswordValidator do
  let(:valid_pass) { '1-3 a: abcde' }
  let(:invalid_pass) { '1-3 b: cdefg' }

  it 'detect valid password' do
    expect(PasswordValidator.validate(valid_pass).size).to eq 0
  end

  it 'detect invalid password' do
    expect(PasswordValidator.validate(invalid_pass).size).to eq 1
  end
end
