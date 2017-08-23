require 'screen_renderer'
require 'guess_response_factory'

class TurnHandler

  def initialize(guess_response_factory, screen_renderer)
    @screen_renderer = screen_renderer
    @guess_response_factory = guess_response_factory
  end

  def handle_turn(game_state, character_input) # TODO dreadful name
    guess_response = @guess_response_factory.get_response_to_guess(character_input, game_state)

    game_state.add_guess_if_guess_is_valid(character_input, guess_response)

    @screen_renderer.render_to_screen(game_state, character_input, guess_response)

  end
end