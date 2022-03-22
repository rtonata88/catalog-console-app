require 'rspec'
require_relative '../Classes/author'
require_relative '../Classes/game'

describe 'Author' do
  before :each do
    @test_author = Author.new('First Name', 'Last Name')
    @test_item = Game.new('2001-01-01', true, '2000-01-01')
  end

  it "author's first name is set correctly" do
    expect(@test_author.first_name).to eq 'First Name'
  end

  it "author's last name is set correctly" do
    expect(@test_author.last_name).to eq 'Last Name'
  end

  it 'adds item correctly to its item array' do
    @test_author.add_item(@test_item)
    test_boolean = @test_author.items.include?(@test_item)
    expect(test_boolean).to eq true
  end

  it "adds author in item's properties correctly" do
    @test_author.add_item(@test_item)
    expect(@test_item.author).to eq(@test_author)
  end
end
