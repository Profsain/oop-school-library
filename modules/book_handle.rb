require './book.rb'
require './modules/writing_data'
require 'json'
module BookHandle
  include WriteData
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
    write_books
    puts "Title: #{title} - Author: #{author}. Created successfully!"
  end
  
end
