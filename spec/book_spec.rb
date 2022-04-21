require_relative '../book'

describe Book do
  before(:each) do
    @book = Book.new('title', 'author')
  end

  it 'check for a book object' do
    expect(@book).to be_instance_of(Book)
  end
  it 'check instaces of title and author' do
    expect(@book).to have_attributes(title: 'title')
    expect(@book).to have_attributes(author: 'author')
  end
  it 'add more arguments' do
    expect { Book.new('t', 's', 'a') }.to raise_error(ArgumentError)
  end
end
