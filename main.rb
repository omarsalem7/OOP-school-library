require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './book'
require_relative './rental'

person1 = Person.new(23, 'omar')
person2 = Person.new(85, 'Bob')

book1 = Book.new('How to be sucess', 'omar salem')
book2 = Book.new('The 7 habits', 'John wick')

Rental.new('2018-12-02', person1, book1)
Rental.new('2012-12-31', person2, book1)

p person1.rentals.count # 1
p person1.rentals.map(&:date) # ["2018-12-02"]
p book2.rentals.count # 0
p book1.rentals.count # 2
