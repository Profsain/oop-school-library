require 'io/console'
require './rental'
require './modules/book_handle.rb'
require './modules/people_handle.rb'
class App # rubocop:disable Metrics/ClassLength
  attr_reader :books, :person

  # people_handle.rb
  include PeopleHandle

  # book handle 
  include BookHandle

  def initialize
    @books = []
    @people = []
    @rentals = []
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
    puts 'run code start'
    choice = 0
    while choice != 7
      menu
      puts
      print 'Please choose an option by entering a number:=> '
      choice = gets.chomp.strip.to_i
      puts "The Menu number is = #{choice}"
      check_menu(choice)
      wait_cont if choice != 7
      puts
    end
  end

  def wait_cont
    print 'Press any key to continue....'
    $stdin.getc
  end
# ------------------------------------------------------------


  # Create a rental
  def create_rental # rubocop:disable Metrics/MethodLength
    puts 'New Book Rentals. Select a book from the list below by number'
    list_books
    print 'Book choice number:=> '
    book_choice = gets.chomp.to_i
    while book_choice.negative? || book_choice >= @books.length
      print "Please enter number between 0 - #{@books.length - 1} range:=> "
      book_choice = gets.chomp.to_i
    end
    book = "#{@books[book_choice].title} By #{@books[book_choice].author}"
    puts 'Select a person from the list below by number (not id)'
    list_people
    print 'Person choice number:=> '
    person_choice = gets.chomp.to_i
    while person_choice.negative? || person_choice >= @people.length
      print "Please enter number only between 0 -#{@people.length - 1}:=> "
      person_choice = gets.chomp.to_i
    end
    person = @people[person_choice].id
    print 'Enter date of booking: (yyyy/mm/dd):=> '
    date = gets.chomp.strip
    @rentals << Rental.new(date, person, book)
    puts 'Book rental successful (:-:).'
  end

  # List all rentals for a given person id
  def list_rentals
    puts 'Rentals List Generator'
    list_people
    print 'Enter person ID:=> '
    person_id = gets.chomp.to_i
    person_selected = @rentals.select { |rental| rental.person == person_id }
    puts "#{person_id} => Rentals Details."

    if person_selected.empty?
      puts "No rentals are found for #{person_id}"
    else
      person_selected.each do |rental|
        puts "Date: #{rental.date} =>> Book: #{rental.book}"
      end
    end
  end
end
