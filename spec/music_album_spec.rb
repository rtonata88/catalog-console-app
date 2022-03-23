require 'rspec'
require_relative '../Classes/music_album'

describe 'Music album' do
  before :each do
    @test_music_album = MusicAlbum.new('2021-01-01', true)
  end

  it 'sets properties correctly to new instance' do
    date = Date.parse('2021-01-01')
    expect([@test_music_album.publish_date, @test_music_album.on_spotify]).to eq [date, true]
  end

  it 'returns correct value when calling can_be_archived?' do
    expect(@test_music_album.can_be_archived?).to eq false
  end
end
