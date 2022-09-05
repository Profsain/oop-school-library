require './rental.rb'

module RentalHandle
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