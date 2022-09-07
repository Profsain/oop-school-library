require './book.rb'
require './student.rb'
require './teacher.rb'
require './rental.rb'

module ReadData

  def read_books
    File.open("./Data/books.json", "r") do |file|
      if file.size() == 0 
        return
    end
    stored_books = JSON.parse(file.read)
    stored_books.each { |book_stored| @books << Book.new(book_stored["title"], book_stored["author"]) }
  end
end

  def read_people
    File.open("./Data/people.json", "r") do |file|
      if file.size() == 0 
        return
      end
    stored_people = JSON.parse(file.read)
    stored_people.each do |person_stored| 
      if person_stored["class"] === 'Student'
        new_student = Student.new(person_stored["id"], person_stored["age"],1, person_stored["name"]) 
        @people << new_student
      elsif person_stored["class"] === 'Teacher'
        new_teacher = Teacher.new(person_stored["id"], person_stored["age"],person_stored["specialization"],person_stored["name"]) 
        @people << new_teacher
    end
  end
end

def read_rentals
  File.open("./Data/rentals.json", "r") do |file|
    if file.size() == 0 
      return
  end
  stored_rentals = JSON.parse(file.read)
  stored_rentals.each { |rental| @rentals << Rental.new(rental["date"], rental["person"], rental["book"]) }
end
end
end

end