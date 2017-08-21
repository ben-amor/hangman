require 'game_state'
require 'guess_handler'

class Game

    def initialize(user_input, screen_renderer, guess_handler, word_factory)
      @user_input = user_input
      @game_state = GameState.new(word_factory.get_word)
      @screen_renderer = screen_renderer
      @guess_handler = guess_handler
      @word_factory = word_factory
    end

  def run

    @screen_renderer.render_to_screen(@game_state)
    character_input = @user_input.get_input_from_user

    while character_input != Constants::QUIT

      if character_input == Constants::NEW_GAME
        @game_state = GameState.new(@word_factory.get_word)
      end

      @guess_handler.apply_guess_to_game_state(character_input, @game_state)

      @screen_renderer.render_to_screen(@game_state)

      character_input = @user_input.get_input_from_user

    end
  end


end