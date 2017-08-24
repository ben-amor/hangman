require 'rspec'
require 'get_response_to_guess'
require 'game_state'
require 'guess_validator'

describe 'GuessResponseFactory' do

  before do
    @mock_game_state = instance_double(GameState,:characters_guessed => Array.new, :current_word => 'Lorem')
  end

  it 'should return the appropriate message if the GuessValidator says the character is invalid' do

    # Arrange
    sut = GetResponseToGuess.new(instance_double(GuessValidator, :is_valid_input => false))

    # Act
    result = sut.get_response_to_guess('', nil)

    # Assert
    expect(result.message).to include('not a valid guess.')

  end

  it 'should return the appropriate message if the game state already contains the guess' do

    # Arrange
    sut = GetResponseToGuess.new(instance_double(GuessValidator, :is_valid_input => true))

    # Act
    result = sut.get_response_to_guess('x', instance_double(GameState,:characters_guessed => Array.new << 'x'))

    # Assert
    expect(result.message).to include('already guessed')

  end

  it 'should return the appropriate message if the input character is present in the word' do

    # Arrange
    sut = GetResponseToGuess.new(instance_double(GuessValidator, :is_valid_input => true))

    # Act
    result = sut.get_response_to_guess('L', @mock_game_state)

    # Assert
    expect(result.message).to include('appears')

  end

  it 'should return the appropriate message if the input character is not in the word' do

    # Arrange
    sut = GetResponseToGuess.new(instance_double(GuessValidator, :is_valid_input => true))

    # Act
    result = sut.get_response_to_guess('a', @mock_game_state)

    # Assert
    expect(result.message).to include("doesn't appear")

  end

  it 'should be case insensitive when checking if a character appears in the word' do

    # Arrange
    sut = GetResponseToGuess.new(instance_double(GuessValidator, :is_valid_input => true))

    # Act
    result = sut.get_response_to_guess('l', @mock_game_state)

    # Assert
    expect(result.message).to include('appears')

  end

end