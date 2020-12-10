# frozen_string_literal: true

class BinBoarding
  ROWS = [0, 127].freeze
  COLUMNS = [0, 7].freeze
  UPPER = %w[B R].freeze
  LOWER = %w[F L].freeze

  def initialize(boarding)
    @boarding = boarding.chars
  end

  def row
    row = @boarding[0..6]
    parser(row, ROWS)[0] + 1
  end

  def column
    column = @boarding[7..9]
    parser(column, COLUMNS)[0] + 1
  end

  def seat_id
    row * 8 + column
  end

  private

  def parser(input, range = ROWS)
    input.inject(range) do |memo, char|
      if UPPER.include? char
        upper(memo)
      else
        lower(memo)
      end
    end
  end

  def upper(value)
    half = value[0] + ((value[1] - value[0]) / 2)
    [half, value[1]]
  end

  def lower(value)
    half = value[0] + ((value[1] - value[0]) / 2)
    [value[0], half]
  end
end
