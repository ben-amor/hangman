require 'flow_of_control_constants'
require 'game_state'

class Game

    def initialize(user_input, screen_renderer, word_factory, turn_handler)
      @user_input = user_input
      @game_state = GameState.new(word_factory.get_word)
      @screen_renderer = screen_renderer
      @word_factory = word_factory
      @turn_handler = turn_handler
    end

  def run

    @screen_renderer.render_to_screen(@game_state, '', nil)
    character_input = @user_input.get_input_from_user

    # TODO move flow of control out to a service? Bit of state on the Game class?
    while character_input != FlowOfControlConstants::QUIT

      @game_state = GameState.new(@word_factory.get_word) if character_input == FlowOfControlConstants::NEW_GAME

      @turn_handler.handle_turn(@game_state, character_input)

      character_input = @user_input.get_input_from_user

    end
  end

end