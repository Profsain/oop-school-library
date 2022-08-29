class Person
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
    is_of_age? || @parent_permission == true
  end
end
