require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name # => maximilianus

capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name # => MAXIMILIANUS

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name # => MAXIMILIAN
