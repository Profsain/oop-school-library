require './person.rb'

class Teacher < Person
  def initialize(name, age, specialization)
    super
    @specialization = specialization
  end

  def can_use_service
    true
  end
end