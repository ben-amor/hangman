require 'game_state'
require 'guess_handler'

class Game

    def initialize(user_input, screen_renderer, guess_handler, word_factory)
      @user_input = user_input
      @game_state = GameState.new(word_factory.get_word)
      @screen_renderer = screen_renderer
      @guess_handler = guess_handler

    end

  def run
    while @game_state.game_status != GameState::WON && @game_state.game_status != GameState::LOST

      @screen_renderer.render_to_screen(@game_state)

      character_input = @user_input.get_input_from_user

      @guess_handler.apply_guess_to_game_state(character_input, @game_state)


    end
  end


end