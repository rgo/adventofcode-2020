# frozen_string_literal: true

require 'spec_helper'
require './custom_declaration'

RSpec.describe CustomDeclaration do
  let(:input1) {
    <<~EOD
      abcx
      abcy
      abcz
    EOD
  }
  let(:input2_simple) { "abc\n" }
  let(:input2_multiline_no) {
    <<~EOD
      a
      b
      c
    EOD
  }
  let(:input2_multiline_yes) {
    <<~EOD
      a
      a
      a
    EOD
  }

  context 'identifying questions where anyone answered yes' do
    it 'counts questions for a group' do
      custom = CustomDeclaration.new(input1)

      expect(custom.count_questions).to eq 6
    end
  end

  context 'identifying questions where everyone answered yes' do
    it 'counts questions in a line' do
      custom = CustomDeclaration.new(input2_simple)

      expect(custom.count_all_yes_questions).to eq 3
    end

    it 'counts questions not everyone yes in multiple lines' do
      custom = CustomDeclaration.new(input2_multiline_no)
      expect(custom.count_all_yes_questions).to eq 0
    end

    it 'counts questions everyone yes in multiple lines' do
      custom = CustomDeclaration.new(input2_multiline_yes)
      expect(custom.count_all_yes_questions).to eq 1
    end
  end
end
