class GuessResponseFactory
  def initialize(guess_validator)
    @guess_validator = guess_validator
  end

  def get_response_to_guess(character_input, game_state)
    case
      when !@guess_validator.is_valid_input(character_input)
        :invalid_input
      when game_state.characters_guessed.include?(character_input)
        :already_guessed
      when game_state.current_word.downcase.include?(character_input.downcase)
        :hit
      else
        :miss
    end

  end

end