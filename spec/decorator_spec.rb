
require_relative  '../decorator.rb'
require_relative  '../capitalize_decorator.rb'
require_relative  '../trimmer_decorator.rb'
require_relative  '../person.rb'

describe "Decorator design pattern Classes" do
    $person = Person.new(1,18,"mohammedraad")

    context CapitalizeDecorator do
    it 'capitalize the name' do
      capitalize_decorator = CapitalizeDecorator.new($person)
      name = capitalize_decorator.correct_name
      expect(name).to eq("Mohammedraad")
    end
  end

  context TrimmerDecorator do
    it 'trim the name, limited to 10 char' do
      trimmer_class = TrimmerDecorator.new($person)
      name = trimmer_class.correct_name
      expect(name).to eq("mohammedra")
    end
  end
end