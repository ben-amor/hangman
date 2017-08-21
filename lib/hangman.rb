require "hangman/version"
require 'game'
require 'user_input'
require 'screen_renderer'

module Hangman
  game = Game.new(UserInput.new, ScreenRenderer.new)
  game.run
end
