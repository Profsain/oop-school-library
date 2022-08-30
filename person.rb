require './main'
require './decorator'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(123..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getter and setter
  attr_reader :id
  attr_accessor :name, :age

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_service
    of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end
end

person = Person.new(22, ' profsain  ')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_Trimmed_Person = TrimmerDecorator.new(capitalized_person)
puts capitalized_Trimmed_Person.correct_name
