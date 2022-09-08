require_relative  '../classroom.rb'


describe Classroom do
  before :each do
    @classroom = Classroom.new("Math")
  end

  context "create a new object from classroom class" do
    it 'Create a new classroom' do
      expect(@classroom.label).to eq("Math")
    end
  end
end
