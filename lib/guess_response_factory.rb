require 'guess_response'

class GuessHandler
  def initialize(guess_validator)
    @guess_validator = guess_validator
  end

  def get_response_to_guess(character_input, game_state)
    case
      when !@guess_validator.is_valid_input(character_input)
        GuessResponse.new("'#{character_input}' is not a valid guess. You can only guess single alphabetic characters", false, false)
      when game_state.characters_guessed.include?(character_input)
        GuessResponse.new("You've already guessed '#{character_input}'", false, false)
      when game_state.current_word.downcase.include?(character_input.downcase)
        GuessResponse.new("'#{character_input}' appears in the word", false, true)
      else
        GuessResponse.new("'#{character_input}' doesn't appear in the word", true, true)
    end

  end
end