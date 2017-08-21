
class GuessHandler
  def initialize(guess_response_factory, word_factory)

    @guess_response_factory = guess_response_factory
    @word_factory = word_factory
  end

  def apply_guess_to_game_state(character_input, game_state)

    if character_input == Constants::QUIT
      game_state.game_status = GamesStatus::LOST
    end

    if character_input == Constants::NEW_GAME
      game_state = GameState.new(@word_factory.get_word)
    end


  end

end