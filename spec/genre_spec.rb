require 'rspec'
require_relative '../Classes/genre'
require_relative '../Classes/music_album'

describe 'Genre' do
  before :each do
    @test_genre = Genre.new('Hiphop')
    @test_item = MusicAlbum.new('2001-01-01', true)
  end

  it 'Genre name is set correctly' do
    expect(@test_genre.name).to eq 'Hiphop'
  end

  it 'adds item correctly to its item array' do
    @test_genre.add_item(@test_item)
    test_boolean = @test_genre.items.include?(@test_item)
    expect(test_boolean).to eq true
  end

  it "adds genre in item's properties correctly" do
    @test_genre.add_item(@test_item)
    expect(@test_item.genre).to eq(@test_genre)
  end
end
