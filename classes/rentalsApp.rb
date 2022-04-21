require_relative '../rental'
class RentalsApp
  attr_accessor :books, :people, :rentals

  def initialize(params)
    @books = params[:books]
    @people = params[:people]
    @rentals = params[:rentals]
  end

  def create_rental()
    # @people.list_all_books
    puts 'Select a book from the following list by the number:'
    @books.each_with_index { |book, index| puts "#{index + 1}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts ' '
    puts 'Select a person from the following list by the number:'
    # list_all_people
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @people[person_number - 1], @books[book_number - 1]))
    puts 'Rental created successfully 😊'
  end

  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Peson: #{rental.person.name}  Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No Rentals found for the given ID'
      end
    end
  end
end
