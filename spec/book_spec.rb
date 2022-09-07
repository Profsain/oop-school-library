require_relative  '../book.rb'


describe Book do
  context "create a new object from book class" do
    it 'Create a new book' do
      book = Book.new("TeamWork", "Our Team")
      title = book.title
      author = book.author
      expect(title).to eq("TeamWork")
      expect(author).to eq("Our Team")
    end
  end
end