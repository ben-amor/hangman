require 'rspec'
require 'game_state'

describe 'GameState' do

  it 'should calculate lives remaining correctly' do

    # Arrange
    sut = GameState.new('hello')
    sut.add_guess_if_guess_is_valid('a')

    # Act
    result = sut.lives_remaining

    # Assert
    expect(result).to eq(9)

    end
  end