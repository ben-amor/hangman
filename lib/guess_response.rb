
class GuessResponse
  def initialize(message, is_valid, cost_a_life)

    @message = message
    @is_valid = is_valid
    @cost_a_life = cost_a_life
  end

  @cost_a_life
  @is_valid
  @message

  attr_reader :cost_a_life, :is_valid, :message
end