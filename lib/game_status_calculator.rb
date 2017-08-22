
class GameStatusCalculator
  def calculate_game_status(game_state) # TODO move into game_state

    case
      when game_state.lives_remaining == 0
        GameState::LOST
      when (game_state.current_word.chars - game_state.characters_guessed).empty?
        GameState::WON
      else
        :in_progress
    end

  end
end