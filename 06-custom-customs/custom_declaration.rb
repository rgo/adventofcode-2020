# frozen_string_literal: true

class CustomDeclaration
  def initialize(input)
    @answers = input
  end

  def count_questions
    group_everybody_answers.size
  end

  def count_all_yes_questions
    everybody = group_everybody_answers.join

    everybody.chars.inject(0) do |sum, question|
      sum += @answers.split("\n").all? { |line| line.include? question } ? 1 : 0
    end
  end

  private

  def group_everybody_answers
    @answers.delete("\n").chars.uniq
  end
end
