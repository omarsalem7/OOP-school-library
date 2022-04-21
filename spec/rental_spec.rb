require_relative '../rental'
require_relative '../book'
require_relative '../teacher'

describe Rental do
  before :each do
    @book = Book.new('book title', 'shery')

    @teacher = Teacher.new('pyhsics', 'das', 27)
    @rental = Rental.new('2022-1-1', @book, @teacher)
  end

  it 'it should return instance' do
    expect(@rental).to be_instance_of Rental
  end

  it 'it should return parameters' do
    expect(@rental.date).to eq('2022-1-1')
    expect(@rental.book.title).to eq('book title')
    expect(@rental.person.name).to eql('shery')
  end
end
