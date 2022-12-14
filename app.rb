require 'io/console'
require_relative './modules/book_handle.rb'
require_relative './modules/people_handle.rb'
require_relative './modules/rental_handle.rb'
require_relative './modules/reading_data.rb'

class App
  attr_reader :books, :person

  # people_handle.rb
  include PeopleHandle

  # book handle
  include BookHandle

  # rentals handle
  include RentalHandle

  include ReadData

  def initialize
    @books = []
    @people = []
    @rentals = []
    read_books
    read_people
    read_rentals
  end

  def menu
    puts
    puts '<=> Welcome to Epic School Library <=>'
    puts '    Please enter option number 1 - 7 to begin'
    puts
    puts '    1 - List all books'
    puts '    2 - List all people'
    puts '    3 - Create a person'
    puts '    4 - Create a book'
    puts '    5 - Create a rental'
    puts '    6 - List all rentals for a given person id'
    puts '    7 - Exit'
  end

  def check_menu(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    else
      puts 'Thanks for using this application'
    end
  end

  def run
    choice = 0
    while choice != 7
      menu
      puts
      print 'Please choose an option by entering a number:=> '
      choice = gets.chomp.strip.to_i
      puts "The Menu number entered = #{choice}"
      check_menu(choice)
      wait_cont if choice != 7
      puts
    end
  end

  def wait_cont
    print 'Press any key to continue....'
    STDIN.getch
  end
end
