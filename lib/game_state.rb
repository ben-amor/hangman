
class GameState

  IN_PROGRESS = 1
  WON = 2
  LOST = 3

  def initialize(current_word)
    @game_status = IN_PROGRESS
    @current_word = current_word
    @characters_guessed = Array.new
    @lives_remaining = 10
    @most_recent_message = ''
  end


  attr_accessor :game_status, :characters_guessed, :current_word, :lives_remaining, :most_recent_message
end