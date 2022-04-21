require_relative '../student'
require_relative '../teacher'
require 'json'

class PeopleApp
  attr_accessor :people

  def initialize
    file = File.read('./people.json')
    @people =JSON.parse(file, {symbolize_names: true})
    # file = File.open('./people.json', 'a+')
    # @people = file.size.zero? ? [] : JSON.parse(file.read)
    # file.close
  end

  def list_all_people
    puts 'No people exist' if @people.empty?
    @people.each_with_index do |person, index|
      puts "(#{index + 1}) [#{person[:class]}] => Name: #{person[:name]}, Age: #{person[:age]}, Id: #{person[:id]}"
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
      student=Student.new('classroom', age, name)
      
      data=load_data
      newPerson={:class=>student.class,:id=>student.id,:age=>age,:name=>name,:parent_permission=>student.parent_permission}
      @people.push(newPerson)
      data.push(newPerson)
      File.write('./people.json', JSON.dump(data))
      puts "#{name.capitalize} added successfully 💓"
    when 2
      print 'Enter teacher name: '
      name = gets.chomp
      print 'Enter age: '
      age = gets.chomp
      print 'Enter specialization: '
      specialization = gets.chomp
      teacher=Teacher.new(specialization, age, name)
      data=load_data
      newPerson={:class=>"teacher",:id=>teacher.id,:age=>age,:name=>name,:specialization=>specialization,:parent_permission=>teacher.parent_permission}
      @people.push(newPerson)
      data.push(newPerson)
      File.write('./people.json', JSON.dump(data))
      puts "#{name.capitalize} added successfully 💓"
    end
  end

  private 
  def load_data
    file = File.read('./people.json')
    data_hash = JSON.parse(file)
  end

end
