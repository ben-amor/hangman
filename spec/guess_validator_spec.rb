require 'spec_helper'
require 'guess_validator'

describe GuessValidator do

  subject(:guess_validator){described_class.new}

  ['a', 'b'].each do |char|
    it 'should return true for alpha characters' do
      expect(guess_validator.is_valid_input(char)).to be_truthy
    end
  end

  ['A', 'B'].each do |char|
    it 'should be case insensitive' do
      expect(guess_validator.is_valid_input(char)).to be_truthy
    end
  end

  ['1', '\\', '/'].each do |char|
    it 'should return false for non alpha characters' do
      expect(guess_validator.is_valid_input(char)).to be_falsey
    end
  end

  [' ', ',', '.', '!', '?'].each do |char|
    it 'should allow spaces and punctuation' do
      expect(guess_validator.is_valid_input(char)).to be_truthy
    end
  end
end
