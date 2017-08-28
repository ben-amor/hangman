
class GameState

  def initialize(current_word)
    @current_word = current_word
    @characters_guessed = Array.new
  end

  def add_guess(character_guessed)
    characters_guessed << character_guessed
  end

  def lives_remaining
    STARTING_NUMBER_OF_LIVES - (characters_guessed-current_word.chars.uniq).size
  end

  def game_status
    case
      when lives_remaining == 0
        :lost
      when (current_word.chars - characters_guessed).empty?
        :won
      else
        :in_progress
    end
  end

  attr_reader :current_word, :characters_guessed

  private

  STARTING_NUMBER_OF_LIVES = 10
end