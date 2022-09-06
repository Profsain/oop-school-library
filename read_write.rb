# read file
File.open("jsonfiles/employee.txt", "r") do |file|
  file.each_line do |line|
    puts line
  end
end

# write file
File.open("jsonfiles/employee.txt", "r+") do |file|
  file.puts "\nYusuf, Director"
end