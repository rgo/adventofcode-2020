require './expense_report'
require 'open-uri'

input = URI.open('expenses.txt').read.split

er = ExpenseReport.new(input)
puts er.calculate
