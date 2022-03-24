require 'rspec'
require_relative '../Classes/game'

describe 'Game' do
  before :each do
    @test_game = Game.new(true, '2000-01-01', '2001-01-01')
  end

  it 'sets properties correctly to new instance' do
    expect([@test_game.multiplayer, @test_game.last_played_at.to_s]).to eq [true, '2000-01-01']
  end

  it 'returns correct value when calling can_be_archived?' do
    expect(@test_game.can_be_archived?).to eq true
  end
end
