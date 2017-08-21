
class GameState

  NOT_STARTED = 1
  IN_PROGRESS = 2
  WON = 3
  LOST = 4

  def initialize
    @game_status = NOT_STARTED
  end

  @game_status

  attr_reader :game_status
end