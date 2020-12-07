require './expense_report'
require 'open-uri'

input = URI.open('expenses.txt').read.split

er = ExpenseReport.new(input)
puts "Two entries wrong: #{er.calculate(2)}"
puts "Three entries wrong: #{er.calculate(3)}"
