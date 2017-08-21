require 'game_state'

class Game

  def initialize(user_input, screen_renderer)
    @user_input = user_input
    @game_state = GameState.new
    @screen_renderer = screen_renderer
  end

  def run
    while @game_state.game_status != GameState::WON && @game_state.game_status != GameState::LOST

      @screen_renderer.render_to_screen(@game_state)

      character_input = @user_input.get_input_from_user

    end
  end


end