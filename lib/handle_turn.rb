require 'screen_renderer'
require 'get_response_to_guess'

class HandleTurn

  def initialize(screen_renderer, guess_validator, game_state, character_input)
    @screen_renderer = screen_renderer
    @guess_validator = guess_validator
    @game_state = game_state
    @character_input = character_input
  end

  def call

    guess_response = GetResponseToGuess.new(@guess_validator, @character_input, @game_state).call

    @game_state.add_guess(@character_input, guess_response) if is_valid_response(guess_response)

    @screen_renderer.render_to_screen(@game_state, @character_input, guess_response)

  end

  private

  def is_valid_response(guess_response)
    [:hit, :miss].include?(guess_response)
  end
end