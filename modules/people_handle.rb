require './student.rb'
require './teacher.rb'

module PeopleHandle
    # List all people
    def list_people
      puts '*' * 40
      if @people.empty?
        puts 'The people list is currently empty'
      else
        @people.each_with_index do |person, index|
          puts "#{index} = #{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  
    # Create a person (teacher or student, not a plain Person)
    def create_person
      puts 'Do you want to create a student record or teacher record?'
      print 'Type 1 to create student or 2 to create teacher:=> '
      choice = gets.chomp.strip.to_i
      case choice
      when 1
        create_student
      when 2
        create_teacher
      end
    end
  
    # create student
    def create_student
      puts 'Enter student information'
      print 'Name:=> '
      name = gets.chomp.strip.capitalize
      print 'Age:=> '
      age = gets.chomp.strip.to_i
      while age <= 0 || age >= 100
        print 'Please enter valid age in number between (1 - 100):=> '
        age = gets.chomp.strip.to_i
      end
      print 'Has parent permission? Enter [Y/N]:=> '
      permission = gets.chomp.strip.upcase
      case permission
      when 'Y'
        permission = true
      when 'N'
        permission = false
      end
      @people << Student.new(Random.rand(123...1000), age, nil, name, parent_permission: permission)
      puts 'Student created successfully (:-:).'
    end
  
    # create teacher
    def create_teacher
      puts 'Enter teacher\'s record'
      print 'Name:=> '
      name = gets.chomp.strip.capitalize
      puts
      print 'Specialization:=> '
      specialization = gets.chomp.strip.capitalize
      print 'Age:=> '
      age = gets.chomp.strip.to_i
      while age <= 0 || age >= 100
        print 'Please enter a valid age number between (1 - 100):=> '
        age = gets.chomp.strip.to_i
      end
      @people << Teacher.new(Random.rand(123..1000), age, specialization, name)
      puts 'Teachers record created successfully (:-:).'
    end
end
