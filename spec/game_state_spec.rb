require 'spec_helper'
require 'game_state'

describe GameState do
  let (:current_word) { 'hello' }

  subject(:game_state) { described_class.new(current_word) }

  before do
    game_state.add_guess('a')
  end

  it 'should calculate lives remaining correctly' do

    expect(game_state.lives_remaining).to eq(9)
  end
end
