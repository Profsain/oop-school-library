class Xzy  # rubocop:disable Metrics/ClassLength
require 'io/console'
require './book'
require './person'
require './student'
require './teacher'
require './rental'

class App
  def menu
    puts
    puts 'The School Library Menu'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
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
    end
  end

  def run
    choice = 0
    while choice != 7
      menu
      puts
      print 'Please choose an option by entering a number'
      choice = gets.chomp.strip.to_i
      check_menu(choice)
      wait_cont if choice != 7
      puts
    end
  end

  # List all books
  def list_books
    puts '*' * 40
    if @books.empty?
      puts 'The book list is empty. Create new book!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}. Title: #{book.title} Authored by: #{book.author}"
      end
    end
  end

  # Create a book
  def create_book
    puts
    print 'Title: '
    title = gets.chomp.strip.capitalize
    puts
    print 'Author: '
    author = gets.chomp.strip.capitalize
    @books.push(Book.new(title, author))
  end

  # List all people
  def list_people
    puts '*' * 40
    if @people.empty
      puts 'The people list is currently empty'
    else
      @people.each_with_index do |person, index|
        puts "#{index} = #{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # Create a person (teacher or student, not a plain Person)
  def create_person
    puts 'Do you want to create a student record or teacher record?'
    print 'Type 1 to create student or 2 to create teacher: '
    choice = gets.chomp.strip.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  # create student
  def create_student
    puts 'Enter student information'
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 100
      print 'Please input valid age between (1 - 100): '
      age = gets.chomp.strip.to_i
    end
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end
    @people << Student.new(Random.rand(123...1000), age, name, parent_permission: permission)
    puts 'Student created successfully.'
  end

  # create teacher
  def create_teacher
    puts 'Enter teachers record'
    print 'Name: '
    name = gets.chomp.strip.capitalize
    puts
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 100
      print 'Please enter a valid age between (1 - 100): '
      age = gets.chomp.strip.to_i
    end
    @people << Teacher.new(Random.rand(123..1000), age, name, specialization)
    puts 'Teachers record created successfully'
  end

  # Create a rental
  def create_rental
    puts 'New Book Rentals'
    puts 'Select a book from the list below by number'
    list_books
    book_choice = gets.chomp.to_i
    while book_choice.negative? || book_choice >= @books.length
      print "Please enter number between 0 - #{@books.length - 1} range: "
      book_choice = gets.chomp.to_i
    end
    book = "#{@books[book_choice].title} By #{@books[book_choice].author}"
    puts 'Select a person from the list below by number (not id)'
    list_people
    person_choice = gets.chomp.to_i
    while person_choice.negative? || person_choice >= @people.length
      print "Please enter number only between 0 -#{@people.length - 1}: "
      person_choice = gets.chomp.to_i
    end
    person = @people[person_choice].id
    print 'Enter date of booking: (yyyy/mm/dd): '
    date = gets.chomp.strip
    @rentals << Rental.new(date, person, book)
  end

  # List all rentals for a given person id
  def list_rentals
    puts 'Rentals list'
    list_people
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    person_selected = @rentals.select { |rental| rental.permission == person_id }
    puts 'Rentals Info:'

    if person_selected.empty?
      puts "No rentals are found for #{person_id}"
    else
      person_selected.each do |rental|
        puts "Date: #{rental.date} -> Book: #{rental.book}"
      end
    end
  end

  def wait_cont
    print 'Press any key to continue....'
    $stdin.getch
  end
end
