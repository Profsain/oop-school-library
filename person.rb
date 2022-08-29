class Person
  def initialize(name = "Unknown", parent_permission = true, age)
    @id = Random.rand(123..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getter and setter
  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  private
  def is_of_age
    @age >= 18 ? true : false
  end

  public
  def can_use_service
    is_of_age === true || @parent_permission === true ? true : false
  end
end
