# frozen_string_literal: true

class CustomDeclaration
  def initialize(input)
    @answers = input.delete("\n")
  end

  def count_questions
    @answers.chars.uniq.size
  end
end
