require 'rspec'
require_relative '../Classes/book'
require_relative '../Classes/label'

describe 'Label' do
  before :each do
    @test_book = Book.new('Publisher', 'Cover State', '2001-01-01')
    @test_label = Label.new('Title','color')
  end

  it 'Label title is set correctly' do
    expect(@test_label.title).to eq 'Title'
  end

  it 'adds item correctly to its label array' do
    @test_label.add_item(@test_book)
    test_boolean = @test_label.items.include?(@test_book)
    expect(test_boolean).to eq true
  end

  it "adds label in item's properties correctly" do
    @test_label.add_item(@test_book)
    expect(@test_book.label).to eq(@test_label)
  end
end
