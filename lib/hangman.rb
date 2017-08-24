require "hangman/version"
require 'game'
require 'user_input'
require 'screen_renderer'
require 'word_factory'
require 'guess_validator'


module Hangman
  game = Game.new(UserInput.new,
                  ScreenRenderer.new,
                  WordFactory.new,
                  GuessValidator.new)
  game.run
end
