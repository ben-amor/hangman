require "hangman/version"
require 'game'
require 'user_input'
require 'screen_renderer'
require 'word_factory'
require 'guess_handler'
require 'guess_response_factory'
require 'guess_validator'
require 'game_status_calculator'

module Hangman
  game = Game.new(UserInput.new,
                  ScreenRenderer.new,
                  GuessHandler.new(
                      GuessResponseFactory.new(
                          GuessValidator.new),
                      GameStatusCalculator.new),
                  WordFactory.new)
  game.run
end
