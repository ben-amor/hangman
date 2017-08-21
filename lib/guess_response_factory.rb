require 'guess_response'

class GuessResponseFactory
  def initialize(guess_validator)
    @guess_validator = guess_validator
  end

  def get_response_to_guess(character_input, game_state)
    case
      when !@guess_validator.is_valid_input(character_input)
        GuessResponse.new(GuessResponse::INVALID_INPUT, false, false)
      when game_state.characters_guessed.include?(character_input)
        GuessResponse.new(GuessResponse::ALREADY_GUESSED, false, false)
      when game_state.current_word.downcase.include?(character_input.downcase)
        GuessResponse.new(GuessResponse::HIT, true, false)
      else
        GuessResponse.new(GuessResponse::MISS, true, true)
    end

  end

end