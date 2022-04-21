require_relative './book'
require_relative './rental'

################################################################
require_relative './classes/booksApp'
require_relative './classes/peopleApp'
require_relative './classes/rentalsApp'
################################################################
class App
  def initialize
    @people = []
    @rentals = []
    @books = []
    @rentals = RentalsApp.new({ rentals: @rentals, people: @people, books: @books })
    @books = BooksApp.new(@books)
    @people = PeopleApp.new(@people)
  end

  def main_menu
    puts ' '
    puts 'Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit'
    puts ' '
  end

  def menu_selection
    main_menu
    selection = gets.chomp.to_i
    case selection
    when 1
      @books.list_all_books
    when 2
      @people.list_all_people
    when 3
      @people.create_person
    when 4
      @books.create_book
    when 5
      @rentals.create_rental
    when 6
      @rentals.list_all_rentals
    when 7
      puts 'bye bye see you later 👋'
      exit
    end
    menu_selection
  end
end
