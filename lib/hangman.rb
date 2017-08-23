require "hangman/version"
require 'game'
require 'user_input'
require 'screen_renderer'
require 'word_factory'
require 'guess_response_factory'
require 'guess_validator'
require 'turn_handler'

module Hangman
  game = Game.new(UserInput.new,
                  ScreenRenderer.new,
                  WordFactory.new,
                  TurnHandler.new(GuessResponseFactory.new(GuessValidator.new), ScreenRenderer.new))
  game.run
end
