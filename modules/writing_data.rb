require './book.rb'

module WriteData

  def write_books
    File.open("./Data/books.json", "w") do |file|
      books_to_store = []
      @books.each do |book| 
         books_to_store << {"title" => book.title, "author" => book.author}
      end
      file.write JSON.generate(books_to_store)
    end
end

  def write_people
    File.open("./Data/people.json", "w") do |file|
      people_to_store = []
      @people.each do |person|
        if person.class == Student
        people_to_store << {"class" => person.class, "name" => person.name, "age" => person.age, "id" => person.id}
      else person.class == Teacher
        people_to_store << {"class" => person.class, "name" => person.name, "age" => person.age, "id" => person.id}
        end
      end
      file.write JSON.generate(people_to_store)
    end
end

  def write_rentals
    File.open("./Data/rentals.json", "w") do |file|
      rentals_to_store = []
      @rentals.each do |rental| 
         rentals_to_store << {"date" => rental.date, "person" => rental.person, "book" => rental.book}
      end
      file.write JSON.generate(rentals_to_store)
    end
end
end

