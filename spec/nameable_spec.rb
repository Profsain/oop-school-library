require_relative  '../nameable.rb'

describe Nameable do
  it 'should Raise an error' do
    cls = Nameable.new
    expect { cls.correct_name('Name') }.to raise_error(NotImplementedError)
  end
end
