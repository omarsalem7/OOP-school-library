require_relative '../book'

class BooksApp
  attr_accessor :books

  def initialize(books)
    @books = books
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "#{title} book added successfully 😊"
  end

  def list_all_books
    puts 'No books found' if @books.empty?
    @books.each_with_index do |book, index|
      puts "(#{index + 1}) Book => Title: #{book.title}, Author: #{book.author}"
    end
  end
end
