require './person.rb'
require './capitalize_decorator.rb'
require './trimmer_decorator.rb'

person = Person.new(22, 'maximilianus')
person.correct_name # => maximilianus

capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name # => MAXIMILIANUS

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
capitalizedTrimmedPerson.correct_name # => MAXIMILIAN
