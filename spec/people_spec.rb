require_relative  '../person.rb'
require_relative  '../student.rb'
require_relative  '../teacher.rb'

describe 'People Related Classes (Person, Student, Teacher)' do
  context Person do
    person = Person.new(1,18,"John")
    it 'create new person' do
      id = person.id
      age = person.age
      name = person.name
      parent_permission = person.parent_permission
      expect(id).to eq(1)
      expect(age).to eq(18)
      expect(name).to eq("John")
      expect(parent_permission).to be true
    end

    it 'check the age if its >= 18 (private Function)' do
      age_validation = person.send(:of_age?)
      expect(age_validation).to be true
    end
    
    it 'Check if he Can use the service ?' do
      service_use = person.can_use_service
      expect(service_use).to be true
    end

    it 'add rental to person using add_rental function' do
      rental = person.add_rental('2022-09-08', 'The Hobbit')
      expect(rental.person.name).to eq("John") 
      expect(rental.date).to eq("2022-09-08") 
      expect(rental.book).to eq("The Hobbit") 
    end

  end
  
  context Student do
    student = Student.new(1,18,1,"John")

    it 'create new student' do
      id = student.id
      age = student.age
      name = student.name
      classroom = student.classroom.label
      parent_permission = student.parent_permission
      expect(id).to eq(1)
      expect(age).to eq(18)
      expect(name).to eq("John")
      expect(classroom).to eq(1)
      expect(parent_permission).to be true
    end
    it 'testing play_hooky method' do
      hooky = student.play_hooky
      expect(hooky).to eq('¯\(ツ)/¯')
    end
  end
  
  context Teacher do
    teacher = Teacher.new(1,45,"wrestler","John Cena")

    it 'create new teacher' do
      id = teacher.id
      age = teacher.age
      specialization = teacher.specialization
      name = teacher.name
      expect(id).to eq(1)
      expect(age).to eq(45)
      expect(specialization).to eq("wrestler")
      expect(name).to eq("John Cena")
    end

    it 'can use service should be always true' do
      can_use = teacher.can_use_service
      expect(can_use).to be true
    end
  end


end