class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # method to add students to collection
  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
