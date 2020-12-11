# frozen_string_literal: true

require 'spec_helper'
require './custom_declaration'

RSpec.describe CustomDeclaration do
  it 'counts questions for a group' do
    input = <<~EOD
      abcx
      abcy
      abcz
    EOD

    custom = CustomDeclaration.new(input)

    expect(custom.count_questions).to eq 6
  end
end
