require './main'

class Decorator < Nameable
  # assign a nameable object from params to an instance variable
  def initialize(nameable)
    @nameable = nameable
  end

  # The Decorator delegates all work to the wrapped component.
  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
end 

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.strip
  end
end