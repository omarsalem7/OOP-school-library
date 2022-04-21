require_relative '../student'
require_relative '../teacher'

class PeopleApp
  attr_accessor :people

  def initialize(people)
    @people = people
  end

  def list_all_people
    puts 'No people exist' if @people.empty?
    @people.each_with_index do |person, index|
      puts "(#{index + 1}) [#{person.class}] => Name: #{person.name}, Age: #{person.age}, Id: #{person.id}"
    end
  end

  def create_person()
    puts 'Do you want create student (1) or teacher (2)? [Enter the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      print 'Enter student name: '
      name = gets.chomp
      print 'Enter age: '
      age = gets.chomp
      @people.push(Student.new('classroom', age, name))
      puts "#{name.capitalize} added successfully 💓"
    when 2
      print 'Enter teacher name: '
      name = gets.chomp
      print 'Enter age: '
      age = gets.chomp
      print 'Enter specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(specialization, age, name))
      puts "#{name.capitalize} added successfully 💓"
    end
  end
end
