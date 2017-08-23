
class GameState

  def initialize(current_word)
    @current_word = current_word
    @characters_guessed = Array.new
  end

  def add_guess_if_guess_is_valid(character_guessed, guess_response)
    @characters_guessed << character_guessed if guess_response == :hit or guess_response == :miss
  end

  def lives_remaining
    return 10 - (@characters_guessed-@current_word.chars.uniq).size
  end

  def game_status
    case
      when lives_remaining == 0
        :lost
      when (@current_word.chars - @characters_guessed).empty?
        :won
      else
        :in_progress
    end
  end

  attr_reader :current_word, :characters_guessed
end