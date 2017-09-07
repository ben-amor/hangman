require 'spec_helper'
require 'get_response_to_guess'
require 'game_state'
require 'guess_validator'

RSpec.describe GetResponseToGuess do
  let(:guess_validator) { instance_double(GuessValidator, is_valid_input: is_valid_input) }
  let(:mock_game_state) { instance_double(GameState, characters_guessed: characters_guessed, current_word: 'Lorem') }
  let(:characters_guessed) { [] }

  let(:response_symbol) { get_response_to_guess.call }

  subject(:get_response_to_guess) { described_class.new(guess_validator, character_input, mock_game_state) }

  context 'when the input is invalid' do
    let(:is_valid_input) { false }
    let(:character_input) { '' }

    it 'indicates that the guess is invalid' do
      expect(response_symbol).to eq(:invalid_input)
    end
  end

  context 'when the game state already contains the guess' do
    let(:is_valid_input) { true }
    let(:character_input) { 'x' }
    let(:characters_guessed) { ['x'] }

    it 'indicates that the guess has already been guessed' do
      expect(response_symbol).to eq(:already_guessed)
    end
  end

  context 'when the input character is present in the word' do
    let(:is_valid_input) { true }
    let(:character_input) { 'o' }

    it 'indicates that the guess is succesful' do
      expect(response_symbol).to eq(:hit)
    end
  end

  context 'when the upper case variant of the input character is present in the word' do
    let(:is_valid_input) { true }
    let(:character_input) { 'l' }

    it 'indicates that the guess is succesful' do
      expect(response_symbol).to eq(:hit)
    end
  end

  context 'when the input character is not in the word' do
    let(:is_valid_input) { true }
    let(:characters_guessed) { ['x'] }
    let(:character_input) { 'y' }

    it 'indicates that the character was not present' do
      expect(response_symbol).to eq(:miss)
    end
  end
end
