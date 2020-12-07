# frozen_string_literal: true

require 'spec_helper'
require './expense_report'

RSpec.describe ExpenseReport do
  let(:input) { [1721, 979, 366, 299, 675, 1456] }
  let(:expense_report) { ExpenseReport.new(input) }

  context 'two entries wrong' do
    it 'finds two entries that their sum is 2020' do
      factors = expense_report.find_wrong_entries

      expect(factors.max).to eq 1721
      expect(factors.min).to eq 299
    end

    it 'calculate right value' do
      expect(expense_report.calculate).to eq 514_579
    end
  end
end
