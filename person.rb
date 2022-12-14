require_relative  './nameable'
require_relative  './capitalize_decorator'
require_relative  './trimmer_decorator'
require_relative  './rental'

class Person < Nameable
  # getter and setter
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

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

  def add_rental(date, book)
    rental = Rental.new(date, self, book)
    @rentals << rental
  end
end
