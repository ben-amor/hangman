
class GameState

  NOT_STARTED = 1
  IN_PROGRESS = 2
  WON = 3
  LOST = 4

  def initialize(current_word)
    @game_status = NOT_STARTED
    @current_word = current_word
  end

  @game_status

  attr_reader :game_status
end