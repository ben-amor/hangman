require "hangman/version"
require 'game'
require 'user_input'
require 'screen_renderer'
require 'word_factory'
require 'guess_handler'
require 'guess_response_factory'
require 'guess_validator'


module Hangman
  word_factory = WordFactory.new
  game = Game.new(UserInput.new,
                  ScreenRenderer.new,
                  GuessHandler.new(
                      GuessResponseFactory.new(
                          GuessValidator.new),
                      word_factory),
                  word_factory)
  game.run
end
