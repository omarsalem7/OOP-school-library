require_relative '../book'
require 'json'

class BooksApp
  attr_accessor :books

  def initialize
    file = File.read('./books.json')
    @books =file.size.zero? ? [] : JSON.parse(file)
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    book=Book.new(title, author)
    @books << book
    # load data
    data= load_data
    data.push({'title':title,"author":author})
    File.write('./books.json', JSON.dump(data))
    puts "#{title} book added successfully 😊"
  end

  def list_all_books
    data=load_data
    puts 'No books found' if data.empty?
    data.each_with_index do |book, index|
      puts "(#{index + 1}) Book => Title: #{book["title"]}, Author: #{book["author"]}"
    end
  end

  private 
  def load_data
    file = File.read('./books.json')
    data_hash = JSON.parse(file)
  end
end
