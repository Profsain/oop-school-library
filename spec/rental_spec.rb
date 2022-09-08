require_relative  '../rental.rb'

  describe Rental do
    it 'Create a new rental' do	
      @rental = Rental.new('2022-01-01', 'John Doe', 'The Hobbit')
      expect(@rental.date).to eq('2022-01-01')
      expect(@rental.person).to eq('John Doe')
      expect(@rental.book).to eq('The Hobbit')
    end

    describe '#new' do
      it 'take 3 parameters and reutrn a Rental object' do
        @rental = Rental.new('2022-01-01', 'John Doe', 'The Hobbit')
        expect(@rental).to be_an_instance_of(Rental)
      end
    end
  end
