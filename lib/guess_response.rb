
class GuessResponse

  INVALID_INPUT = 1 # TODO these become symbols
  ALREADY_GUESSED = 2
  HIT = 3
  MISS = 4

  def initialize(response_type, is_valid, cost_a_life)

    @response_type = response_type
    @is_valid = is_valid
    @cost_a_life = cost_a_life # TODO this becomes irrelevant
  end

  @cost_a_life
  @is_valid
  @response_type

  attr_reader :cost_a_life, :is_valid, :response_type
end