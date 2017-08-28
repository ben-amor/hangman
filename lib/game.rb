require 'flow_of_control_constants'
require 'game_state'
require 'handle_turn'

class Game

  def initialize(user_input, screen_renderer, word_factory, guess_validator)
    @user_input = user_input
    @game_state = GameState.new(word_factory.get_word)
    @screen_renderer = screen_renderer
    @word_factory = word_factory
    @guess_validator = guess_validator
  end

  NEW_GAME = '1'.freeze
  QUIT = '2'.freeze

  def run

    @screen_renderer.render_to_screen(@game_state, '', nil)

    loop do
      character_input = @user_input.get_input_from_user

      break if user_wants_to_quit(character_input)
      reset_game_state if user_wants_a_new_game(character_input)

      HandleTurn.new(@screen_renderer, @guess_validator, @game_state, character_input).call()
    end

  end

  def reset_game_state
    @game_state = GameState.new(@word_factory.get_word)
  end

  def user_wants_to_quit(character_input)
    character_input == QUIT
  end

  def user_wants_a_new_game(character_input)
    character_input == NEW_GAME
  end
end