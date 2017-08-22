
class GameState

  :in_progress
  WON = 2 # TODO turn these into symbols as per in_progress. Don't declare symbols - just make them up on the fly
  LOST = 3

  def initialize(current_word)
    @game_status = :in_progress # TODO this can all be derived from other properties
    @current_word = current_word
    @characters_guessed = Array.new
    @most_recent_response_type  # TODO this is in the wrong place - not part of the game state in the same way as the other properties of the gamestate
  end

  def add_guess(character_guessed)
    @characters_guessed << character_guessed
  end

  def lives_remaining
    return (@characters_guessed-@current_word.chars.uniq).size
  end

  attr_reader :current_word, :characters_guessed
  attr_accessor :game_status, :most_recent_response_type
end