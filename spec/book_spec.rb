require 'rspec'
require_relative '../Classes/book'
require_relative '../Classes/label'


describe 'Book' do
  before :each do
    @test_book = Book.new('Publisher', 'Cover State', '2001-01-01')
    @test_label = Label.new('title','color')
  end

  it "book's name is set correctly" do
    expect(@test_book.publisher).to eq 'Publisher'
  end

  it "book's cover state is set correctly" do
    expect(@test_book.cover_state).to eq 'Cover State'
  end

  it 'adds label correctly to its book array' do
    @test_label.add_item(@test_book)
    test_boolean = @test_label.items.include?(@test_book)
    expect(test_boolean).to eq true
  end

  it "adds book in item's properties correctly" do
    @test_label.add_item(@test_book)
    expect(@test_book.label).to eq(@test_label)
  end
end
