require './person'
require './book'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
