
class GuessHandler
  def initialize(guess_response_factory, completeness_calculator)

    @guess_response_factory = guess_response_factory
    @completeness_calculator = completeness_calculator
  end

  def apply_guess_to_game_state(character_input, game_state)

    guess_response = @guess_response_factory.get_response_to_guess(character_input, game_state)

    game_state.most_recent_response_type = guess_response.response_type

    if guess_response.cost_a_life
      game_state.lives_remaining = game_state.lives_remaining - 1
    end

    if guess_response.is_valid
      game_state.characters_guessed << character_input
    end
    
    game_state.game_status = @completeness_calculator.calculate_game_status(game_state)

  end

end