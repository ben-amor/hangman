require 'rspec'
require 'guess_validator'

describe 'GuessValidator' do

  ['a', 'b'].each do |char|
    it 'should return true for alpha characters' do

      # Arrange
      sut = GuessValidator.new

      # Act
      result = sut.is_valid_input(char)

      # Assert
      expect(result).to be_truthy
    end
  end

  ['A', 'B'].each do |char|
    it 'should be case insensitive' do

      # Arrange
      sut = GuessValidator.new

      # Act
      result = sut.is_valid_input(char)

      # Assert
      expect(result).to be_truthy

    end
  end

  ['1', ' ', ','].each do |char|
    it 'should return false for non alpha characters' do

    # Arrange
    sut = GuessValidator.new

    # Act
    result = sut.is_valid_input(char)

    # Assert
    expect(result).to be_falsy

    end
  end
end