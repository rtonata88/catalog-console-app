require 'rspec'
require_relative '../Classes/game.rb'

describe "Game" do

    before :each do
        @test_game = Game.new('2021-01-01', true, '2020-01-01')
    end

    it "sets properties correctly to new instance" do
        expect([@test_game.multiplayer, @test_game.last_played_at.to_s]).to eq [true, '2020-01-01']
    end

    it "returns correct value when calling can_be_archived?" do
        expect(@test_game.can_be_archived?).to eq false
    end
    
end