require_relative  './nameable'

class Decorator < Nameable
  attr_reader :nameable
  # assign a nameable object from params to an instance variable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # The Decorator delegates all work to the wrapped component.
  def correct_name
    @nameable.correct_name
  end
end
