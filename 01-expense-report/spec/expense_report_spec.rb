# frozen_string_literal: true

require 'spec_helper'
require './expense_report'

RSpec.describe ExpenseReport do
  let(:input) { [1721, 979, 366, 299, 675, 1456] }
  let(:expense_report) { ExpenseReport.new(input) }

  context 'two entries wrong' do
    it 'calculate right value' do
      expect(expense_report.calculate(2)).to eq 514_579
    end
  end

  context 'three entries wrong' do
    it 'calculate right value' do
      expect(expense_report.calculate(3)).to eq 241_861_950
    end
  end
end
