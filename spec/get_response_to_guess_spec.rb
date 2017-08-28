require 'rspec'
require 'get_response_to_guess'
require 'game_state'
require 'guess_validator'

RSpec.describe GetResponseToGuess do

  let(:guess_validator) { instance_double(GuessValidator, :is_valid_input => is_valid_input) }
  let(:mock_game_state) { instance_double(GameState, :characters_guessed => characters_guessed, :current_word => 'Lorem') }

  let(:response_message){get_response_to_guess.call}

  subject(:get_response_to_guess) { described_class.new(guess_validator, character_input, game_state) }

  context 'when the character is invalid' do
    let(:is_valid_input) { false }
    let(:character_input) { '' }
    let(:game_state) { nil }
    let(:characters_guessed) { [] }

    it 'indicates that the guess is invalid' do
      expect(response_message).to include('not a valid guess.')
    end
  end

  context 'when the game state already contains the guess' do
    let(:is_valid_input) { true }
    let(:character_input) { 'x' }
    let(:game_state) { mock_game_state }
    let(:characters_guessed) { ['x'] }

    it 'indicates that the guess has already been guessed' do
      expect(response_message).to include('already guessed')
    end
  end

  it 'should return the appropriate message if the input character is present in the word' do

    # Arrange
    guess_validator = instance_double(GuessValidator, :is_valid_input => true)
    sut = GetResponseToGuess.new(guess_validator, 'L', mock_game_state)

    # Assert
    expect(sut.call).to include('appears')

  end

  it 'should return the appropriate message if the input character is not in the word' do

    # Arrange
    guess_validator = instance_double(GuessValidator, :is_valid_input => true)
    sut = GetResponseToGuess.new(guess_validator, 'a', mock_game_state)

    # Assert
    expect(sut.call).to include("doesn't appear")

  end

  it 'should be case insensitive when checking if a character appears in the word' do

    # Arrange
    guess_validator = instance_double(GuessValidator, :is_valid_input => true)
    sut = GetResponseToGuess.new(guess_validator, 'l', mock_game_state)

    # Assert
    expect(sut.call).to include('appears')

  end

end