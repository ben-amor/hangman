class GetResponseToGuess
  def initialize(guess_validator, character_input, game_state)
    @guess_validator = guess_validator
    @character_input = character_input
    @game_state = game_state
  end

  def call()
    case
      when !@guess_validator.is_valid_input(@character_input)
        :invalid_input
      when @game_state.characters_guessed.include?(@character_input)
        :already_guessed
      when @game_state.current_word.downcase.include?(@character_input.downcase)
        :hit
      else
        :miss
    end

  end

end